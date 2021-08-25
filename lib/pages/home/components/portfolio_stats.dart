import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/stat.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/stat.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

final List<Stat> stats = [
  Stat(count: "2", text: "Clients"),
  Stat(count: "5", text: "Projects"),
  Stat(count: "1.5", text: "Years\nExperience"),
  Stat(count: '2', text: 'Apps\nPublished')
];

class PortfolioStats extends StatefulWidget {
  @override
  _PortfolioStatsState createState() => _PortfolioStatsState();
}

class _PortfolioStatsState extends State<PortfolioStats>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  tForward() {
    if (mounted) {
      controller.forward();
    }
  }

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 0))
              .then((value) => controller.reverse());
        } else if (status == AnimationStatus.dismissed) {
          Future.delayed(Duration(seconds: 2)).then((value) => tForward());
        }
      });
    Future.delayed(Duration(seconds: 2)).then((value) => controller.forward());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Container(
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraint) {
            return Container(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "ABOUT ME",
                          style: GoogleFonts.oswald(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 30.0,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: stats.map((stat) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 15.0),
                          // Just use the helper here really
                          width: ScreenHelper.isMobile(context)
                              ? constraint.maxWidth / 2.0 - 20
                              : (constraint.maxWidth / 4.0 - 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stat.count,
                                style: GoogleFonts.oswald(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32.0,
                                  color: Colors.blue,
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                stat.text,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: kCaptionColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    width: double.infinity,
                    // color: Colors.green,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Experience Building Responsive and Adaptive UI',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Experience working with APIs',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Experience with dynamic translation of in-app content',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Experience working with GeoLocation-driven data',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Distribution and publishing process to both\n App Store and Play Store',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Experience with GIT version control',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 50,
                                child: AnimateedLogo(
                                  animation: animation,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AutoSizeText(
                                      'Strong Communication skills, active listener',
                                      style: GoogleFonts.oswald(
                                        fontSize: width * 0.025,
                                        color: Colors.black,
                                        height: 1,
                                      ),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class AnimateedLogo extends AnimatedWidget {
  const AnimateedLogo({
    Key? key,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  // Make the Tweens static because they don't change.
  static final _opacityTween = Tween<double>(begin: 0.9, end: 1);
  static final _sizeTween = Tween<double>(begin: 50, end: 80);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Opacity(
        opacity: _opacityTween.evaluate(animation),
        child: Container(
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: Container(
            height: 50,
            child: Image.asset('point.png'),
          ),
        ),
      ),
    );
  }
}
