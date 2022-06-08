
  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/core/components/home/list_title.dart';
import 'package:organico/core/constant/constant.dart';

ListTile details(icon,text1,text2) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: SvgPicture.asset(icon),
      title: listTitile(text1),
      subtitle: listSubtitle(text2),
    );
  }

  
  Text infoNameItem(name) {
    return Text(name,
        style: TextStyle(
            fontSize: FontConst.extraLargeFont, fontWeight: FontWeight.w600));
  }

  Center infoImg(img) {
    return Center(
      child: SizedBox(
        height: ScreenUtil().setHeight(194),
        width: ScreenUtil().setWidth(238),
        child: SvgPicture.asset(
        img
        ),
      ),
    );
  }
