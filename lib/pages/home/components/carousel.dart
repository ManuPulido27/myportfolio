import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

  tForward() {
    if (mounted) {
      controller.forward();
    }
  }

  animationFunc() async {
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.elasticInOut)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 3))
              .then((value) => controller.reverse());
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(Duration(seconds: 3)).then((value) => tForward());
        }
      });
    Future.delayed(Duration(seconds: 3));
    tForward();
  }

  @override
  void initState() {
    super.initState();
    animationFunc();
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
            child: Container(
              constraints: BoxConstraints(
                minHeight: carouselContainerHeight,
              ),
              child: ScreenHelper(
                // Responsive views
                desktop:
                    _buildDesktop(context, textWidget(), animation, controller
                        //carouselItems[index].image,
                        ),
                tablet: _buildTablet(context, textWidget(), animation
                    //carouselItems[index].image,
                    ),
                mobile: _buildMobile(
                  context,
                  textWidget(),
                  //carouselItems[index].image,
                ),
              ),
            ) /*CarouselSlider(
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
            ),*/
            ,
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

Widget textWidget() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 18.0,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white70,
              radius: 100,
              backgroundImage: AssetImage('circle-cropped.png'),
            ),
            SizedBox(
              width: 20,
            ),
            AutoSizeText(
              "MANUEL\n PULIDO",
              minFontSize: 40,
              maxFontSize: 50,
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30.0,
        ),
        Text(
          "Jr. Flutter developer, based in Milano",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 20.0,
            height: 1.0,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          child: Wrap(
            children: [
              Text(
                "Experience working on freelance and startup contexts",
                style: TextStyle(
                  color: kCaptionColor,
                  fontSize: 17.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Text(
          "Economics student",
          style: TextStyle(
            color: kCaptionColor,
            fontSize: 17.0,
            height: 1.0,
          ),
        ),
        SizedBox(
          height: 25.0,
        ),
        /* Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.white,
                      height: 50,
                      child: Image.asset('linkedin.png'),
                    ),
                  )),
            ),
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: 50,
                    child: Image.asset('github-sign.png'),
                  )),
            ),
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      child: Image.asset('playstoree.png'),
                    ),
                  )),
            ),
            SizedBox(
              width: 25.0,
            ),
            GestureDetector(
              onTap: () {},
              child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      height: 50,
                      child: Image.asset('applee.png'),
                    ),
                  )),
            ),
          ],
        ),*/
      ],
    ),
  );
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
