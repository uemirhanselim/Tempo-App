import 'package:flutter/material.dart';

class ProjectPaddings extends EdgeInsets {
  const ProjectPaddings.medium() : super.all(12);
  const ProjectPaddings.horizontal() : super.symmetric(horizontal: 20);
  const ProjectPaddings.low() : super.all(8);
  const ProjectPaddings.one() : super.all(1);
  const ProjectPaddings.bottom() : super.only(bottom: 10);
  const ProjectPaddings.bottomHigh() : super.only(bottom: 12);
  const ProjectPaddings.right() : super.only(right: 16);
  const ProjectPaddings.left() : super.only(left: 16);
  const ProjectPaddings.leftHigh() : super.only(left: 20);
  const ProjectPaddings.top() : super.only(top: 10);
  const ProjectPaddings.verticalBox()
      : super.symmetric(vertical: 6, horizontal: 8);
  const ProjectPaddings.contactWayButton()
      : super.symmetric(horizontal: 20, vertical: 12);
}

class ProjectBorderRadius extends BorderRadius {
  ProjectBorderRadius.itemCircular() : super.circular(16);
  ProjectBorderRadius.itemLargeCircular() : super.circular(30);
}

class ProjectTexts {
  static const String appBarTitle = 'Contacts';
  static const String appTitle = 'Contact App';
  static const String searchText = 'Search';
  static const String fontFamily = 'FiraSans';
  static const String iconHome = 'Home';
  static const String iconMobile = 'Mobile';
  static const String shareLocation = 'Share location';
  static const String qrCode = 'Qr code';
  static const String shareContact = 'Share contact';
}

class ProjectIconSizes {
  static const double normal = 25.0;
  static const double high = 30.0;
}

class ProjectColors {
  static const Color kWhite = Colors.white;
  static const Color kBlue = Colors.blue;
  static const Color kBlack = Colors.black;
  static Color kGreyShadeLow = Colors.grey.shade200;
  static Color kGreyShadeMedium = Colors.grey.shade500;
  static Color kGreyShadeHigh = Colors.grey.shade700;
  static Color kBlueGreyLow = Colors.blueGrey.shade200;
  static Color kRedMedium = Colors.red.shade400;
  static Color kGreenMedium = Colors.green.shade500;
  static const Color splashColor = Color.fromRGBO(201, 207, 134, 1);
  static const Color kShareLocation = Color.fromARGB(255, 57, 57, 228);
  static Color kQrCode = Colors.blueGrey.shade200;
  static const Color kShareContact = Color.fromARGB(255, 71, 222, 174);
}

class ProjectContainerSizes {
  static const double normal = 60;
  static const double low = 40;
  static const double lowMedium = 42;
  static const double high = 100;
  static const double one = 1;
}

class ProjectFontSizes {
  static const double low = 14;
  static const double underMedium = 16;
  static const double medium = 20;
  static const double large = 30;
}

class ProjectTextStyles {
  static TextStyle mediumTextStyle = TextStyle(
      fontSize: ProjectFontSizes.medium,
      fontFamily: ProjectTexts.fontFamily,
      fontWeight: FontWeight.w600,
      color: ProjectColors.kGreyShadeHigh);
  static TextStyle smallTextStyle = TextStyle(
      fontSize: ProjectFontSizes.low,
      fontFamily: ProjectTexts.fontFamily,
      fontWeight: FontWeight.w600,
      color: Colors.grey.shade500);
}
