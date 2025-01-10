import 'package:expenz_app/data/onbording_data.dart';
import 'package:expenz_app/screens/user_data_screen.dart';
import 'package:expenz_app/screens/onbording/front_page.dart';
import 'package:expenz_app/screens/onbording/shared_screen.dart';
import 'package:expenz_app/utils/colors.dart';
import 'package:expenz_app/utils/constants.dart';

import 'package:expenz_app/widgets/coustom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();

  bool showHomePage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(kDefalutPadding),
        child: Stack(children: [
          PageView(
            controller: _controller,
            onPageChanged: (value) {
              setState(() {
                showHomePage = value == 3;
              });
            },
            children: [
              FrontPage(),
              SharedScreen(
                imgUrl: OnbordingData().onbordingDataList[0].imgUrl,
                title: OnbordingData().onbordingDataList[0].title,
                discription: OnbordingData().onbordingDataList[0].discription,
              ),
              SharedScreen(
                imgUrl: OnbordingData().onbordingDataList[1].imgUrl,
                title: OnbordingData().onbordingDataList[1].title,
                discription: OnbordingData().onbordingDataList[1].discription,
              ),
              SharedScreen(
                imgUrl: OnbordingData().onbordingDataList[2].imgUrl,
                title: OnbordingData().onbordingDataList[2].title,
                discription: OnbordingData().onbordingDataList[2].discription,
              ),
            ],
          ),
          Positioned(
              bottom: 75,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                    controller: _controller,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (showHomePage) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => UserDataScreen(),
                        ));
                      } else {
                        _controller.animateToPage(_controller.page!.toInt() + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut);
                      }
                    },
                    child: CoustomButton(
                      butText: showHomePage ? "Get Started" : "Next",
                      color: kMainColor,
                      textColor: kWhite,
                    ),
                  )
                ],
              ))
        ]),
      ),
    );
  }
}
