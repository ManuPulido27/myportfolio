import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/slidedata.dart';
import 'package:portfolio/pages/home/components/portslider.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Charge extends StatefulWidget {
  @override
  _ChargeState createState() => _ChargeState();
}

class _ChargeState extends State<Charge> {
  List<SlideData> list = [
    SlideData(
        'This is the 1description of the appgggggggggsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdgggjujujujujuujujujujujujujujujujujujujujuju',
        'c11.png'),
    SlideData('This is the 2description of the app', 'c55.png'),
    SlideData('This is the 3description of the app', 'c123.png'),
    SlideData('This is the 3description of the app', 'c44.png'),
    SlideData('This is the 3description of the app', 'c66.png')
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "IOS APP",
                            style: GoogleFonts.oswald(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "UNIVERSAL\nSMART HOME APP",
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
                            "This is a random text about the project, I should have used the regular lorem ipsum text, but I am too lazy to search for that. This should be long enough",
                            style: TextStyle(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          Row(
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
                          )
                        ],
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
