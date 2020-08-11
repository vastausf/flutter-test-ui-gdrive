import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gdrive/custom_app_bar.dart';
import 'package:gdrive/dataClasses.dart';
import 'package:gdrive/fonts.dart';
import 'package:gdrive/project_colors.dart';
import 'package:gdrive/sizes.dart';
import 'package:gdrive/strings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<FolderData> folders = [
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ProjectColors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ProjectColors.background,
          appBar: CustomAppBar(),
          floatingActionButton: _HomePageFloatingActionButton(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _SearchBlock(),
                  _FreeStorageBlock(),
                  _FoldersBlock(folders)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _HomePageFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class _FreeStorageBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class _SearchBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class _FoldersBlock extends StatefulWidget {
  _FoldersBlock(this.folders);

  final List<FolderData> folders;

  @override
  __FoldersBlockState createState() => __FoldersBlockState(folders);
}

class __FoldersBlockState extends State<_FoldersBlock> {
  __FoldersBlockState(this.folders);

  List<FolderData> folders;

  @override
  Widget build(BuildContext context) {
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
          SizedBox(height: ProjectSizes.xSmallSpacing),
          _FoldersList(folders)
        ],
      ),
    );
  }
}

class _FoldersList extends StatefulWidget {
  _FoldersList(this.folders);

  final List<FolderData> folders;

  @override
  __FoldersListState createState() => __FoldersListState(folders);
}

class __FoldersListState extends State<_FoldersList> {
  __FoldersListState(this.folders);

  final List<FolderData> folders;

  @override
  Widget build(BuildContext context) {
    List<Row> foldersPairs = [];

    for (int i = 0; i < folders.length; i += 2) {
      foldersPairs.add(Row(
        children: [
          Flexible(
            child: _FolderBlock(folders[i]),
          ),
          SizedBox(width: ProjectSizes.xSmallSpacing),
          if (folders.length > i + 1)
            Flexible(
              child: _FolderBlock(folders[i + 1]),
            )
          else
            Flexible(child: Container()),
        ],
      ));
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: foldersPairs.length,
      itemBuilder: (context, index) => foldersPairs[index],
      separatorBuilder: (context, index) => Container(height: ProjectSizes.xSmallSpacing),
    );
  }
}

class _FolderIcon extends StatelessWidget {
  _FolderIcon(this.color1, this.color2);

  final Color color1;
  final Color color2;

  @override
  Widget build(BuildContext context) {
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
}

class _FolderBlock extends StatelessWidget {
  _FolderBlock(this.folderData);

  final FolderData folderData;

  @override
  Widget build(BuildContext context) {
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
              _FolderIcon(folderData.color1, folderData.color2),
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
}
