import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gdrive/custom_app_bar.dart';
import 'package:gdrive/dataClasses.dart';
import 'package:gdrive/fonts.dart';
import 'package:gdrive/project_colors.dart';
import 'package:gdrive/sizes.dart';
import 'package:gdrive/strings.dart';

class HomePage extends StatelessWidget {
  List<FolderData> folders = <FolderData>[
    FolderData(
        title: "Web Design",
        date: "20 Dec 2020",
        color1: ProjectColors.brandPrimary,
        color2: ProjectColors.brandPrimary2),
    FolderData(
        title: "App Design",
        date: "21 Dec 2020",
        color1: ProjectColors.brandSecondary,
        color2: ProjectColors.brandSecondary2),
    FolderData(
        title: "Font collections",
        date: "22 Dec 2020",
        color1: ProjectColors.redAccent,
        color2: ProjectColors.redAccent2),
    FolderData(
        title: "Illustrations",
        date: "23 Dec 2020",
        color1: ProjectColors.brandTertiary,
        color2: ProjectColors.brandTertiary2),
    FolderData(
        title: "Pattern",
        date: "24 Dec 2020",
        color1: ProjectColors.brandPrimary,
        color2: ProjectColors.brandPrimary2),
    FolderData(
        title: "My Portfolio",
        date: "24 Dec 2020",
        color1: ProjectColors.brandSecondary,
        color2: ProjectColors.brandSecondary2),
  ];

  Widget buildFloatingActionButton() {
    return Container(
        padding: EdgeInsets.all(ProjectSizes.xSmallSpacing),
        decoration: BoxDecoration(
            color: ProjectColors.brandPrimary,
            borderRadius: BorderRadius.circular(ProjectSizes.bigRadius)),
        child: Image.asset("assets/images/add.png",
            color: ProjectColors.white,
            height: ProjectSizes.bigSize,
            width: ProjectSizes.bigSize));
  }

