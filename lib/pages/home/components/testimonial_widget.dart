import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:portfolio/models/testimonial.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/screen_helper.dart';

final List<Testimonial> testimonials = [
  Testimonial(
    text:
        '\'\'Manuel is a very fast learner. He knows how to solve problems and take the projects forward under stress. Whenever he reached a roadblock on the development of imercita, he did not stop until he found a solution for it. This proactive attitude makes him a valuable asset to any small team. He is a good communicator, thinks on his feet and clarifies the issues ot his team members. He was fast in UX implementation on all device sizes both on Android and iOS. I look forward to working with him on more upcoming projects.\'\'',
    occupation: "CEO - Imercita",
    personName: "Sharzad Behzadian",
    profilePhoto: "assets/1024.png",
  ),
  Testimonial(
    text:
        '\'\'Manuel worked with us when we were considering to migrate our app to Flutter, he created a new user interface following our specifications in no time, and also contributing with his ideas. If we decide to go all the way with Flutter, we will definitely contact him again due to his work ethic, comunication and design skills.\'\'',
    occupation: "Co-Founder - ChargeSurfing",
    personName: "Sergio Almeida",
    profilePhoto: "assets/Chargelogo.jpg",
  )
];

class TestimonialWidget extends StatelessWidget {
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
}

Widget _buildUi(double width) {
  return Center(
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "REFERENCES",
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
                Flex(
                  direction: ScreenHelper.isMobile(context)
                      ? Axis.vertical
                      : Axis.horizontal,
                  // Lets map
                  children: testimonials.map((testimonial) {
                    return Expanded(
                      flex: ScreenHelper.isMobile(context) ? 0 : 1,
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        //   margin: EdgeInsets.only(bottom: 50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15.0,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(15),
                              elevation: 20,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Container(
                                  height: 300,
                                  color: Colors.white70,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        testimonial.text,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w800,
                                          height: 1.8,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            Row(
                              children: [
                                Material(
                                  borderRadius: BorderRadius.circular(15),
                                  elevation: 20,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      color: Colors.white,
                                      height: 50,
                                      child:
                                          Image.asset(testimonial.profilePhoto),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      testimonial.personName,
                                      style: GoogleFonts.oswald(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 4.0,
                                    ),
                                    Text(
                                      testimonial.occupation,
                                      style: TextStyle(
                                        color: kCaptionColor,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
