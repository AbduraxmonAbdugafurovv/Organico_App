import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(24),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(65),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",
                        style: TextStyle(
                            fontSize: FontConst.mediumFont + 2,
                            fontWeight: FontWeight.w700)),
                    SvgPicture.asset("assets/icons/notification.svg")
                  ],
                ),
              ),
              SizedBox(height: ScreenUtil().setHeight(28)),
              CircleAvatar(
                radius: ScreenUtil().setWidth(65),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(24),
              ),
              Text("Jane Doe",
                  style: TextStyle(
                      fontSize: FontConst.mediumFont + 2,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                height: ScreenUtil().setHeight(8),
              ),
              Text("(99) 999-99-99",
                  style: TextStyle(
                      fontSize: FontConst.mediumFont + 2,
                      fontWeight: FontWeight.w700,
                      color: ColorConst.grey)),
              SizedBox(height: ScreenUtil().setHeight(44)),
              profileCategory("edit_profile", "Edit Profile", ""),
              profileCategory("my_orders", "My orders", ""),
              profileCategory("my_wishlist", "My Wishlist", ""),
              profileCategory("address", "My Address", ""),
              profileCategory("payment", "Payment Methos", ""),
              profileCategory("customer_service", "Customer Service", ""),
              profileCategory("change_password", "Change Password", ""),
              profileCategory("logout", "Logout", ""),
            ],
          ),
        ),
      ),
    );
  }

  InkWell profileCategory(icon, text, routeName) {
    return InkWell(
      child: SizedBox(
        height: ScreenUtil().setHeight(68),
        child: Row(
          children: [
            SvgPicture.asset("assets/icons/$icon.svg"),
            SizedBox(width: ScreenUtil().setWidth(20)),
            Text(text,
                style: TextStyle(
                    fontSize: FontConst.mediumFont,
                    fontWeight: FontWeight.w600)),
            const Expanded(child: SizedBox()),
            SvgPicture.asset("assets/icons/right.svg"),
          ],
        ),
      ),
      onTap: () {
        NavigationService.instance.pushNamed(routeName);
      },
    );
  }
}
