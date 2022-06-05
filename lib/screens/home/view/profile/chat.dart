import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:organico/core/components/sign/back_and_title.dart';
import 'package:organico/core/constant/constant.dart';
import 'package:organico/model/message_model.dart';
import 'package:organico/model/model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<Message> messages = [
    Message(text: "a", date: DateTime.now(), isSentByMe: false)
  ].reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            backAndTitleMethod("Popey shop - New Yokr"),
            Expanded(
              child: SizedBox(
                child: GroupedListView<Message, DateTime>(
                  elements: messages,
                  groupBy: (message) => DateTime(
                    message.date!.year,
                    message.date!.month,
                    message.date!.day,
                  ),
                  groupHeaderBuilder: (Message message) => const SizedBox(),
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
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    message.text.toString(),
                                    style: TextStyle(
                                        fontSize: FontConst.mediumFont,
                                        color: ColorConst.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                )
                              :const CircleAvatar(
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
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Text(
                                    message.text.toString(),
                                    style: TextStyle(
                                        fontSize: FontConst.mediumFont,
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
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        hintText: "Type e message",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(5),
                ),
                InkWell(
                  child: SvgPicture.asset("assets/icons/send.svg"),
                  onTap: (){
                    setState(() {
                    messages.add(Message(text:_textEditingController.text , date: DateTime.now(), isSentByMe: true));
                      _textEditingController.clear();
                    });
                  },
                )
              ],
            ),
            SizedBox(
              height: ScreenUtil().setHeight(20),
            ),
          ],
        ),
      ),
    );
  }
}
