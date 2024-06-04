import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/size.dart';
import 'package:myportfolio/core/constants/sns_links.dart';
import 'package:myportfolio/core/utils/project_utils.dart';
import 'package:myportfolio/core/widgets/contact_section.dart';
import 'package:myportfolio/core/widgets/custom_textfield.dart';
import 'package:myportfolio/core/widgets/drawer_mobile.dart';
import 'package:myportfolio/core/widgets/footer_section.dart';
import 'package:myportfolio/core/widgets/header_desktop.dart';
import 'package:myportfolio/core/widgets/header_mobile.dart';
import 'package:myportfolio/core/widgets/main_desktop.dart';
import 'package:myportfolio/core/widgets/main_mobile.dart';
import 'package:myportfolio/core/widgets/project_card.dart';
import 'package:myportfolio/core/widgets/project_section.dart';
import 'package:myportfolio/core/widgets/skills_desktop.dart';
import 'package:myportfolio/core/widgets/skills_mobile.dart';
import 'dart:js'as js;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffolfKey = GlobalKey<ScaffoldState>();
  final scrollcontroller=ScrollController();
   final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, Constraints) {
      return Scaffold(
          key: scaffolfKey,
          endDrawer:
              Constraints.maxWidth >= kMinDesktopWidth ? null : DrawerMobile(onNavItemTap: (int navIndex) {
                scaffolfKey.currentState?.closeEndDrawer(); 
                scrollToSection(navIndex);
              }),
          backgroundColor: CustomColor.scaffoldBg,
          body: SingleChildScrollView( 
            controller: scrollcontroller, 
            scrollDirection: Axis.vertical, 
            child: Column(
             
              children: [
                SizedBox(key: navbarKeys.first,),
                //main
                if (Constraints.maxWidth >= kMinDesktopWidth)
                  HeaderDesktop(onNavMenuTap: (int navIndex) {
                    scrollToSection(navIndex);
                    },)
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
                  SkillsDesktop(key: navbarKeys[1],)
                else
                  SkillsMobile(key: navbarKeys[1],),
                //projects
                ProjectSection(key: navbarKeys[2],),
                //contacts
                ContactSection(key: navbarKeys[3],),
                //footer
               FooterSection(), 
              ],
            ),
          ));
    });
  }
   void scrollToSection(int navIndex) {
    if (navIndex == 4) {
      // open a blog page
      js.context.callMethod('open', [SnsLinks.blog]);
      return;
    }

    final key = navbarKeys[navIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
 

