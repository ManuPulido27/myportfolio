import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/pages/home/components/portfolio_stats.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/education.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:url_launcher/url_launcher.dart';

final List<Education> educationList = [
  Education(
      description:
          "This is a sample education and details about it is stated below. This is a sample education and details about it is stated below",
      linkName: "https://www.unc.edu.ar/",
      period: "2017 - 2020",
      photo: "cordo.png",
      title: 'Universidad Nacional de Córdoba - Economics',
      displayLink: 'www.unc.edu.ar'),
  Education(
      description:
          "This is a sample education and details about it is stated below.This is a sample education and details about it is stated below",
      linkName: "https://www.uzzicollege.edu.ar/",
      period: "2011 - 2016",
      photo: "uzzi.png",
      title: 'Uzzi College - High School Degree',
      displayLink: 'www.uzzicollege.edu.ar'),
];

class EducationSection extends StatelessWidget {
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
      alignment: Alignment.center,
      child: ResponsiveWrapper(
        maxWidth: width,
        minWidth: width,
        defaultScale: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "EDUCATION",
              style: GoogleFonts.oswald(
                color: Colors.white,
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                height: 1.3,
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Wrap(
              children: [],
            ),
            SizedBox(
              height: 40.0,
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Container(
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: educationList
                        .map(
                          (education) => Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          child: GestureDetector(
                                            onTap: () {},
                                            child: MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    color: Colors.white,
                                                    child: Image.asset(
                                                      education.photo,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                )),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 100,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: constraints.maxWidth / 2.0 - 20.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          education.title,
                                          style: GoogleFonts.oswald(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          education.period,
                                          style: GoogleFonts.oswald(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          education.description,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            color: kCaptionColor,
                                            height: 1.5,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        MouseRegion(
                                          cursor: SystemMouseCursors.click,
                                          child: GestureDetector(
                                            onTap: () async {
                                              var url = education.linkName;

                                              await launch(
                                                url,
                                                universalLinksOnly: true,
                                              );
                                            },
                                            child: Text(
                                              education.displayLink,
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40.0,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
