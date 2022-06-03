import 'package:flutter/material.dart';
import 'package:organico/core/constant/constant.dart';

Text marketName(text) {
  return Text(text,
      style: TextStyle(
          fontSize: FontConst.mediumFont,
          color: ColorConst.grey,
          fontWeight: FontWeight.w400));
}

  Text priceThing(text) {
    return Text(text,
        style: TextStyle(
            fontSize: FontConst.mediumFont, fontWeight: FontWeight.w600));
  }

  Text nameThing(text) {
    return Text(text,
        style: TextStyle(
            fontSize: FontConst.mediumFont, fontWeight: FontWeight.w600));
  }