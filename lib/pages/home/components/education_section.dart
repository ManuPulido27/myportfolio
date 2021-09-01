import 'package:auto_size_text/auto_size_text.dart';
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
          'I have attended this five-years Bachelors Degree in Economics at the National University of Córdoba for three years, before taking the decision to leave Argentina to continue my studies in Italy. In this period I completed several exams as for example, Descriptive and Inferential Statistics, Advanced Multivariate Calculus, Microeconomics, History and more.',
      linkName: "https://www.unc.edu.ar/",
      period: "2017 - 2020",
      photo: "assets/cordo.png",
      title: 'Universidad Nacional de Córdoba - Economics',
      displayLink: 'unc.edu.ar'),
  Education(
      description:
          "At Uzzi College I have obtained my High School Degree with orientation to Languages. Over the years I've studied English, French and Portuguese on a daily basis there.",
      linkName: "https://www.uzzicollege.edu.ar/",
      period: "2011 - 2016",
      photo: "assets/uzzi.png",
      title: 'Uzzi College - High School Degree',
      displayLink: 'uzzicollege.edu.ar'),
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
                color: Colors.black,
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
                                      Material(
                                        borderRadius: BorderRadius.circular(15),
                                        elevation: 20,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            child: GestureDetector(
                                              onTap: () {},
                                              child: MouseRegion(
                                                  cursor:
                                                      SystemMouseCursors.click,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
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
                                  child: Material(
                                    borderRadius: BorderRadius.circular(15),
                                    elevation: 20,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                        color: Colors.white70,
                                        width:
                                            constraints.maxWidth / 2.0 - 20.0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                education.title,
                                                style: GoogleFonts.oswald(
                                                  color: Colors.black,
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
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              AutoSizeText(
                                                education.description,
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              MouseRegion(
                                                cursor:
                                                    SystemMouseCursors.click,
                                                child: GestureDetector(
                                                  onTap: () async {
                                                    var url =
                                                        education.linkName;

                                                    await launch(
                                                      url,
                                                      universalLinksOnly: true,
                                                    );
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: AutoSizeText(
                                                      education.displayLink,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: Colors.blue,
                                                      ),
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
