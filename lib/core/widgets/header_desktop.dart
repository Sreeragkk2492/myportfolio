import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/nav_titles.dart';
import 'package:myportfolio/core/styles/style.dart';
import 'package:myportfolio/core/widgets/site_logo.dart';

class HeaderDesktop extends StatelessWidget {
  const HeaderDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
              height: 60,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.maxFinite,
              decoration: kHeaderdecoration,
              child: Row(
                children: [
                 SiteLogo(onTap: () {
                   
                 },),
                  Spacer(),
                  for (int i = 0; i < navTitles.length; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            navTitles[i],
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: CustomColor.whitePrimary),
                          )),
                    )
                ],
              ),
            );
  }
}