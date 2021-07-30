import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/pages/home/components/carousel.dart';
import 'package:portfolio/pages/home/components/cv_section.dart';
import 'package:portfolio/pages/home/components/education_section.dart';
import 'package:portfolio/pages/home/components/footer.dart';
import 'package:portfolio/pages/home/components/header.dart';
import 'package:portfolio/pages/home/components/ios_app_ad.dart';
import 'package:portfolio/pages/home/components/portfolio_stats.dart';
import 'package:portfolio/pages/home/components/skill_section.dart';
import 'package:portfolio/pages/home/components/sponsors.dart';
import 'package:portfolio/pages/home/components/testimonial_widget.dart';
import 'package:portfolio/pages/home/components/website_ad.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  List<Widget> widgetlist = [
    Carousel(),
    SizedBox(
      height: 20.0,
    ),
    CvSection(),
    IosAppAd(),
    SizedBox(
      height: 70.0,
    ),
    WebsiteAd(),
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 28.0),
      child: PortfolioStats(),
    ),
    SizedBox(
      height: 50.0,
    ),
    EducationSection(),
    SizedBox(
      height: 50.0,
    ),
    SkillSection(),
    SizedBox(
      height: 50.0,
    ),
    Sponsors(),
    SizedBox(
      height: 50.0,
    ),
    TestimonialWidget(),
    Footer(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 24.0,
            ),
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return headerItems[index].isButton
                    ? MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            color: kDangerColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: headerItems[index].onTap,
                            child: Text(
                              headerItems[index].title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListTile(
                        title: Text(
                          headerItems[index].title,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 10.0,
                );
              },
              itemCount: headerItems.length,
            ),
          ),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                //child: Header(),
                child: ScreenHelper(
                  desktop: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: buildHeader(),
                  ),
                  // We will make this in a bit
                  mobile: buildMobileHeader(),
                  tablet: buildHeader(),
                ),
              ),
              Container(
                height: height,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.vertical,
                  itemScrollController: itemScrollController,
                  itemCount: widgetlist.length,
                  itemBuilder: (context, index) {
                    return Container(child: widgetlist[index]);
                  },
                ),
              )
              /* Carousel(),
              SizedBox(
                height: 20.0,
              ),
              CvSection(),
              IosAppAd(),
              SizedBox(
                height: 70.0,
              ),
              WebsiteAd(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 28.0),
                child: PortfolioStats(),
              ),
              SizedBox(
                height: 50.0,
              ),
              EducationSection(),
              SizedBox(
                height: 50.0,
              ),
              SkillSection(),
              SizedBox(
                height: 50.0,
              ),
              Sponsors(),
              SizedBox(
                height: 50.0,
              ),
              TestimonialWidget(),
              Footer(),*/
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMobileHeader() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            headerLogo(),
            // Restart server to make icons work
            // Lets make a scaffold key and create a drawer
            GestureDetector(
              onTap: () {
                // Lets open drawer using global key
                Globals.scaffoldKey.currentState!.openEndDrawer();
              },
              child: Icon(
                Icons.access_alarm_outlined,
                color: Colors.white,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          headerLogo(),
          headerRow(),
        ],
      ),
    );
  }

  List<HeaderItem> headerItems = [
    HeaderItem(
      title: "HOME",
      onTap: () {
        print('home on home!');
      },
    ),
    HeaderItem(title: "MY INTRO", onTap: () {}),
    HeaderItem(title: "SERVICES", onTap: () {}),
    HeaderItem(title: "PORTFOLIO", onTap: () {}),
    HeaderItem(title: "TESTIMONIALS", onTap: () {}),
    HeaderItem(title: "BLOGS", onTap: () {}),
    HeaderItem(
      title: "HIRE ME",
      onTap: () {},
      isButton: true,
    ),
  ];

  Widget headerLogo() {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "MP",
                  style: GoogleFonts.oswald(
                    color: Colors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ".",
                  style: GoogleFonts.oswald(
                    color: kPrimaryColor,
                    fontSize: 36.0,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headerRow() {
    return ResponsiveVisibility(
      visible: false,
      visibleWhen: [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(
        children: headerItems
            .map(
              (item) => item.isButton
                  ? MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        decoration: BoxDecoration(
                          color: kDangerColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  : MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: Container(
                        margin: EdgeInsets.only(right: 30.0),
                        child: GestureDetector(
                          onTap: item.onTap,
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
            )
            .toList(),
      ),
    );
  }
}
