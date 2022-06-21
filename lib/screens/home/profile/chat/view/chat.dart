import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:organico/base/baseview.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/core/widget/circle_avatar.dart';
import 'package:organico/model/message_model.dart';
import 'package:organico/model/model.dart';
import 'package:organico/screens/home/profile/chat/cubit/chat_cubit.dart';
import 'package:organico/screens/home/profile/chat/state/chat_state.dart';

// ignore: must_be_immutable
class ChatPage extends StatefulWidget {
  Model info;
  ChatPage({required this.info, Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
        viewModal: ChatPage,
        onPageBuildre: (context, widge) {
          return BlocBuilder<ChatCubit, ChatState>(builder: (context, state) {
            if (state is ChatInitialState) {
              return Scaffold(
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(20)),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: ScreenUtil().setHeight(24)),
                      backAndTitleMethod(widget.info.shop),
                      SizedBox(height: ScreenUtil().setHeight(28)),
                      Container(
                        width: double.infinity,
                        height: ScreenUtil().setHeight(87),
                        decoration: BoxDecoration(
                          color: ColorConst.purpleAccent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Row(
                            children: [
                              SvgPicture.asset(widget.info.img.toString()),
                              SizedBox(width: ScreenUtil().setWidth(20)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.info.name.toString(),
                                      style: TextStyle(
                                          fontSize: FontConst.mediumFont,
                                          fontWeight: FontWeight.w600)),
                                  SizedBox(height: ScreenUtil().setHeight(5)),
                                  Text(
                                    widget.info.shop.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: ColorConst.grey),
                                  )
                                ],
                              ),
                              const Expanded(child: SizedBox()),
                              Text(
                                widget.info.price.toString(),
                                style: TextStyle(
                                    fontSize: FontConst.mediumFont,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: GroupedListView<Message, DateTime>(
                            elements: context.watch<ChatCubit>().messages,
                            groupBy: (message) => DateTime(
                              message.date!.year,
                              message.date!.month,
                              message.date!.day,
                            ),
                            groupHeaderBuilder: (Message message) =>
                                const SizedBox(),
                            itemBuilder: (context, message) => Align(
                              alignment: message.isSentByMe!
                                  ? Alignment.centerRight
                                  : Alignment.centerLeft,
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: message.isSentByMe!
                                      ? MainAxisAlignment.end
                                      : MainAxisAlignment.start,
                                  children: [
                                    message.isSentByMe!
                                        ? Container(
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: message.isSentByMe!
                                                  ? ColorConst.mySelfColor
                                                  : ColorConst.yourSelfColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Text(
                                              message.text.toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      FontConst.mediumFont,
                                                  color: ColorConst.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                        : const CircleAvatar(
                                            radius: 24,
                                          ),
                                    message.isSentByMe!
                                        ? const CircleAvatar(
                                            radius: 24,
                                          )
                                        : Container(
                                            margin: const EdgeInsets.all(10),
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: message.isSentByMe!
                                                  ? ColorConst.mySelfColor
                                                  : ColorConst.yourSelfColor,
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Text(
                                              message.text.toString(),
                                              style: TextStyle(
                                                  fontSize:
                                                      FontConst.mediumFont,
                                                  color: ColorConst.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: ScreenUtil().setWidth(290),
                            child: TextField(
                              controller: context
                                  .watch<ChatCubit>()
                                  .textEditingController,
                              decoration: InputDecoration(
                                  hintText: "Type e message",
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(100))),
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(5),
                          ),
                          InkWell(
                            child: SvgPicture.asset("assets/icons/send.svg"),
                            onTap: () {
                              context.read<ChatCubit>().addToMessageList(
                                    context.read<ChatCubit>().messages,
                                    Message(
                                        text: context
                                            .read<ChatCubit>()
                                            .textEditingController
                                            .text,
                                        date: DateTime.now(),
                                        isSentByMe: true),
                                  );
                              context.read<ChatCubit>().clear(context
                                  .read<ChatCubit>()
                                  .textEditingController);
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ScreenUtil().setHeight(20),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ChatLoadingState) {
              return circular();
            } else {
              return const Text("Hato state daa");
            }
          });
        });
  }
}