import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/skill_items.dart';

class SkillsMobile extends StatelessWidget {
  const SkillsMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      width: screenWidth,
      padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
      color: CustomColor.bgLight1,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: Column(
          children: [
            Text(
              'What i can do',
              style: TextStyle(
                  fontSize: 24,
                  color: CustomColor.whitePrimary,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: [
                for (int i = 0; i < platformItems.length; i++)
                  Container(
                    padding: EdgeInsets.only(bottom: 5),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: CustomColor.bgLight2,
                        borderRadius: BorderRadius.circular(5)),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      leading: Image.asset(
                        platformItems[i]['img'],
                        width: 26,
                      ),
                      title: Text(platformItems[i]['title']),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    backgroundColor: CustomColor.bgLight2,
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                    label: Text(skillItems[i]['title']),
                    avatar: Image.asset(skillItems[i]['img']),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
