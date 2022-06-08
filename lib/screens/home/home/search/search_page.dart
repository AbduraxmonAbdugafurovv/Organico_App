import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SearchPage,
        onPageBuildre: (context, page) {
          return Scaffold(
            body: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().setHeight(24),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/icons/left.svg"),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
