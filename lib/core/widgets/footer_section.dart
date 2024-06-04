import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.maxFinite,
                child: Text(
                  'Created by Sreerag kk',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: CustomColor.whiteSecondary),
                ),
              );
  }
}