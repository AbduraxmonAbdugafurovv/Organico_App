import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/screens/home/cubit/home_cubit.dart';
import 'package:organico/screens/home/state/hone_state.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  final pages = [
    const Text("a"),
    const Text("b"),
    const Text("c"),
    const Text("d"),
  ];
  @override
  Widget build(BuildContext context) {
    var pageindex = context.watch<HomeCubit>().pageIndex;
    return BaseView(
        viewModal: BottomNavigationPage,
        onPageBuildre: (context, widget) {
          return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
            if (state is HomeInitial) {
              return Scaffold(
                body: pages[context.watch<HomeCubit>().pageIndex],
                bottomNavigationBar: BottomNavigationBar(
                  selectedLabelStyle: TextStyle(color: ColorConst.black),
                  items: [
                    BottomNavigationBarItem(
                        label: "Home",
                        icon: pageindex == 0
                            ? SvgPicture.asset("assets/icons/select_home.svg")
                            : SvgPicture.asset("assets/icons/home.svg")),
                    BottomNavigationBarItem(
                        label: "Explore",
                        icon: pageindex == 1
                            ? SvgPicture.asset("assets/icons/select_search.svg")
                            : SvgPicture.asset("assets/icons/search_icon.svg")),
                    BottomNavigationBarItem(
                        label: "Cart",
                        icon: pageindex == 2
                            ? SvgPicture.asset("assets/icons/select_cart.svg")
                            : SvgPicture.asset("assets/icons/cart_icon.svg")),
                    BottomNavigationBarItem(
                        label: "Profile",
                        icon: pageindex == 3
                            ? SvgPicture.asset(
                                "assets/icons/select_profile.svg")
                            : SvgPicture.asset("assets/icons/profile.svg")),
                  ],
                  currentIndex: context.watch<HomeCubit>().pageIndex,
                  onTap: (index) {
                    context.read<HomeCubit>().changePage(index);
                  },
                ),
              );
            } else if (state is HomeLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else {
              return const Text("Hato");
            }
          });
        });
  }
}
