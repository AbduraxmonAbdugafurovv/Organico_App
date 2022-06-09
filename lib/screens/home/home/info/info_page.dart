import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/home/plus_minus_buttons.dart';
import 'package:organico/core/components/main_button.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/extension/context_extension.dart';
import 'package:organico/core/init/service/navigation_service.dart';
import 'package:organico/core/widget/bottom/details.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/model/model.dart';
import 'package:organico/screens/home/home/info/cubit_info.dart';
import 'package:organico/screens/home/home/info/state_info.dart.dart';

class InfoPage extends StatefulWidget {
  Model info;
  InfoPage({Key? key, required this.info}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: InfoPage,
        onPageBuildre: (context, widge) {
          return BlocBuilder<InfoCubit, InfoState>(builder: (context, state) {
            if (state is InfoInitial) {
              return Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: ScreenUtil().setHeight(24)),
                        SizedBox(
                            height: ScreenUtil().setHeight(64),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child:
                                      SvgPicture.asset("assets/icons/left.svg"),
                                  onTap: () {
                                    NavigationService.instance.pop();
                                  },
                                ),
                                InkWell(
                                  child: SvgPicture.asset(
                                      "assets/icons/favourite_icon.svg"),
                                  onTap: () {
                                    widget.info.wishlist =!widget.info.wishlist; 
                                    context.read<InfoCubit>().addToWishlist(widget.info);
                                  },
                                ),
                              ],
                            )),
                        SizedBox(height: ScreenUtil().setHeight(7)),
                        infoImg(  widget.info.img.toString(),),
                        SizedBox(height: ScreenUtil().setHeight(16)),
                        infoNameItem(widget.info.name.toString()),
                        SizedBox(height: ScreenUtil().setHeight(8)),
                        infoShop(),
                        Text(
                          widget.info.price.toString(),
                          style: TextStyle(
                            fontSize: FontConst.extraLargeFont,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(48),
                        ),
                        Text("Details",
                            style: TextStyle(
                                fontSize: FontConst.mediumFont + 2,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: ScreenUtil().setHeight(16)),
                        SizedBox(
                          height: ScreenUtil().setHeight(66),
                          child: Text( widget.info.details.toString(),
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont,
                                  color: ColorConst.grey)),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(24),
                        ),
                        details("assets/icons/time_delivery.svg",
                            "Time Delivery", widget.info.timeDelivery),
                        details("assets/icons/tag.svg", "Category",
                            widget.info.category),
                        SizedBox(height: ScreenUtil().setHeight(10)),
                        SizedBox(
                          width: context.width,
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                child: mainButton("Add to cart"),
                                onTap: () {},
                              )),
                              InkWell(
                                child:
                                    SvgPicture.asset("assets/icons/chat.svg"),
                                onTap: () {
                                  NavigationService.instance
                                      .pushNamed("chat", argument: widget.info);
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            } else if (state is InfoLoading) {
              return circular();
            } else {
              return const Text("Hato info cubit da ");
            }
          });
        });
  }

  Row infoShop() {
    return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.info.shop.toString(),
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont + 2,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConst.grey)),
                          SizedBox(
                            child: Row(
                              children: [
                                plusMinus("assets/icons/min.svg"),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24),
                                  child: Text(widget.info.count.toString(),
                                      style: TextStyle(
                                          fontSize: FontConst.extraLargeFont,
                                          fontWeight: FontWeight.w600)),
                                ),
                                plusMinus("assets/icons/plus.svg"),
                              ],
                            ),
                          )
                        ],
                      );
  }

}
