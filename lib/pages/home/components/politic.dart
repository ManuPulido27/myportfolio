import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/slidedata.dart';
import 'package:portfolio/pages/home/components/portslider.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Politic extends StatefulWidget {
  @override
  _PoliticState createState() => _PoliticState();
}

class _PoliticState extends State<Politic> {
  List<SlideData> list = [
    SlideData('', 'assets/p1.png', Colors.teal),
    SlideData('', 'assets/p2222.png', Colors.teal),
    SlideData('', 'assets/p3333.png', Colors.teal),
    SlideData('', 'assets/p4444.png', Colors.teal),
    SlideData('', 'assets/p88888888.png', Colors.teal),
    SlideData('', 'assets/p5555.png', Colors.teal),
    SlideData('', 'assets/p6666.png.png', Colors.teal),
    SlideData('', 'assets/p7777.png', Colors.teal)
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
    return Container(
      child: Column(
        children: [
          Center(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        direction: constraints.maxWidth > 720
                            ? Axis.horizontal
                            : Axis.vertical,
                        children: [
                          // Disable expanded on smaller screen to avoid Render errors by setting flex to 0
                          Expanded(
                            flex: constraints.maxWidth > 720.0 ? 1 : 0,
                            child: Container(
                              // Set width for image on smaller screen
                              width:
                                  constraints.maxWidth > 720.0 ? null : 350.0,

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
                            child: Material(
                              borderRadius: BorderRadius.circular(15),
                              elevation: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.teal.shade900,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Material(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          elevation: 20,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors
                                                          .teal.shade900)),
                                              height: 50,
                                              width: 50,
                                              child: Image.asset(
                                                  'assets/logo.png'),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Text(
                                          "POLITICAPP",
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
                                          "This is was my first Flutter project. It is an app with the objective to inform people about basic politic-related knowledge and also lets them test their ideological trend accroding to Nolan's Diagram. Results can later be compared with firends and family on the main graph.",
                                          style: TextStyle(
                                            color: Colors.white,
                                            height: 1.5,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25.0,
                                        ),
                                        /* Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            MouseRegion(
                                              cursor: SystemMouseCursors.click,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: kPrimaryColor,
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                height: 48.0,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 28.0,
                                                ),
                                                child: TextButton(
                                                  onPressed: () {},
                                                  child: Center(
                                                    child: Text(
                                                      "EXPLORE MORE",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13.0,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.0,
                                            ),
                                          ],
                                        )*/
                                      ],
                                    ),
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
          ),
        ],
      ),
    );
  }
}
