import 'package:flutter/material.dart';
import 'package:secondlife_mobile/PageViewHolder.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageStorageBucket bucket = PageStorageBucket();

  late PageViewHolder holder;
  late PageController _controller;
  double fraction =
      0.57; // By using this fraction, we're telling the PageView to show the 50% of the previous and the next page area along with the main page

  @override
  void initState() {
    super.initState();
    holder = PageViewHolder(value: 2.0);
    _controller = PageController(initialPage: 2, viewportFraction: fraction);
    _controller.addListener(() {
      holder.setValue(_controller.page);
    });
  }

  int index = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 223, 234, 244),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text('AppBar'),
          /*leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],*/
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 70,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    'Playlist for you',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ChangeNotifierProvider<PageViewHolder>.value(
                        value: holder,
                        child: PageView.builder(
                            controller: _controller,
                            itemCount: 4,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return MyPage(
                                number: index.toDouble(),
                                fraction: fraction,
                              );
                            }),
                      ),
                    ),
                  ),
                ),
                //const SizedBox(height: 2.0),
                ////Your Playlist of the week text
                Transform.translate(
                  offset: const Offset(0, -70),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      'Playlist of the week',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: SizedBox(
                                      height: 160.0,
                                      width: 200.0,
                                      child: Image.asset(
                                        'assets/images/album1.jpg',
                                        height: 160.0,
                                        width: 200.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: SizedBox(
                                      height: 160.0,
                                      width: 200.0,
                                      child: Image.asset(
                                        'assets/images/album2.jpg',
                                        height: 160.0,
                                        width: 200.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: SizedBox(
                                      height: 160.0,
                                      width: 200.0,
                                      child: Image.asset(
                                        'assets/images/album3.jpg',
                                        height: 160.0,
                                        width: 200.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: SizedBox(
                                      height: 160.0,
                                      width: 200.0,
                                      child: Image.asset(
                                        'assets/images/album4.jpg',
                                        height: 160.0,
                                        width: 200.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Ink(
                                    child: SizedBox(
                                      height: 160.0,
                                      width: 200.0,
                                      child: Image.asset(
                                        'assets/images/album5.jpg',
                                        height: 160.0,
                                        width: 200.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPage extends StatelessWidget {
  final number;
  final double? fraction;

  const MyPage({super.key, this.number, this.fraction});

  @override
  Widget build(BuildContext context) {
    double? value = Provider.of<PageViewHolder>(context).value;
    double diff = (number - value);
    // diff is negative = left page
    // diff is 0 = current page
    // diff is positive = next page

    //Matrix for Elements
    final Matrix4 pvMatrix = Matrix4.identity()
      ..setEntry(3, 2, 1 / 0.9) //Increasing Scale by 90%
      ..setEntry(1, 1, fraction!) //Changing Scale Along Y Axis
      ..setEntry(3, 0, 0.004 * -diff); //Changing Perspective Along X Axis

    final Matrix4 shadowMatrix = Matrix4.identity()
      ..setEntry(3, 3, 1 / 1.6) //Increasing Scale by 60%
      ..setEntry(3, 1, -0.004) //Changing Scale Along Y Axis
      ..setEntry(3, 0, 0.002 * diff) //Changing Perspective along X Axis
      ..rotateX(1.309); //Rotating Shadow along X Axis

    return Stack(
      fit: StackFit.expand,
      alignment: FractionalOffset.center,
      children: [
        Transform.translate(
          offset: const Offset(0.0, -47.5),
          child: Transform(
            transform: pvMatrix,
            alignment: FractionalOffset.center,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 11.0,
                  spreadRadius: 4.0,
                  offset: const Offset(
                      13.0, 35.0), // shadow direction: bottom right
                )
              ]),
              child: Image.asset(
                  "assets/images/image_${number.toInt() + 1}.jpg",
                  fit: BoxFit.fill),
            ),
          ),
        ),
      ],
      /*children: const <Widget>[
        if (diff <= 1.0 && diff >= -1.0) ...[
          AnimatedOpacity(
            duration: const Duration(milliseconds: 100),
            opacity: 1 - diff.abs(),
            child: Transform(
              transform: shadowMatrix,
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 1.0)
                ]),
              ),
            ),
          ),
        ],
      ],*/
    );
  }
}
