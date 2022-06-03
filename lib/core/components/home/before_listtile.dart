import 'package:flutter/material.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/init/service/navigation_service.dart';

Row beforeListCategoryHomeScreen(text, route) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(text,
          style: TextStyle(
              fontSize: FontConst.mediumFont + 2, fontWeight: FontWeight.w700)),
      InkWell(
          child: Text(
            "See all",
            style: TextStyle(
                color: ColorConst.darkGrey, fontWeight: FontWeight.w400),
          ),
          onTap: () {
            NavigationService.instance.pushNamed(route);
          })
    ],
  );
}
