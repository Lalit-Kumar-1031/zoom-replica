import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_replica/Utils/colors.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _page=0;

  onPageChange(int page)
  {
    setState(() {
      _page=page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ColorfulSafeArea(
      color: Colors.black,
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey.shade100,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          onTap: onPageChange,
          currentIndex: _page,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          iconSize: 29,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.video_call),label: 'Meet & Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble),label: 'Meeting'),
            BottomNavigationBarItem(icon: Icon(Icons.contacts),label: 'Contacts'),
            BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Setting'),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text('Meet & Chat'),
          centerTitle: true,
          actions: [IconButton(onPressed: ()async{
            FirebaseAuth.instance.signOut();
            Navigator.pushNamed(context, '/login');
          }, icon: Icon(Icons.logout))],
        ),
        body: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
