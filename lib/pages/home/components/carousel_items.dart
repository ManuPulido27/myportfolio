import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/models/carousel_item_model.dart';
import 'package:portfolio/models/carousel_item_model.dart';
import 'package:portfolio/utils/constants.dart';
import 'animatedlogo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    text: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 18.0,
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white70,
                radius: 100,
                backgroundImage: AssetImage('circle-cropped.png'),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "MANUEL IGNACIO\n PULIDO GARCÍA",
                style: GoogleFonts.oswald(
                  color: Colors.white,
                  fontSize: 40.0,
                  fontWeight: FontWeight.w900,
                  height: 1.3,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Text(
            "JR. Flutter developer, based in Milano",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 20.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            child: Wrap(
              children: [
                Text(
                  "Experience working on freelance and startup dynamic contexts",
                  style: TextStyle(
                    color: kCaptionColor,
                    fontSize: 17.0,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          Text(
            "Economics student",
            style: TextStyle(
              color: kCaptionColor,
              fontSize: 17.0,
              height: 1.0,
            ),
          ),
          SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: Colors.white,
                        height: 50,
                        child: Image.asset('linkedin.png'),
                      ),
                    )),
              ),
              SizedBox(
                width: 25.0,
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      height: 50,
                      child: Image.asset('github-sign.png'),
                    )),
              ),
              SizedBox(
                width: 25.0,
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        child: Image.asset('playstoree.png'),
                      ),
                    )),
              ),
              SizedBox(
                width: 25.0,
              ),
              GestureDetector(
                onTap: () {},
                child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 50,
                        child: Image.asset('applee.png'),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    ),
    image: Container(
        child: FlutterLogo(
      style: FlutterLogoStyle.stacked,
      size: 300,
      curve: Curves.bounceInOut,
      duration: Duration(seconds: 10),
    )),
  ),
);
