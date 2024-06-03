import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/size.dart';
import 'package:myportfolio/core/widgets/drawer_mobile.dart';
import 'package:myportfolio/core/widgets/header_desktop.dart';
import 'package:myportfolio/core/widgets/header_mobile.dart';
import 'package:myportfolio/core/widgets/main_desktop.dart';
import 'package:myportfolio/core/widgets/main_mobile.dart';
import 'package:myportfolio/core/widgets/skills_desktop.dart';
import 'package:myportfolio/core/widgets/skills_mobile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffolfKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
          key: scaffolfKey,
          endDrawer:
              Constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(),
          backgroundColor: CustomColor.scaffoldBg,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              //main
              if (Constraints.maxWidth >= kMinDesktopWidth)
                HeaderDesktop()
              else
                HeaderMobile(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffolfKey.currentState?.openEndDrawer();
                  },
                ),
              if (Constraints.maxWidth >= kMinDesktopWidth)
                MainDesktop()
              else
                MainMobile(),

              //skills
              if (Constraints.maxWidth >= kMedDesktopWidth)
                SkillsDesktop()
              else
                SkillsMobile(),
              //projects
              Container(
                height: 500,
                width: double.maxFinite,
              ),
              //contacts
              Container(
                height: 500,
                width: double.maxFinite,
                color: Colors.blueGrey,
              ),
              //footer
              Container(
                height: 500,
                width: double.maxFinite,
              )
            ],
          ));
    });
  }
}
