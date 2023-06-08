import 'package:admin_dashboard/models/trainee_model.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../linkapi.dart';
import '../../models/discussions_info_model.dart';

class DiscussionInfoDetail extends StatelessWidget {
  const DiscussionInfoDetail({Key? key, required this.traineeModel})
      : super(key: key);

  final TraineeModel traineeModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: appPadding),
      padding: EdgeInsets.all(appPadding / 2),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Image.network(
              '${AppLink.server}${traineeModel.personalPic!}',
              height: 38,
              width: 38,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    traineeModel.fullName!,
                    style: TextStyle(
                        color: textColor, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    traineeModel.startDate!,
                    style: TextStyle(
                      color: textColor.withOpacity(0.5),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(
            Icons.more_vert_rounded,
            color: textColor.withOpacity(0.5),
            size: 18,
          )
        ],
      ),
    );
  }
}
