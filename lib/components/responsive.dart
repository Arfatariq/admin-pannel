import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  //constructors---------------------

  const Responsive(
      {super.key,
      required this.desktop,
      required this.mobile,
      required this.tablet});

  //using static helper method to chk the current screeen-------
  //also setting the media query to stndrd screen sizes------

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 767;

//boolean method to chk if the screnn is of tablet
//returns "True" if the width is 768,104

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
      MediaQuery.of(context).size.width < 1024;

//boolean method to chk if the screnn is of tablet
//returns "True" if the width is 768,104

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1025) {
      return desktop;
    } else if (size.width >= 766 && tablet != null) {
      return tablet;
    } else {
      return mobile;
    }
  }
}
