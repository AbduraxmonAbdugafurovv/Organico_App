import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/screens/home/state/home_state.dart';

class MyOrdersPage extends StatefulWidget {
  const MyOrdersPage({Key? key}) : super(key: key);

  @override
  State<MyOrdersPage> createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: MyOrdersPage,
        onPageBuildre: (context, widget) {
          return Scaffold(
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  backAndTitleMethod("My Orders"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(26)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Ongoing",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont + 2,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(height: ScreenUtil().setHeight(10)),
                            SizedBox(
                              width: ScreenUtil().setWidth(114),
                              child: Divider(
                                thickness: 3,
                                height: ScreenUtil().setHeight(3),
                                color: ColorConst.black,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text("History",
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont + 2,
                                    fontWeight: FontWeight.w700)),
                                    SizedBox(height: ScreenUtil().setHeight(10),),
                            SizedBox(
                              width: ScreenUtil().setWidth(114),
                              child: Divider(
                                thickness: 3,
                                height: ScreenUtil().setHeight(3),
                                color: Colors.transparent,
                              ),
                            ),
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
