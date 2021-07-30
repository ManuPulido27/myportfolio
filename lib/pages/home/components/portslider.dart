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
      color: Colors.green,
      height: height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.red,
              height: height * 0.75,
              width: width,
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    autoPlayInterval: Duration(seconds: 10),
                    autoPlayAnimationDuration: Duration(milliseconds: 700),
                    enableInfiniteScroll: false,
                    height: height * 0.65,
                    autoPlay: false,
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
                  color: Colors.blue,
                  height: height * 0.60,
                  width: width,
                  child: Column(
                    children: [
                      Container(
                        color: Colors.lightBlueAccent,
                        child: Image.asset(
                          widget.slides[index].fileName,
                          fit: BoxFit.contain,
                          height: height * 0.50,
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.slides[index].description,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueGrey,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.slides.length > 1
                  ? widget.slides.map((url) {
                      int index = widget.slides.indexOf(url);
                      return Container(
                        width: width * 0.05,
                        height: height * 0.011,
                        margin: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.001),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == index
                              ? Colors.purple
                              : Colors.purple.shade200,
                        ),
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
