import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/nav_titles.dart';

class DrawerMobile extends StatelessWidget {
  const DrawerMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
          backgroundColor: CustomColor.scaffoldBg,
          child: ListView(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,bottom: 20,left: 20),
                  child: IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.close)),
                ),
              ), 
              for (int i = 0; i < navIcons.length; i++)
                ListTile(
                  onTap: () {
                    
                  },
                  contentPadding: EdgeInsets.symmetric(horizontal: 30), 
                  titleTextStyle: TextStyle(
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                  leading: Icon(navIcons[i]),
                  title: Text(navTitles[i]),
                )
            ],
          ),
        );
  }
}