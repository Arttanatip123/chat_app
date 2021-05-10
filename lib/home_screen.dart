import 'package:chat_app/chat_list_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChatList(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.shade600,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "แชท",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: "อื่นๆ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: "อื่นๆ",
          ),
        ],
      ),
    );
  }
}
