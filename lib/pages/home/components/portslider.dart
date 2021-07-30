import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PortSlider extends StatefulWidget {
  final List slides;

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
      height: height * 0.8,
      child: Column(
        children: [
          SizedBox(
            height: height * 0.06,
          ),
          Container(
            height: height * 0.48,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                      enableInfiniteScroll: false,
                      height: height * 0.6,
                      autoPlay: false,
                      enlargeCenterPage: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                  itemCount: widget.slides.length,
                  itemBuilder: (BuildContext context, int index, int zindex) =>
                      Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        child: Transform.rotate(
                          angle: pi / 120,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Container(
                              color: Colors.white70,
                              height: height * 0.25,
                              child: Image.asset(
                                widget.slides[index].tpicFilename,
                                fit: BoxFit.cover,
                              ),
                              width: double.infinity,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.035,
                      ),
                      Container(
                        height: height * 0.18,
                        child: Text(
                          widget.slides[index].tpicDescription,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        color: Colors.transparent,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
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
        ],
      ),
    );
  }
}
