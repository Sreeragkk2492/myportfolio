import 'package:flutter/material.dart';
import 'package:myportfolio/core/constants/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      height: screenHeight / 2,
      constraints: BoxConstraints(minHeight: 560.0),
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //avatar image
          ShaderMask(
              shaderCallback: (bounds) {
                return LinearGradient(colors: [
                  CustomColor.scaffoldBg.withOpacity(0.6),
                  CustomColor.scaffoldBg.withOpacity(0.6)
                ]).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Image.asset(
                'assets/flutter_avatar.png',
                width: screenWidth,
              )),
          SizedBox(
            height: 30,
          ),
          Text(
            'Hi\niam sreerag kk\na flutter developer',
            style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary),
          ),
          SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 180,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        WidgetStatePropertyAll(CustomColor.yellowPrimary)),
                onPressed: () {},
                child: Text(
                  'Get in touch',
                  style: TextStyle(color: CustomColor.whitePrimary),
                )),
          )
        ],
      ),
    );
  }
}
