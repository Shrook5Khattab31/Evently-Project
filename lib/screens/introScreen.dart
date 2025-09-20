import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
import '../providers/appThemeProvider.dart';
import '../utils/appAssets.dart';
import '../utils/appColors.dart';
import '../utils/appStyles.dart';
import '../utils/routeNames.dart';

class IntroScreen extends StatefulWidget {

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        toolbarHeight: height*0.14,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Image.asset(AppAssets.eventlyLogo,fit: BoxFit.fitHeight,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: IntroductionScreen(
          pages: [
            buildIntroPage(
              height: height,
              image: AppAssets.introScreen1,
              title: tr('page1_title'),
              description: tr('page1_desc'),
            ),
            buildIntroPage(
              height: height,
              image: AppAssets.introScreen2,
              title: tr('page2_title'),
              description: tr('page2_desc'),
            ),
            buildIntroPage(
              height: height,
              image: AppAssets.introScreen3,
              title: tr('page3_title'),
              description: tr('page3_desc'),
            ),
          ],
          onDone: () {
            Navigator.of(context).pushReplacementNamed(RouteNames.homeScreen);
          },
          showBackButton: true,
          back: Container(
            padding: EdgeInsets.all(height*0.009),
            decoration:BoxDecoration(
              border: Border.all(color: AppColors.primaryColor,width: 2),
              borderRadius: BorderRadiusGeometry.circular(25)
            ),
            child: Icon(Icons.arrow_back,color: AppColors.primaryColor,),
          ),
          next: Container(
            padding: EdgeInsets.all(height*0.009),
            decoration:BoxDecoration(
                border: Border.all(color: AppColors.primaryColor,width: 2),
                borderRadius: BorderRadiusGeometry.circular(25)
            ),
            child: Icon(Icons.arrow_forward,color: AppColors.primaryColor,),
          ),
          done: Container(
            padding: EdgeInsets.all(height*0.009),
            decoration:BoxDecoration(
                border: Border.all(color: AppColors.primaryColor,width: 2),
                borderRadius: BorderRadiusGeometry.circular(25)
            ),
            child: Icon(Icons.arrow_forward,color: AppColors.primaryColor,),
          ),
          controlsMargin: EdgeInsets.only(bottom: 8),
          controlsPadding: EdgeInsets.zero,
          dotsContainerDecorator: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor,),
          dotsDecorator: DotsDecorator(
            size: Size(height*0.007, height*0.007),
            color: AppColors.blackColor,
            activeColor: AppColors.primaryColor,
            activeSize: Size(width*0.042, height*0.007),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel buildIntroPage({required String image,required double height, required String title,String description=''}){
    return PageViewModel(
      decoration: PageDecoration(
        pageColor: Theme.of(context).scaffoldBackgroundColor,
        imagePadding: EdgeInsets.symmetric(vertical: height*0.01),
        imageAlignment: Alignment.topCenter,
        titlePadding: EdgeInsets.only(bottom: height*0.02,top: height*0.01),
        imageFlex: 4,
        bodyFlex: 3,
      ),
      image: Image.asset(image),
      titleWidget: Align(
        alignment: Alignment.centerLeft,
        child:Text(
        title,
        style: AppStyles.bold20primary,
        textAlign: TextAlign.start,
        ),
      ),
      bodyWidget: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          description,
          style: AppStyles.medium16black,
          textAlign: TextAlign.start,
        ),
      ),
    );
    }
}
