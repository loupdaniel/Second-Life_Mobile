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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('AppBar'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search_outlined),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 92.5,
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
                const SizedBox(height: 35),
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
                const SizedBox(height: 2.0),
                ////Your Playlist of the week text
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Text(
                    'Playlist of the week',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
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
