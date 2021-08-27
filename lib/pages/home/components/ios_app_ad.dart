import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/slidedata.dart';
import 'package:portfolio/pages/home/components/portslider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

class IosAppAd extends StatefulWidget {
  @override
  _IosAppAdState createState() => _IosAppAdState();
}

class _IosAppAdState extends State<IosAppAd> {
  List<SlideData> list = [
    SlideData('', 'assets/io11.png', Colors.purple),
    SlideData('', 'assets/io222.png', Colors.purple),
    SlideData('', 'assets/io33333.png', Colors.purple),
    SlideData('', 'assets/io444.png', Colors.purple),
    SlideData('', 'assets/io555.png', Colors.purple),
    SlideData('', 'assets/io7777.png', Colors.purple),
    SlideData('', 'assets/io8888.png', Colors.purple),
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
                      child: Material(
                        borderRadius: BorderRadius.circular(15),
                        elevation: 20,
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
                                      Material(
                                        borderRadius: BorderRadius.circular(10),
                                        elevation: 20,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.purple)),
                                            height: 50,
                                            width: 50,
                                            child:
                                                Image.asset('assets/1024.png'),
                                          ),
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
                                          child:
                                              Image.asset('assets/applee.png'),
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
                                    'Imercita is an app that turns city exploration into an immersive experience. Through stories, it leads you to discover new places and meet people while interacting with your environment by using GeoLocation-driven data to guide you. It was great using flutter to develop it, as 85% of the code-base was reusable for this iOS version, which is also available in the App Store.',
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
    );
  }
}
