import 'package:flutter/material.dart';

import 'my_menu_items.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: ListView(
          children:[
            UserAccountsDrawerHeader(
              accountName: Text('Alaa R Basal'),
               accountEmail: Text('aloaabasal@gmail.com'),
               currentAccountPicture: Image.asset('assets/images/profile.jpg'),
               ),
               SizedBox(
                height:5,
               ),
               Divider(
                color: Colors.white,
               ),
            MyMenuItems(),
          ]
        ),
      ),
    );
  }
}