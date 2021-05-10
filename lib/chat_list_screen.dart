import 'package:chat_app/users_model.dart';
import 'package:flutter/material.dart';

import 'chat_detail.dart';
import 'message_model.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  TextEditingController textSearch = TextEditingController();
  bool isMessageRead = false;
  List<Users> chatUsers = [
    Users(id: "0", name: "สำนักงานใหญ่", messageText: "สวัสดีค่ะ", imageURL: "", time: "18.00"),
    Users(id: "1", name: "ตัวแทนจำหน่ายภาคเหนือ", messageText: "สวัสดีค่ะ", imageURL: "", time: "เมื่อวาน"),
    Users(id: "2", name: "ตัวแทนจำหน่ายภาคตะวันออกเฉียงเหนือ", messageText: "สวัสดีค่ะ", imageURL: "", time: "เมื่อวาน"),
    Users(id: "3", name: "ตัวแทนจำหน่ายภาคตะวันออก", messageText: "สวัสดีค่ะ", imageURL: "", time: "28/4"),
    Users(id: "4", name: "ตัวแทนจำหน่ายภาคตะวันตก", messageText: "สวัสดีค่ะ", imageURL: "", time: "23/4"),
    Users(id: "5", name: "ตัวแทนจำหน่ายภาคใต้", messageText: "สวัสดีค่ะ", imageURL: "", time: "17/3"),
  ];
  List<Message> messages = [];

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16,right: 16,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("แชท",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
                    Row(
                        children: <Widget>[
                          IconButton(icon: Icon(Icons.photo_camera_front, color: Colors.black,), onPressed: null),
                          IconButton(icon: Icon(Icons.mark_chat_unread_outlined, color: Colors.black,), onPressed: null),
                          IconButton(icon: Icon(Icons.workspaces_filled,  color: Colors.black,), onPressed: null)
                        ],
                      ),

                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5,left: 16,right: 16),
              child: Container(
                height: 40.0,
                child: TextField(
                  controller: textSearch,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: "ค้นหา",
                    hintStyle: TextStyle(color: Colors.grey.shade600),
                    prefixIcon: Icon(Icons.search,color: Colors.grey.shade600, size: 20,),
                    suffixIcon: Icon(Icons.qr_code_outlined,color: Colors.grey.shade600, size: 20,),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    contentPadding: EdgeInsets.all(1),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Colors.grey.shade100
                        )
                    ),
                  ),
                ),
              ),
            ),

            Container(
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ChatDetail(chatUsers[index].id,chatUsers[index].name)));
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                CircleAvatar(
                                  maxRadius: 25.0,
                                  child: Icon(Icons.account_circle, size: 40.0,color: Colors.white,),
                                ),
                                SizedBox(width: 16,),
                                Expanded(
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(chatUsers[index].name, style: TextStyle(fontSize: 16),),
                                        SizedBox(height: 6,),
                                        Text(chatUsers[index].messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600, fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(chatUsers[index].time,style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}






