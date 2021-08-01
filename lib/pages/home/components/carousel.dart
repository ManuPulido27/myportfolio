import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/pages/home/components/carousel_items.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

class Carousel extends StatefulWidget {
  @override
  _CarouselState createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> with TickerProviderStateMixin {
  final CarouselController carouselController = CarouselController();

  late Animation<double> animation;
  late AnimationController controller;
  late Animation<double> animation2;
  late AnimationController controller2;

  animationFunc() async {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 3))
              .then((value) => controller.reverse());
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(Duration(seconds: 3))
              .then((value) => controller.forward());
        }
      });
    Future.delayed(Duration(seconds: 3));
    controller.forward();
  }

  @override
  void initState() {
    super.initState();
    animationFunc();

    /*controller2 = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 5000),
    );

    controller2.forward();
    controller2.addListener(() {
      setState(() {
        if (controller2.status == AnimationStatus.completed) {
          controller.repeat();
        } else if (controller2.status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });
    });*/
  }

  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return Container(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                // autoPlay: true,
                viewportFraction: 1,
                scrollPhysics: NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                carouselItems.length,
                (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                      constraints: BoxConstraints(
                        minHeight: carouselContainerHeight,
                      ),
                      child: ScreenHelper(
                        // Responsive views
                        desktop: _buildDesktop(context,
                            carouselItems[index].text, animation, controller
                            //carouselItems[index].image,
                            ),
                        tablet: _buildTablet(
                            context, carouselItems[index].text, animation
                            //carouselItems[index].image,
                            ),
                        mobile: _buildMobile(
                          context,
                          carouselItems[index].text,
                          //carouselItems[index].image,
                        ),
                      ),
                    );
                  },
                ),
              ).toList(),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

// Big screens
Widget _buildDesktop(BuildContext context, Widget text,
    Animation<double> animation, AnimationController controller) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                child: AnimatedLogo(animation: animation)),
          )
        ],
      ),
    ),
  );
}

class AnimatedLogo extends AnimatedWidget {
  const AnimatedLogo({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.7, end: 0.9);
  static final _sizeTween = Tween<double>(begin: 300, end: 350);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: const FlutterLogo(
            style: FlutterLogoStyle.stacked,
          ),
        ),
      ),
    );
  }
}

// Mid screens
Widget _buildTablet(
    BuildContext context, Widget text, Animation<double> animation) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child: Row(
        children: [
          Expanded(
            child: text,
          ),
          Expanded(
            child: AnimatedLogo(animation: animation),
          )
        ],
      ),
    ),
  );
}

// SMall Screens

Widget _buildMobile(BuildContext context, Widget text) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: text,
  );
}
