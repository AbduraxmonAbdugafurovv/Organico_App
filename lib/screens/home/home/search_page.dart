import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/inputfield.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/data/data.dart';
import 'package:organico/screens/home/home/homescreen/cubit_homescren.dart';
import 'package:organico/screens/home/home/homescreen/state_homescreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: SearchPage,
        onPageBuildre: (context, page) {
          return BlocBuilder<HomeScreenCubit, HomeScreenState>(
              builder: (context, state) {
            if (state is HomeScreenSearch) {
              return Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenUtil().setHeight(30),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(88),
                      child: Row(
                        children: [
                          InkWell(
                            child: SvgPicture.asset("assets/icons/left.svg"),
                            onTap: () {
                              context.read<HomeScreenCubit>().backToHome();
                            },
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(30),
                          ),
                          Expanded(
                            child: TextFormField(
                              autofocus: true,
                              controller: context
                                  .read<HomeScreenCubit>()
                                  .searchController,
                              decoration: InputDecoration(
                                  filled: true,
                                  hintText: "Search anything here",
                                  hintStyle: hintStyle(),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: ScreenUtil().setWidth(16),
                                        vertical: ScreenUtil().setHeight(13)),
                                    child: SvgPicture.asset(
                                        "assets/icons/search_any.svg"),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: ScreenUtil().setWidth(16),
                                      vertical: ScreenUtil().setHeight(13)),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  )),
                              onTap: () {
                                context
                                    .read<HomeScreenCubit>()
                                    .moveToSearchPage();
                              },
                              onChanged: (v) {
                                for (var element1 in Data.data) {
                                  for (var item in element1) {
                                    if (v.isEmpty) {
                                      context.read<HomeScreenCubit>().clear();
                                    } else if (item.name
                                        .toLowerCase()
                                        .toString()
                                        .contains(
                                          v.toLowerCase().toString(),
                                        )) {
                                      context
                                          .read<HomeScreenCubit>()
                                          .addToSearchedItems(item);
                                    } 
                                  }
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(28)),
                    context.watch<HomeScreenCubit>().searchedItems.isEmpty
                        ? emptysearched()
                        : searchingResults(context),
                  ],
                ),
              );
            } else {
              return const Text("Hato search ");
            }
          });
        });
  }

  Expanded  searchingResults(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Result for:${context.watch<HomeScreenCubit>().searchController.text}",
            style: TextStyle(
                fontSize: FontConst.mediumFont + 2,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:
                      ScreenUtil().setWidth(176) / ScreenUtil().setHeight(234),
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 22,
                  crossAxisCount: 2),
              itemCount: context.watch<HomeScreenCubit>().searchedItems.length,
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
                            child: SvgPicture.asset(context
                                .watch<HomeScreenCubit>()
                                .searchedItems
                                .toList()[index]
                                .img)),
                        SizedBox(height: ScreenUtil().setHeight(12)),
                        Text(
                            context
                                .watch<HomeScreenCubit>()
                                .searchedItems
                                .toList()[index]
                                .name,
                            style: TextStyle(
                                fontSize: FontConst.mediumFont,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: ScreenUtil().setHeight(4)),
                        Expanded(
                          child: Text(
                              context
                                  .watch<HomeScreenCubit>()
                                  .searchedItems
                                  .toList()[index]
                                  .shop,
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont - 2,
                                  color: ColorConst.grey,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                context
                                    .watch<HomeScreenCubit>()
                                    .searchedItems
                                    .toList()[index]
                                    .price,
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
    );
  }

  Expanded emptysearched() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Resent",
              style: TextStyle(
                  fontSize: FontConst.mediumFont + 2,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: ScreenUtil().setHeight(200),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: SvgPicture.asset("assets/icons/search_icon.svg"),
                    trailing: InkWell(
                      child: SvgPicture.asset("assets/icons/close_icon.svg"),
                      onTap: () {},
                    ),
                    title: Text("Assalom",
                        style: TextStyle(
                            fontSize: FontConst.mediumFont,
                            fontWeight: FontWeight.w400,
                            color: ColorConst.grey)),
                  );
                }),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Text(
            "Popular",
            style: TextStyle(
                fontSize: FontConst.mediumFont + 2,
                fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio:
                      ScreenUtil().setWidth(176) / ScreenUtil().setHeight(234),
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 22,
                  crossAxisCount: 2),
              itemCount: 2,
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
                            child:
                                SvgPicture.asset("assets/images/broccoli.svg")),
                        SizedBox(height: ScreenUtil().setHeight(12)),
                        Text("Broccoli",
                            style: TextStyle(
                                fontSize: FontConst.mediumFont,
                                fontWeight: FontWeight.w600)),
                        SizedBox(height: ScreenUtil().setHeight(4)),
                        Expanded(
                          child: Text("birnaa",
                              style: TextStyle(
                                  fontSize: FontConst.mediumFont - 2,
                                  color: ColorConst.grey,
                                  fontWeight: FontWeight.w400)),
                        ),
                        const Expanded(child: SizedBox()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("dsf",
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
    );
  }
}
