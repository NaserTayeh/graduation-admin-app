import 'package:admin_dashboard/screens/components/top_referals.dart';
import 'package:admin_dashboard/screens/components/users.dart';
import 'package:admin_dashboard/screens/components/users_by_device.dart';
import 'package:admin_dashboard/screens/components/viewers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../constants/responsive.dart';
import '../../controllers/auth_provider.dart';
import 'analytic_cards.dart';
import 'custom_appbar.dart';
import 'discussions.dart';
import 'package:intl/intl.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.all(appPadding),
        child: Column(
          children: [
            // TextButton(
            //     onPressed: () async {
            //       AuthProvider provider = Provider.of(context, listen: false);
            //       await provider.getsubscribtionsProfit();
            //       // await provider.getPersonsDate();
            //       // provider.personsDate.forEach((element) {
            //       //   print(element['join_date']);
            //       // });
            //       // DateTime now = DateTime.now();
            //       // int monthNumber = now.month;
            //       // print(monthNumber); // Output: 5// Output: May
            //     },
            //     child: Text('data')),
            CustomAppbar(),
            SizedBox(
              height: appPadding,
            ),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          AnalyticCards(),
                          SizedBox(
                            height: appPadding,
                          ),
                          Users(),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          if (Responsive.isMobile(context)) Discussions(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: appPadding,
                      ),
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: Discussions(),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          SizedBox(
                            height: appPadding,
                          ),
                          // Row(
                          //   children: [
                          //     if (!Responsive.isMobile(context))
                          //       Expanded(
                          //         child: TopReferals(),
                          //         flex: 2,
                          //       ),
                          //     if (!Responsive.isMobile(context))
                          //       SizedBox(
                          //         width: appPadding,
                          //       ),
                          //     Expanded(
                          //       flex: 3,
                          //       child: Viewers(),
                          //     ),
                          //   ],
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          // ),
                          SizedBox(
                            height: appPadding,
                          ),
                          if (Responsive.isMobile(context))
                            SizedBox(
                              height: appPadding,
                            ),
                          // if (Responsive.isMobile(context)) TopReferals(),
                          // if (Responsive.isMobile(context))
                          //   SizedBox(
                          //     height: appPadding,
                          //   ),
                          if (Responsive.isMobile(context)) UsersByDevice(),
                        ],
                      ),
                    ),
                    if (!Responsive.isMobile(context))
                      SizedBox(
                        width: appPadding,
                      ),
                    if (!Responsive.isMobile(context))
                      Expanded(
                        flex: 2,
                        child: UsersByDevice(),
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
