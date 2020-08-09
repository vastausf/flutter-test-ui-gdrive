import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gdrive/project_colors.dart';
import 'package:gdrive/sizes.dart';
import 'package:gdrive/strings.dart';

import 'fonts.dart';

class CustomAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ProjectSizes.xSmallSpacing, horizontal: ProjectSizes.xxxSmallSpacing),
      child: Row(
        children: [
          Image.asset(
            "assets/images/burger.png",
            height: ProjectSizes.normalSize,
            width: ProjectSizes.normalSize,
          ),
          Expanded(
            child: Text(
              Strings.myDrive,
              textAlign: TextAlign.center,
              style: ProjectFonts.normalMedium(color: ProjectColors.text2),
            ),
          ),
          ClipOval(
            child: Image.asset(
              "assets/images/avatar.png",
              height: ProjectSizes.normalSize,
              width: ProjectSizes.normalSize,
            ),
          )
        ],
      ),
    );
  }
}
