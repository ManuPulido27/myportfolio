import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/slidedata.dart';
import 'package:portfolio/pages/home/components/portslider.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class AndroidImercita extends StatefulWidget {
  @override
  _AndroidImercitaState createState() => _AndroidImercitaState();
}

class _AndroidImercitaState extends State<AndroidImercita> {
  GlobalKey llave = GlobalKey();
  List<SlideData> list = [
    SlideData('', 'dr1.png', Colors.purple),
    SlideData('', 'dr2.png', Colors.purple),
    SlideData('', 'dr3.png', Colors.purple),
    SlideData('', 'dr4.png', Colors.purple),
    SlideData('', 'dr5.png', Colors.purple),
    SlideData('', 'dr6.png', Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  direction: constraints.maxWidth > 720
                      ? Axis.horizontal
                      : Axis.vertical,
                  children: [
                    // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: Container(
                        // Set width for image on smaller screen
                        width: constraints.maxWidth > 720.0 ? null : 350.0,

                        child: PortSlider(list),
                      ),
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: SizedBox(
                        height: 50,
                      ),
                    ),
                    Expanded(
                      flex: constraints.maxWidth > 720.0 ? 1 : 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.purple,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.purple)),
                                        height: 50,
                                        width: 50,
                                        child: Image.asset('assets/1024.png'),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.transparent,
                                        ),
                                        height: 50,
                                        width: 50,
                                        child: Image.asset(
                                            'assets/playstoree.png'),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(
                                  "IMERCITA",
                                  style: GoogleFonts.oswald(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900,
                                    height: 1.3,
                                    fontSize: 35.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  'This is the first app I ever published. It was a great experience being part of a company like Immersive City Tales, as I gained a lot of knowledge while developing and deploying by myself both iOS and Android versions of their app which was only available for iOS at the time. These images correspond to the Android version.',
                                  style: TextStyle(
                                    color: Colors.white,
                                    height: 1.5,
                                    fontSize: 15.0,
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
