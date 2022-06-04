import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:organico/core/components/sign/back_and_title.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List <Message> messages = [
    Message
  ]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(20)),
        child: Column(
          children: [
            SizedBox(height: ScreenUtil().setHeight(24)),
            backAndTitleMethod("Popey shop - New Yokr"),
      Expanded(child:Container(child: GroupedListView<MessageCodec,DateTime>(elements: , groupBy: ),)),

            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(290),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Type e message",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100))),
                  ),
                ),
                SizedBox(width: ScreenUtil().setWidth(5),),
                SvgPicture.asset("assets/icons/send.svg")

              ],
            ),
            SizedBox(height: ScreenUtil().setHeight(45),),
          ],
        ),
      ),
    );
  }
}
