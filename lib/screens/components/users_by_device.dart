import 'package:admin_dashboard/constants/constants.dart';
import 'package:admin_dashboard/controllers/auth_provider.dart';
import 'package:admin_dashboard/screens/components/radial_painter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersByDevice extends StatelessWidget {
  const UsersByDevice({Key? key}) : super(key: key);
  getData(AuthProvider provider) {
    int count = 0;
    int all = provider.allTrainee.length;
    print('---');
    print(provider.allTrainee.length);
    provider.allTrainee.forEach((element) {
      if (element.isPrem == 1) {
        count++;
      }
    });
    return count.toDouble() / all.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, w) {
      double v = getData(provider);

      return Padding(
        padding: const EdgeInsets.only(top: appPadding),
        child: Container(
          height: 350,
          decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(appPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Subscribed trainee',
                style: TextStyle(
                  color: textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Container(
                margin: EdgeInsets.all(appPadding),
                padding: EdgeInsets.all(appPadding),
                height: 230,
                child: CustomPaint(
                  foregroundPainter: RadialPainter(
                    bgColor: textColor.withOpacity(0.1),
                    lineColor: primaryColor,
                    percent: v,
                    width: 18.0,
                  ),
                  child: Center(
                    child: Text(
                      '${((v * 100.0).toStringAsFixed(2))}%',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: appPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: primaryColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: appPadding / 2,
                        ),
                        Text(
                          'Subscribed',
                          style: TextStyle(
                            color: textColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: textColor.withOpacity(0.2),
                          size: 10,
                        ),
                        SizedBox(
                          width: appPadding / 2,
                        ),
                        Text(
                          'Not subscribed',
                          style: TextStyle(
                            color: textColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
