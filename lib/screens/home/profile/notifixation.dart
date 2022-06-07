import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/init/service/navigation_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                backAndTitleMethod("Notification"),
                InkWell(
                    child: SvgPicture.asset("assets/icons/setting.svg"),
                    onTap: () {
                      NavigationService.instance
                          .pushNamed("notification_setting");
                    })
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
