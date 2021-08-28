import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/skill.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/skill.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

List<Skill> skills = [
  Skill(
    skill: "Spanish",
    percentage: 100,
    icon: 'assets/argentinaa.png',
  ),
  Skill(skill: "English", percentage: 90, icon: 'assets/us.png'),
  Skill(skill: "Italian", percentage: 80, icon: 'assets/italy.png'),
  Skill(skill: "Portuguese", percentage: 75, icon: 'assets/portugal.png'),
  Skill(skill: "French", percentage: 20, icon: 'assets/france.png'),
];

class SkillsTwo extends StatelessWidget {
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
        builder: (BuildContext context, BoxConstraints constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            child: Flex(
              direction: ScreenHelper.isMobile(context)
                  ? Axis.vertical
                  : Axis.horizontal,
              children: [
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 2,
                  child: Image.asset(
                    "assets/languages.png",
                    width: 300.0,
                  ),
                ),
                SizedBox(
                  width: 50.0,
                ),
                Expanded(
                  flex: ScreenHelper.isMobile(context) ? 0 : 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "LANGUAGES",
                        style: GoogleFonts.oswald(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 28.0,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Column(
                        children: skills
                            .map(
                              (skill) => Container(
                                margin: EdgeInsets.only(bottom: 15.0),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      child: Image.asset(skill.icon),
                                    ),
                                    SizedBox(width: 10),
                                    Expanded(
                                      flex: skill.percentage,
                                      child: Material(
                                        elevation: 20,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10.0),
                                          alignment: Alignment.centerLeft,
                                          height: 38.0,
                                          child: AutoSizeText(skill.skill,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w800)),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Expanded(
                                      // remaining (blank part)
                                      flex: 100 - skill.percentage,
                                      child: Divider(
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    Text(
                                      "${skill.percentage}%",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
