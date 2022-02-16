// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

final List<String> categories = [
  "Business",
  "Personal",
  "Study",
  "Fitness",
  "Other List"
];

class CategoryListItems extends StatelessWidget {
  const CategoryListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 10),
        child: ListView(
          padding: EdgeInsets.all(1),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      color: Color(0xff0A155A),
                      child: Container(
                        width: 210,
                        height: 150,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 138,
                                top: 40,
                              ),
                              child: Text(
                                "40 tasks",
                                style: TextStyle(
                                    color: Color(0xffBBC2D8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 100),
                              child: Text(
                                categories[0],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: GFProgressBar(
                                percentage: 0.7,
                                lineHeight: 8,
                                width: 155,
                                alignment: MainAxisAlignment.start,
                                backgroundColor: Colors.white,
                                progressBarColor: Colors.indigo,
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Card(
                      color: Color(0xff0A155A),
                      child: Container(
                        width: 210,
                        height: 150,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 138,
                                top: 40,
                              ),
                              child: Text(
                                "18 tasks",
                                style: TextStyle(
                                    color: Color(0xffBBC2D8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 100),
                              child: Text(
                                categories[1],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: GFProgressBar(
                                percentage: 0.7,
                                lineHeight: 8,
                                width: 155,
                                alignment: MainAxisAlignment.start,
                                backgroundColor: Colors.white,
                                progressBarColor: Colors.pink,
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Card(
                      color: Color(0xff0A155A),
                      child: Container(
                        width: 210,
                        height: 150,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 138,
                                top: 40,
                              ),
                              child: Text(
                                "12 tasks",
                                style: TextStyle(
                                    color: Color(0xffBBC2D8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 120),
                              child: Text(
                                categories[2],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: GFProgressBar(
                                percentage: 0.7,
                                lineHeight: 8,
                                width: 155,
                                alignment: MainAxisAlignment.start,
                                backgroundColor: Colors.white,
                                progressBarColor: Colors.orange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Card(
                      color: Color(0xff0A155A),
                      child: Container(
                        width: 210,
                        height: 150,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 138,
                                top: 40,
                              ),
                              child: Text(
                                "22 tasks",
                                style: TextStyle(
                                    color: Color(0xffBBC2D8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 110),
                              child: Text(
                                categories[3],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: GFProgressBar(
                                percentage: 0.7,
                                lineHeight: 8,
                                width: 155,
                                alignment: MainAxisAlignment.start,
                                backgroundColor: Colors.white,
                                progressBarColor: Colors.green,
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    Card(
                      color: Color(0xff0A155A),
                      child: Container(
                        width: 210,
                        height: 150,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                right: 138,
                                top: 40,
                              ),
                              child: Text(
                                "4 tasks",
                                style: TextStyle(
                                    color: Color(0xffBBC2D8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10, right: 90),
                              child: Text(
                                categories[4],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              child: GFProgressBar(
                                percentage: 0.7,
                                lineHeight: 8,
                                width: 155,
                                alignment: MainAxisAlignment.start,
                                backgroundColor: Colors.white,
                                progressBarColor: Colors.yellow,
                              ),
                            ),
                          ],
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
