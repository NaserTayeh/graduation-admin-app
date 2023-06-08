// import 'package:admin_dashboard/controllers/auth_provider.dart';
// import 'package:admin_dashboard/screens/auth/sign_up_page.dart';
// import 'package:admin_dashboard/screens/dash_board_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage('assets/login.png'),
//         ),
//       ),
//       child: Consumer<AuthProvider>(builder: (context, provider, w) {
//         return Scaffold(
//           backgroundColor: Colors.transparent,
//           body: Stack(
//             children: [
//               Container(),
//               Container(
//                 padding: EdgeInsets.only(left: 35.w, top: 130.h),
//                 child: Text(
//                   'Welcome\nBack',
//                   style: TextStyle(color: Colors.white, fontSize: 33),
//                 ),
//               ),
//               SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       top: MediaQuery.of(context).size.height * 0.5),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         margin: EdgeInsets.only(left: 35.w, right: 35.h),
//                         child: Column(
//                           children: [
//                             TextField(
//                               style: TextStyle(color: Colors.black),
//                               decoration: InputDecoration(
//                                   fillColor: Colors.grey.shade100,
//                                   filled: true,
//                                   hintText: "Email",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 30,
//                             ),
//                             TextField(
//                               style: TextStyle(),
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                   fillColor: Colors.grey.shade100,
//                                   filled: true,
//                                   hintText: "Password",
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(10),
//                                   )),
//                             ),
//                             SizedBox(
//                               height: 40.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Sign in',
//                                   style: TextStyle(
//                                       fontSize: 27.sp,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                                 CircleAvatar(
//                                   radius: 30.w,
//                                   backgroundColor: Color(0xff4c505b),
//                                   child: IconButton(
//                                       splashColor: Color(0xff4c505b),
//                                       splashRadius: 50,
//                                       color: Colors.white,
//                                       onPressed: () async {
//                                         await provider.getTraineeCount();
//                                         await provider.getCoachCount();
//                                         await provider.getPersonsDate();
//                                         await provider.getAllTrainee();
//                                         await provider.getAllMarketItems();
//                                         await provider.getsubscribtionsProfit();
//                                         await provider.getCheckoutProfits();
//                                         await provider.getAllCoach();
//                                         await provider.getAllCheckoutsData();

//                                         Get.to(DashBoardScreen());
//                                       },
//                                       icon: Icon(
//                                         Icons.arrow_forward,
//                                       )),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 40.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TextButton(
//                                   onPressed: () {
//                                     Get.to(MyRegister());
//                                   },
//                                   child: Text(
//                                     'Sign Up',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(
//                                         decoration: TextDecoration.underline,
//                                         color: Color(0xff4c505b),
//                                         fontSize: 18.sp),
//                                   ),
//                                   style: ButtonStyle(),
//                                 ),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: Text(
//                                       'Forgot Password',
//                                       style: TextStyle(
//                                         decoration: TextDecoration.underline,
//                                         color: Color(0xff4c505b),
//                                         fontSize: 18.sp,
//                                       ),
//                                     )),
//                               ],
//                             )
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/screens/auth/responsive_widget.dart';
import 'package:admin_dashboard/screens/dash_board_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      return Scaffold(
        backgroundColor: AppColors.backColor,
        body: SizedBox(
          height: height,
          width: width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ResponsiveWidget.isSmallScreen(context)
                  ? const SizedBox()
                  : Expanded(
                      child: Container(
                        height: height,
                        color: AppColors.mainBlueColor,
                        child: Center(
                          child: Text(
                            'Gym Admin',
                            style: ralewayStyle.copyWith(
                              fontSize: 48.0,
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      ),
                    ),
              Expanded(
                child: Container(
                  height: height,
                  margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveWidget.isSmallScreen(context)
                          ? height * 0.032
                          : height * 0.12),
                  color: AppColors.backColor,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.2),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: 'Let’s',
                                  style: ralewayStyle.copyWith(
                                    fontSize: 25.0,
                                    color: AppColors.blueDarkColor,
                                    fontWeight: FontWeight.normal,
                                  )),
                              TextSpan(
                                text: ' Sign In 👇',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.blueDarkColor,
                                  fontSize: 25.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Hey, Enter your details to get sign in \nto your account.',
                          style: ralewayStyle.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColor,
                          ),
                        ),
                        SizedBox(height: height * 0.064),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Email',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.blueDarkColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor,
                              fontSize: 12.0,
                            ),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.emailIcon),
                              ),
                              contentPadding: const EdgeInsets.only(top: 16.0),
                              hintText: 'Enter Email',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.014),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Password',
                            style: ralewayStyle.copyWith(
                              fontSize: 12.0,
                              color: AppColors.blueDarkColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6.0),
                        Container(
                          height: 50.0,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: AppColors.whiteColor,
                          ),
                          child: TextFormField(
                            style: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.blueDarkColor,
                              fontSize: 12.0,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.eyeIcon),
                              ),
                              prefixIcon: IconButton(
                                onPressed: () {},
                                icon: Image.asset(AppIcons.lockIcon),
                              ),
                              contentPadding: const EdgeInsets.only(top: 16.0),
                              hintText: 'Enter Password',
                              hintStyle: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.blueDarkColor.withOpacity(0.5),
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: ralewayStyle.copyWith(
                                fontSize: 12.0,
                                color: AppColors.mainBlueColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () async {
                              await provider.getTraineeCount();
                              await provider.getCoachCount();
                              await provider.getPersonsDate();
                              await provider.getAllTrainee();
                              await provider.getAllMarketItems();
                              await provider.getsubscribtionsProfit();
                              await provider.getCheckoutProfits();
                              await provider.getAllCoach();
                              await provider.getAllCheckoutsData();
                              await provider.getAdminInfo();

                              Get.to(DashBoardScreen());
                            },
                            borderRadius: BorderRadius.circular(16.0),
                            child: Ink(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 70.0, vertical: 18.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppColors.mainBlueColor,
                              ),
                              child: Text(
                                'Sign In',
                                style: ralewayStyle.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.whiteColor,
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
