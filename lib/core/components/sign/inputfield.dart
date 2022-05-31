
  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:organico/screens/auth/cubit/auth_cubit.dart';

import '../../constant/constant.dart';

TextFormField inputfield(BuildContext context, controller, hint, bool obsecure) {
    return TextFormField(
      obscureText: obsecure,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle(),
        suffixIcon: IconButton(
            splashRadius: 13,
            onPressed: () {
              context.read<AuthCubit>().closeEye(obsecure);
            },
            icon: obsecure
                ? const Icon(Icons.visibility_off_sharp)
                : const Icon(Icons.remove_red_eye_sharp)),
        contentPadding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(16),
            vertical: ScreenUtil().setHeight(13)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      validator: (v) {},
    );
  }


  TextFormField phoneInput(controller) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConst.green),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      validator: (v) {},
    );
  }


  TextStyle hintStyle() {
    return TextStyle(
        fontSize: FontConst.mediumFont,
        fontWeight: FontWeight.w700,
        color: ColorConst.grey);
  }

