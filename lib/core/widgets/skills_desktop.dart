import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/constants/skill_items.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
     final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return  Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                color: CustomColor.bgLight1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //text
                    Text(
                      'What i can do',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: CustomColor.whitePrimary),
                    ),
                    SizedBox(height: 50,), 
                    //platform and skills
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: 450),
                          child: Wrap(
                            spacing: 5,
                            runSpacing: 5,
                            children: [
                              for (int i = 0; i < platformItems.length; i++)
                                Container(
                                  
                                  width: 200,
                                  decoration: BoxDecoration(
                                    color: CustomColor.bgLight2,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: ListTile(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    leading:
                                        Image.asset(platformItems[i]['img'],width: 26,),
                                    title: Text(platformItems[i]['title']),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(width: 50,),

                        Flexible(
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 500), 
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                for(int i=0;i<skillItems.length;i++)
                                Chip(
                                  backgroundColor: CustomColor.bgLight2, 
                                  padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16), 
                                  label: Text(skillItems[i]['title']),avatar: Image.asset(skillItems[i]['img']),) 
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              );
  }
}