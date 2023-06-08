import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 600 &&
        MediaQuery.of(context).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 600) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}

class AppColors {
  static const Color backColor = Color(0xffF6F6F6);
  static const Color mainBlueColor = Color(0xff005BE0);
  static const Color blueDarkColor = Color(0xff252B5C);
  static const Color textColor = Color(0xff53587A);
  static const Color greyColor = Color(0xffAAAAAA);
  static const Color whiteColor = Color(0xffFFFFFF);
}

class AppIcons {
  static const String emailIcon = 'assets/images/EmailIcon.png';
  static const String lockIcon = 'assets/images/lockIcon.png';
  static const String eyeIcon = 'assets/images/EyeIcon.png';
}

TextStyle ralewayStyle = GoogleFonts.raleway();
