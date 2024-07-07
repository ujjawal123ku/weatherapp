import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:memo/pages/navpages/homePage.dart';




import 'drawer_page.dart';
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List pages=[
    Homepage(),



  ];
  int curIndex=0;
  void onTap(int index){
    setState(() {
      curIndex=index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Assign the GlobalKey to the Scaffold
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark
        ),

      ),

      body: pages[curIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
      unselectedFontSize: 0,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      onTap: onTap,
        currentIndex: curIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,

        items: [
         // BottomNavigationBarItem(icon: Icon(Icons.apps),label: "Home"),
         // BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),label: "Bar"),
        //  BottomNavigationBarItem(icon: Icon(Icons.search),label: "Search"),

        ],
        
      ),

    );
  }
}
