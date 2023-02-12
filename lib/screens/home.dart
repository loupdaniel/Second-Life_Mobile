import 'package:flutter/material.dart';
import 'package:secondlife_mobile/PageViewHolder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri(scheme: "https", host: url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.inAppWebView,
    )) {
      throw 'Can not launch url';
    }
  }

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

  int currentIndex = 0;

  List<String> images = [
    "https://i.ytimg.com/vi/PWADVtWyE9Q/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDcneFqOxHd28mCncQxT3jOErmk9Q",
    "https://i.ytimg.com/vi/djzDWMy1z7k/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCHwD_IA2ERzpZVxNvxCEOGr4fyTw",
    "https://i.ytimg.com/vi/n8OxyKNBsuQ/hqdefault.jpg?sqp=-oaymwEcCOADEI4CSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAtW45_cxRqEWfUVw19UMts_9Q0lQ",
    "https://i.ytimg.com/vi/7bDFD_WcU9I/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAsgAH6VRN4w0HKtVc528WA5QSZ2w",
    "https://i.ytimg.com/vi/_ABk7TmjnVk/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAxCeIml0HUbjJ3igi1FFe1esdwdg",
    "https://i.ytimg.com/vi/-8m0XFea2zE/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDBOBRGDJeDjhT1HbRobSN2Tp6hMA",
    "https://i.ytimg.com/vi/mXLS2IzZSdg/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB_gmAAtAFigIMCAAQARhdIFsoZTAP&rs=AOn4CLDS13MjaIBxjjhccIktpAb0azBG9g",
    "https://i.ytimg.com/vi/HuzlYAMwwJY/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCmfMS9RENZuIJMQ8k2cf6MbHIpug",
    "https://i.ytimg.com/vi/-nt_u4vo-DI/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAgUinltWhU-qqmgc_JroDLPt3OEg",
    "https://i.ytimg.com/vi/tqtZIyN_Alg/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLD4woxvyiNXgmSile7PLz7uoRPQOQ",
  ];

  final PageController controller = PageController();

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
                  height: 30,
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
                Transform.translate(
                  offset: const Offset(0, -85),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Text(
                      'Watch videos',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                //https://www.youtube.com/watch?v=7a_RXHOkJLM
                //https://github.com/Programmer9211/Flutter-Carousel-Slider/blob/main/lib/main.dart
                Transform.translate(
                  offset: const Offset(0, -65),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 162,
                          width: 335,
                          child: PageView.builder(
                            controller: controller,
                            onPageChanged: (index) {
                              setState(() {
                                currentIndex = index % images.length;
                              });
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 35),
                                child: SizedBox(
                                  height: 100,
                                  width: 400,
                                  child: Image.network(
                                    images[index % images.length],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      /*const SizedBox(
                        height: 20,
                      ),*/
                      /*Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var i = 0; i < images.length; i++)
                            buildIndicator(currentIndex == i)
                        ],
                      ),*/
                      /*Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.jumpToPage(currentIndex - 1);
                              },
                              icon: const Icon(Icons.arrow_back),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.jumpToPage(currentIndex + 1);
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ),
                ),
                ////Your Playlist of the week text
                Transform.translate(
                  offset: const Offset(0, -30),
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
                  offset: const Offset(0, -15),
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
                                GestureDetector(
                                  onTap: () {
                                    _launchURL("www.google.com");
                                  },
                                  child: SizedBox(
                                    height: 180.0,
                                    width: 220.0,
                                    child: Image.asset(
                                      'assets/images/album1.jpg',
                                      height: 180.0,
                                      width: 220.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _launchURL("www.google.com");
                                  },
                                  child: SizedBox(
                                    height: 180.0,
                                    width: 220.0,
                                    child: Image.asset(
                                      'assets/images/album2.jpg',
                                      height: 180.0,
                                      width: 220.0,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _launchURL("www.google.com");
                                  },
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
                                const SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _launchURL("www.google.com");
                                  },
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
                                const SizedBox(
                                  width: 30,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _launchURL("www.google.com");
                                  },
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

  /*Widget buildIndicator(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: Container(
        height: isSelected ? 12 : 10,
        width: isSelected ? 12 : 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Colors.black : Colors.grey,
        ),
      ),
    );
  }*/
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
