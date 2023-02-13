import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 223, 234, 244),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(0, -75),
                  child: Container(
                    alignment: const Alignment(-0.82, 0),
                    child: const Text(
                      'Suggestions',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -60),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 234, 244),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.purple,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: const Alignment(-0.85, 0),
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: const Offset(20, 0),
                              child: const Text(
                                "Bug Report",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(195, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -55),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 234, 244),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.purple,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: const Alignment(-0.85, 0),
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: const Offset(20, 0),
                              child: const Text(
                                "Request",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(218.5, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Transform.translate(
                  offset: const Offset(0, -40),
                  child: Container(
                    alignment: const Alignment(-0.8, 0),
                    child: const Text(
                      'Screen Settings',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -25),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      width: 400,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 223, 234, 244),
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.purple,
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(4, 4),
                          ),
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: Offset(-4, -4),
                          ),
                        ],
                      ),
                      child: Container(
                        alignment: const Alignment(-0.85, 0),
                        child: Row(
                          children: [
                            Transform.translate(
                              offset: const Offset(19, 0),
                              child: const Text(
                                "Dark Mode is still in development",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(196.5, 0),
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: Colors.purple,
                              ),
                            ),
                          ],
                        ),
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
