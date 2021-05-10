import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'message_model.dart';

class ChatDetail extends StatefulWidget {
  String id;
  String name;


  ChatDetail(this.id ,this.name);
  @override
  _ChatDetailState createState() => _ChatDetailState(this.id, this.name);
}

class _ChatDetailState extends State<ChatDetail> {
  _ChatDetailState(this.id, this.name);
  TextEditingController textContent = TextEditingController();
  String id;
  String name;
  List<Message> messages = [
    Message(messageContent: "สวัสดีค่ะ", messageType: "receiver",),
    Message(messageContent: "สวัสดีครับ", messageType: "sender",),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  widget.name.length > 15 ? widget.name.substring(0,15) +"..." : widget.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Spacer(),
                IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: null),
                IconButton(
                    icon: Icon(Icons.call, color: Colors.black),
                    onPressed: null),
                IconButton(
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 35.0,
                    ),
                    onPressed: null),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: messages.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10,bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index){
              return Container(
                padding: EdgeInsets.only(left: 14,right: 14,top: 3,bottom: 3),
                child: Align(
                  alignment: (messages[index].messageType == "receiver" ? Alignment.topLeft : Alignment.topRight),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: (messages[index].messageType  == "receiver" ? Colors.grey.shade200:Colors.green[300]),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                        Icons.add,
                        color: Colors.black,
                        size: 30,
                      ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      controller: textContent,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(0),
                          hintStyle: TextStyle(color: Colors.black),
                          border: InputBorder.none,
                          isDense: true
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      messages.add(Message( messageContent: "${textContent.text}", messageType: "sender",));
                      textContent.clear();
                      setState(() {

                      });
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.black,
                      size: 30,
                    ),
                    backgroundColor: Colors.white,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
