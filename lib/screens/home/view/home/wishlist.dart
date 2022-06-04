import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';

class WishList extends StatefulWidget {
  const WishList({Key? key}) : super(key: key);

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            backAndTitleMethod("My Wishlist"),
            SizedBox(height: ScreenUtil().setHeight(28)),
            Expanded(
              child: GridView.builder(
                itemCount: 3,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10, crossAxisCount: 2,
                    crossAxisSpacing: 18
                    ),
                itemBuilder: (context, index) {
                  return Container(
                    width: ScreenUtil().setWidth(180),
                    height: ScreenUtil().setHeight(180),
                    decoration: BoxDecoration(
                        color: ColorConst.purpleAccent,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                  height: ScreenUtil().setHeight(75),
                                  child: Image.asset("assets/images/veget.png"))
                            ],
                          )
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
