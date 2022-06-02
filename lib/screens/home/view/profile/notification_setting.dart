import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';

class NotificationSettingPage extends StatefulWidget {
  const NotificationSettingPage({Key? key}) : super(key: key);

  @override
  State<NotificationSettingPage> createState() => _NotificationSettingPageState();
}

class _NotificationSettingPageState extends State<NotificationSettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24),),
            backAndTitleMethod("Notification Setting"),
            SizedBox(height: ScreenUtil().setHeight(10)),
            SwitchListTile.adaptive(
              title: Text("In App Notification",style: TextStyle(fontSize: FontConst.mediumFont),),
              value: true, onChanged: (v){})
          ],
        ),
      ),
    );
  }
}