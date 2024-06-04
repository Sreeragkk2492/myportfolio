import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/utils/project_utils.dart';
import 'dart:js'as js;

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project
  });

 final ProjectUtils project; 

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 260, 
      height: 290,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: CustomColor.bgLight2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            project.image,
            height: 140,
            fit: BoxFit.cover,
            width: double.maxFinite,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            child: Text(
              project.title,
              style: TextStyle(
                  //  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: CustomColor.whitePrimary),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
            child: Text(
              project.subtitle,
              style: TextStyle(
                  //  fontSize: 16,
                  fontSize: 10,
                  color: CustomColor.whiteSecondary),
            ),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(
                vertical: 10, horizontal: 12),
            color: CustomColor.bgLight1,
            child: Row(
              children: [
                Text(
                  'Available on:',
                  style: TextStyle(
                      color: CustomColor.yellowSecondary,
                      fontSize: 12),
                ),
                Spacer(),
                if(project.iosLink!=null)
                InkWell(
                  onTap: () {
                    js.context.callMethod('open',[project.iosLink]); 
                  },
                    child: Image.asset(
                  'assets/ios_icon.png', 
                  width: 16,
                )),
                if(project.androidLink!=null)
                InkWell(
                  onTap: () {
                    js.context.callMethod('open',[project.androidLink]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 5, right: 5),
                    child: Image.asset(
                      'assets/android_icon.png',
                      width: 16,
                    ),
                  ),
                ),
                if(project.webLink!=null)
                InkWell(
                  onTap: () {
                     js.context.callMethod('open',[project.webLink]); 
                  },
                    child: Image.asset(
                  'assets/web_icon.png',
                  width: 16,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}