import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:my_tradebook/screens/intro/pages/page_one.dart';
import 'package:my_tradebook/screens/intro/pages/page_two.dart';
import 'package:my_tradebook/screens/login/screen_login.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenIntro extends StatefulWidget {
  ScreenIntro({super.key});

  @override
  State<ScreenIntro> createState() => _ScreenIntroState();
}

class _ScreenIntroState extends State<ScreenIntro> {
  final _pageController = PageController(initialPage: 0);
  int pageNumer = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: _onPageChanged,
          controller: _pageController,
          children: [PageOne(), PageTwo()],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                        visible: (pageNumer == 0) ? true : false,
                        child: SizedBox(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: ((ctx) => ScreenLogin())));
                                },
                                child: Text(
                                  'Skip >>',
                                  style: TextStyle(color: Colors.grey),
                                )))),
                    // SmoothPageIndicator(
                    //     effect:
                    //         SlideEffect(radius: 20, dotWidth: 8, dotHeight: 8),
                    //     controller: _pageController,
                    //     count: 2),
                    (pageNumer == 0)
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              setState(() {
                                _pageController.nextPage(
                                    duration: Duration(microseconds: 300),
                                    curve: Curves.ease);
                              });
                            },
                            child: Text('Next'),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: ((ctx) => ScreenLogin())));
                            },
                            child: Text('Lets Start'),
                          ),
                  ]),
            ),
          ),
        ),
        // Align(
        //   alignment: Alignment.bottomRight,
        //   child: Padding(
        //     padding: const EdgeInsets.only(right: 20, bottom: 35),
        //     child: (pageNumer == 0)
        //         ? ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20))),
        //             onPressed: () {
        //               setState(() {
        //                 _pageController.nextPage(
        //                     duration: Duration(microseconds: 300),
        //                     curve: Curves.ease);
        //               });
        //             },
        //             child: Text('Next'),
        //           )
        //         : ElevatedButton(
        //             style: ElevatedButton.styleFrom(
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(20))),
        //             onPressed: () {
        //               Navigator.of(context).push(
        //                   MaterialPageRoute(builder: ((ctx) => ScreenLogin())));
        //             },
        //             child: Text('Lets go'),
        //           ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.bottomLeft,
        //   child: Visibility(
        //       visible: (pageNumer == 0) ? true : false,
        //       child: Padding(
        //         padding: const EdgeInsets.only(left: 20, bottom: 35),
        //         child: SizedBox(
        //             child: TextButton(
        //                 onPressed: () {
        //                   Navigator.of(context).push(MaterialPageRoute(
        //                       builder: ((ctx) => ScreenLogin())));
        //                 },
        //                 child: Text('Skip >>'))),
        //       )),
        // ),
        Padding(
          padding: const EdgeInsets.only(right: 20, bottom: 52),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SmoothPageIndicator(
                effect: SlideEffect(radius: 20, dotWidth: 8, dotHeight: 8),
                controller: _pageController,
                count: 2),
          ),
        ),
      ],
    ));
  }

  void _onPageChanged(int page) {
    setState(() {
      pageNumer = page;
    });
  }
}