  Widget buildFreeStorageBlock() {
    return Padding(
      padding: EdgeInsets.all(ProjectSizes.xxSmallSpacing),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: ProjectColors.brandPrimary,
            borderRadius: BorderRadius.circular(ProjectSizes.normalRadius)),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.all(ProjectSizes.bigSpacing),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/app_logo.png",
                      height: ProjectSizes.xxxBigSize,
                      width: ProjectSizes.xxxBigSize,
                    ),
                    SizedBox(
                      height: ProjectSizes.xSmallSpacing,
                    ),
                    Text(
                      Strings.freeStorage,
                      style: ProjectFonts.largeSemibold(color: ProjectColors.white),
                    ),
                    SizedBox(
                      height: ProjectSizes.xxSmallSize,
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            //TODO: Change on device free space
                            text: "7,5 Gb ",
                            style: ProjectFonts.normalMedium(color: ProjectColors.white)),
                        TextSpan(
                            //TODO: Change on GDrive max space
                            text: "/ 15 Gb ",
                            style:
                                ProjectFonts.normalRegular(color: ProjectColors.white60))
                      ]),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                      alignment: Alignment.bottomRight,
                      child: Stack(
                        children: [
                          SizedBox(
                            child: CircularProgressIndicator(
                              //TODO: Change on device free space
                              value: 0.5,
                              strokeWidth: 3,
                              backgroundColor: ProjectColors.brandPrimary2,
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(ProjectColors.white),
                            ),
                            height: ProjectSizes.xxxBigSize,
                            width: ProjectSizes.xxxBigSize,
                          ),
                          Text(
                            //TODO: Change on device free space
                            "50%",
                            style: ProjectFonts.normalRegular(color: ProjectColors.white),
                          )
                        ],
                        alignment: Alignment.center,
                      )),
                )
              ],
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: ProjectSizes.xxBigSize,
              height: ProjectSizes.xxBigSize,
              decoration: BoxDecoration(
                  color: ProjectColors.brandPrimary2,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(ProjectSizes.xSmallRadius),
                      bottomLeft: Radius.circular(ProjectSizes.xSmallRadius))),
              child: Icon(
                Icons.keyboard_arrow_right,
                size: ProjectSizes.normalSize,
                color: ProjectColors.white,
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget buildSearchBlock() {
    return Padding(
      padding: EdgeInsets.all(ProjectSizes.xSmallSpacing),
      child: Container(
          decoration: BoxDecoration(
              color: ProjectColors.white,
              borderRadius: BorderRadius.circular(ProjectSizes.bigRadius)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(ProjectSizes.xSmallSpacing),
                child: Image.asset(
                  "assets/images/search.png",
                  height: ProjectSizes.normalSize,
                  width: ProjectSizes.normalSize,
                  color: ProjectColors.text3,
                ),
              ),
              Expanded(
                child: TextField(
                  style: ProjectFonts.normalRegular(color: ProjectColors.text1),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: Strings.searchFiles,
                      hintStyle: ProjectFonts.normalRegular(color: ProjectColors.text3)),
                ),
              )
            ],
          )),
    );
  }

  Widget buildFolderIcon(Color color1, Color color2) {
    return Container(
      height: ProjectSizes.folderHeight,
      width: ProjectSizes.folderWidth,
      child: Stack(
        children: [
          Positioned(
              right: ProjectSizes.folderBackRightSpacing,
              child: Image.asset(
                "assets/images/folder_back.png",
                height: ProjectSizes.folderBackHeight,
                width: ProjectSizes.folderBackWidth,
                color: color2,
              )),
          Positioned(
              bottom: 0,
              child: Image.asset(
                "assets/images/folder_front.png",
                height: ProjectSizes.folderFrontHeight,
                width: ProjectSizes.folderFrontWidth,
                color: color1,
              )),
        ],
      ),
    );
  }

  Widget buildFolderBlock(FolderData folderData) {
    return Container(
      padding: EdgeInsets.all(ProjectSizes.xSmallSpacing),
      decoration: BoxDecoration(
          color: folderData.color1.withOpacity(0.16),
          borderRadius: BorderRadius.circular(ProjectSizes.xSmallRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              buildFolderIcon(folderData.color1, folderData.color2),
              Expanded(
                child: Container(),
              ),
              Image.asset("assets/images/options.png",
                  height: ProjectSizes.normalSize,
                  width: ProjectSizes.normalSize,
                  color: folderData.color2)
            ],
          ),
          SizedBox(height: ProjectSizes.xSmallSpacing),
          Text(
            folderData.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ProjectFonts.normalMedium(color: folderData.color2),
          ),
          SizedBox(height: ProjectSizes.xxTinySpacing),
          Text(
            folderData.date,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ProjectFonts.smallRegular(color: folderData.color1),
          )
        ],
      ),
    );
  }

  Widget buildFoldersBlock() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ProjectSizes.xSmallSpacing),
      decoration: BoxDecoration(
          color: ProjectColors.white,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(ProjectSizes.xSmallRadius))),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "My Folders",
                  style: ProjectFonts.mediumSemibold(color: ProjectColors.text2),
                ),
              ),
              Image.asset("assets/images/menu.png",
                  color: ProjectColors.text2,
                  height: ProjectSizes.xSmallSize,
                  width: ProjectSizes.xSmallSize)
            ],
          ),
          SizedBox(height: 24),
          GridView.count(
              controller: ScrollController(keepScrollOffset: false),
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: ProjectSizes.xSmallSpacing,
              crossAxisSpacing: ProjectSizes.xSmallSpacing,
              children: folders
                  .map((FolderData folderData) => buildFolderBlock(folderData))
                  .toList())
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ProjectColors.background,
          appBar: CustomAppBar(),
          floatingActionButton: buildFloatingActionButton(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  buildSearchBlock(),
                  buildFreeStorageBlock(),
                  buildFoldersBlock()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
