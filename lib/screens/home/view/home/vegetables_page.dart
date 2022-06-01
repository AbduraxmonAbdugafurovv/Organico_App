import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';

class VegetablesPage extends StatefulWidget {
  const VegetablesPage({Key? key}) : super(key: key);

  @override
  State<VegetablesPage> createState() => _VegetablesPageState();
}

class _VegetablesPageState extends State<VegetablesPage> {
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
                backAndTitleMethod("Vegetables"),
                SvgPicture.asset("assets/icons/filter.svg"),
              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 
                        ScreenUtil().setWidth(176)/ScreenUtil().setHeight(234) ,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorConst.purpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
