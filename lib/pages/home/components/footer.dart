import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/footer_item.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<FooterItem> footerItems = [
  FooterItem(
      iconPath: "assets/gmail.png",
      title: "Email",
      text1: "manupulido98@gmail.com",
      linkName: ''),
  FooterItem(
      iconPath: "assets/w.png",
      title: "WhatsApp",
      text1: "+39 379 279 6129",
      linkName: ''),
  FooterItem(
      iconPath: "assets/linkedin.png",
      title: "LinkedIn",
      text1: "Click here to see my profile!",
      linkName:
          'https://www.linkedin.com/in/manuel-ignacio-pulido-garc%C3%ADa-7b274a1b7/'),
  FooterItem(
      iconPath: "assets/github-sign.png",
      title: "GitHub",
      text1: "Click here to check it out!",
      linkName: 'https://github.com/ManuPulido27'),
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45.0,
              ),
              Text(
                "CONTACT",
                style: GoogleFonts.oswald(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 30.0,
                  height: 1.3,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              SizedBox(
                height: 45.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 50.0),
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: footerItems
                      .map(
                        (footerItem) => Material(
                          borderRadius: BorderRadius.circular(15),
                          elevation: 20,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.white70,
                              height: 160.0,
                              width: ScreenHelper.isMobile(context)
                                  ? constraints.maxWidth / 2.0 - 15.0
                                  : constraints.maxWidth / 4.0 - 15.0,
                              child: GestureDetector(
                                onTap: () async {
                                  var url = footerItem.linkName;

                                  if (footerItem.title == 'LinkedIn' ||
                                      footerItem.title == 'GitHub') {
                                    await launch(
                                      url,
                                      universalLinksOnly: true,
                                    );
                                  } else {
                                    print('url');
                                  }
                                },
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Material(
                                                  color: footerItem.title ==
                                                              'LinkedIn' ||
                                                          footerItem.title ==
                                                              'GitHub'
                                                      ? Colors.white
                                                      : Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  elevation: 20,
                                                  child: Container(
                                                    height: 50,
                                                    color: footerItem.title ==
                                                                'LinkedIn' ||
                                                            footerItem.title ==
                                                                'GitHub'
                                                        ? Colors.white
                                                        : Colors.transparent,
                                                    child: Image.asset(
                                                      footerItem.iconPath,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15.0,
                                                ),
                                                Text(
                                                  footerItem.title,
                                                  style: GoogleFonts.oswald(
                                                    fontSize: 18.0,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15.0,
                                            ),
                                            SelectableText(
                                              "${footerItem.text1}",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w800,
                                                height: 1.8,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Flex(
                direction: ScreenHelper.isMobile(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                mainAxisAlignment: ScreenHelper.isMobile(context)
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      "Copyright (c) 2021 Manuel Pulido. All rights Reserved",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        height: 1.8,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Text(
                            "Built entirely using Flutter \u{1F4AA}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w800,
                              height: 1.8,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          );
        },
      ),
    ),
  );
}
