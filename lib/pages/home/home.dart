import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/header_item.dart';
import 'package:portfolio/pages/home/components/androidimer.dart';
import 'package:portfolio/pages/home/components/carousel.dart';
import 'package:portfolio/pages/home/components/charge.dart';
import 'package:portfolio/pages/home/components/cv_section.dart';
import 'package:portfolio/pages/home/components/education_section.dart';
import 'package:portfolio/pages/home/components/footer.dart';

import 'package:portfolio/pages/home/components/ios_app_ad.dart';
import 'package:portfolio/pages/home/components/politic.dart';
import 'package:portfolio/pages/home/components/portfolio.dart';
import 'package:portfolio/pages/home/components/portfolio_stats.dart';
import 'package:portfolio/pages/home/components/skill_section.dart';
import 'package:portfolio/pages/home/components/skills2.dart';
import 'package:portfolio/pages/home/components/sponsors.dart';
import 'package:portfolio/pages/home/components/testimonial_widget.dart';
import 'package:portfolio/pages/home/components/website_ad.dart';
import 'package:portfolio/utils/constants.dart';
import 'package:portfolio/utils/globals.dart';
import 'package:portfolio/utils/screen_helper.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'components/animatedlogo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController(
      initialScrollOffset: 0.0,
      keepScrollOffset: true,
    );

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void scrollTo(double offset) {
    scrollController.animateTo(
      offset,
      duration: Duration(seconds: 2),
      curve: Curves.linear,
    );
  }

  List<Widget> widgetlist = [
    Container(child: Carousel()),
    SizedBox(
      height: 20.0,
    ),
    Container(child: Portfolio()),
    Container(child: Politic()),
    SizedBox(
      height: 70.0,
    ),
    Container(child: Charge()),
    SizedBox(
      height: 70.0,
    ),
    Container(child: AndroidImercita()),
    SizedBox(
      height: 70.0,
    ),
    Container(child: IosAppAd()),
    SizedBox(
      height: 70.0,
    ),
    Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 28.0),
        child: PortfolioStats(),
      ),
    ),
    SizedBox(
      height: 50.0,
    ),
    Container(child: EducationSection()),
    SizedBox(
      height: 50.0,
    ),
    Container(child: SkillsTwo()),
    SizedBox(
      height: 70,
    ),
    Container(child: SkillSection()),
    SizedBox(
      height: 50.0,
    ),
    Container(child: TestimonialWidget()),
    Container(child: Footer()),
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
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 28.0),
                          child: TextButton(
                            onPressed: () {
                              itemScrollController.scrollTo(
                                  index: headerItems[index].index,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeInOutCubic);
                            },
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
                child: Container(
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.black26, Colors.black]),
                  ),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(children: [
                      Container(child: Carousel()),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(child: Portfolio()),
                      Container(child: Politic()),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(child: Charge()),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(child: AndroidImercita()),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(child: IosAppAd()),
                      SizedBox(
                        height: 70.0,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 28.0),
                          child: PortfolioStats(),
                        ),
                      ),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(child: EducationSection()),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(child: SkillsTwo()),
                      SizedBox(
                        height: 70,
                      ),
                      Container(child: SkillSection()),
                      SizedBox(
                        height: 50.0,
                      ),
                      Container(child: TestimonialWidget()),
                      Container(child: Footer()),
                    ]),
                  ),
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
                Icons.menu,
                color: Colors.blue,
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
        title: "HOME", onTap: () {}, index: 0, isButton: true, offset: 0.0),
    HeaderItem(
        title: "PORTFOLIO",
        onTap: () {},
        index: 2,
        isButton: true,
        offset: 620.0),
    HeaderItem(
        title: "ABOUT ME",
        onTap: () {},
        index: 10,
        isButton: true,
        offset: 0.5),
    HeaderItem(
        title: "REFERENCES",
        onTap: () {},
        index: 18,
        isButton: true,
        offset: 0.2),
    HeaderItem(
        title: "CONTACT",
        onTap: () {},
        index: 21,
        isButton: true,
        offset: 11000.0),
  ];

  Widget headerLogo() {
    return Container(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "MP",
                      style: GoogleFonts.oswald(
                        color: kCaptionColor,
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
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                child: Image.asset('argentinaa.png'),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                child: Image.asset('portugal.png'),
              )
            ],
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
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        child: TextButton(
                          onPressed: () {
                            scrollTo(item.offset);
                          },
                          child: Text(
                            item.title,
                            style: TextStyle(
                              color: Colors.blue,
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
                              color: Colors.blue,
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
