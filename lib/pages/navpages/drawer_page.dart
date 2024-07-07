// Define a function that returns the Drawer widget

import 'package:flutter/material.dart';

Drawer appDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        UserAccountsDrawerHeader(

          accountName: Text("Ujjawal Kumar"),
          accountEmail: Text("john.doe@example.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/img/mypic.jpeg',),
            backgroundColor: Colors.blue,
          ),
          decoration: BoxDecoration(
            color: Colors.black54,
          ),

        ),
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            // Handle the Home item tap
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
          onTap: () {
            // Handle the Home item tap
            Navigator.pop(context); // Close the drawer
          },
        ),
        Divider(), // A divider between menu items
        ListTile(
          leading: Icon(Icons.bookmark),
          title: Text('Bookmarks'),
          onTap: () {
            // Handle the Logout item tap
            Navigator.pop(context); // Close the drawer
          },
        ),
        ListTile(
          leading: Icon(Icons.exit_to_app),
          title: Text('Logout'),
          onTap: () {
            // Handle the Home item tap
            Navigator.pop(context); // Close the drawer
          },
        ),

      ],
    ),
  );
}

// Your HomePage class remains the same as you've defined it



// Your main function remains the same as you've defined it
