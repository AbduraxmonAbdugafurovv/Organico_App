import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/model/model.dart';

class CategoriesPage extends StatefulWidget {
  List<Model> listCategory;
 CategoriesPage({required this.listCategory, Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
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
                    childAspectRatio: ScreenUtil().setWidth(176) /
                        ScreenUtil().setHeight(234),
                    mainAxisSpacing: 28,
                    crossAxisSpacing: 22,
                    crossAxisCount: 2),
                itemCount: widget.listCategory.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorConst.purpleAccent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: ScreenUtil().setHeight(80),
                              child: SvgPicture.asset(widget.listCategory[index].img.toString())),
                          SizedBox(height: ScreenUtil().setHeight(12)),
                          Text(widget.listCategory[index].name.toString(),
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont,
                                  fontWeight: FontWeight.w600)),
                          SizedBox(height: ScreenUtil().setHeight(4)),
                          Expanded(
                            child: Text(widget.listCategory[index].shop.toString(),
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont-2,
                                    color: ColorConst.grey,
                                    fontWeight: FontWeight.w400)),
                          ),
                                  const  Expanded(child: SizedBox()),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.listCategory[index].price.toString(),
                                  style: TextStyle(
                                      fontSize: FontConst.mediumFont,
                                      fontWeight: FontWeight.w600)),

                              Container(
                                height: ScreenUtil().setHeight(36),
                                width: ScreenUtil().setWidth(36),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorConst.green),
                                child: Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child:
                                      SvgPicture.asset("assets/icons/plus.svg"),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
