import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';
import 'package:myportfolio/core/utils/project_utils.dart';
import 'package:myportfolio/core/widgets/project_card.dart';

class ProjectSection extends StatelessWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 60),
      width: screenWidth,
      color: CustomColor.scaffoldBg,
      child: Column(
        children: [
          //text
          Text(
            'Work project',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(spacing: 25, runSpacing: 25, children: [
              for (int i = 0; i < workProjectUtils.length; i++)
                ProjectCard(
                  project: workProjectUtils[i],
                )
            ]),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Hobby project',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 50,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 900),
            child: Wrap(spacing: 25, runSpacing: 25, children: [
              for (int i = 0; i < hobbyProjectUtils.length; i++)
                ProjectCard(
                  project: hobbyProjectUtils[i],
                )
            ]),
          )
        ],
      ),
    );
  }
}
