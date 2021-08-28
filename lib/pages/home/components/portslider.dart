import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:portfolio/models/slidedata.dart';

class PortSlider extends StatefulWidget {
  final List<SlideData> slides;

  PortSlider(this.slides);
  @override
  _PortSliderState createState() => _PortSliderState();
}

class _PortSliderState extends State<PortSlider> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.transparent,
      height: height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.transparent,
              height: height * 0.75,
              width: width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    pauseAutoPlayOnTouch: true,
                    autoPlayInterval: Duration(seconds: 4),
                    autoPlayAnimationDuration: Duration(milliseconds: 700),
                    enableInfiniteScroll: false,
                    height: height * 0.65,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    // aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    }),
                itemCount: widget.slides.length,
                itemBuilder: (BuildContext context, int index, int zindex) =>
                    Container(
                  color: Colors.transparent,
                  height: height * 0.64,
                  width: width,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                          color: Colors.transparent,
                          child: Image.asset(
                            widget.slides[index].fileName,
                            fit: BoxFit.contain,
                            height: height * 0.54,
                          ),
                        ),
                      ),
                      /* Container(
                        height: index == _current ? height * 0.10 : 0,
                        child: Center(
                          child: AutoSizeText(
                            widget.slides[index].description,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        color: Colors.transparent,
                      )*/
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.slides.length > 1
                  ? widget.slides.map((url) {
                      int index = widget.slides.indexOf(url);
                      return Container(
                        width: width * 0.025,
                        height: height * 0.011,
                        margin: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.001),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? widget.slides[index].color
                                : widget.slides[index].color.withOpacity(0.5)),
                      );
                    }).toList()
                  : widget.slides.map((url) {
                      int index = widget.slides.indexOf(url);
                      return Container(
                        width: width * 0.05,
                        height: height * 0.011,
                        margin: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.001),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.transparent
                              : Colors.transparent,
                        ),
                      );
                    }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
