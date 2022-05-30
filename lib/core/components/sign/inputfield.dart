
  import 'package:flutter/material.dart';
import 'package:organico/core/constant/constant.dart';


// TextFormField inputfield(controller,hint , bool obsecure ) {
//     return TextFormField(
//       obscureText: obsecure,
//                   controller: controller,
//                   decoration: InputDecoration(
//                     hintText: hint,
//                     hintStyle: hintStyle(),
//                     suffixIcon: IconButton(
//                       splashRadius: 13,
//                       onPressed: (){
//                         obsecure=false;
                        
//                       }, icon: obsecure?const Icon(Icons.remove_red_eye_rounded):const Icon(Icons.remove_red_eye_outlined)),
//                     contentPadding: EdgeInsets.symmetric(
//                         horizontal: ScreenUtil().setWidth(16),
//                         vertical: ScreenUtil().setHeight(13)),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(100),
//                     ),
//                   ),
//                   validator: (v){},
//                 );
//   }

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

