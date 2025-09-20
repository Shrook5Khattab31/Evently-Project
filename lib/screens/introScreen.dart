import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightThemeColor,
        centerTitle: true,
        toolbarHeight: height*0.14,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Image.asset(AppAssets.eventlyLogo,fit: BoxFit.fitHeight,),
        ),
      ),
      body: IntroductionScreen(
        pages: [
          buildIntroPage(
            height: height,
            image: AppAssets.introScreen1,
            title: "Find Events That Inspire You",
            description: "Dive into a world of events crafted to fit your unique interests."
                " Whether you're into live music, art workshops, professional networking,"
                " or simply discovering new experiences, we have something for everyone."
                " Our curated recommendations will help you explore, connect,"
                " and make the most of every opportunity around you.",
          ),
          buildIntroPage(
            height: height,
            title: "Effortless Event Planning",
            description: "Take the hassle out of organizing events with our all-in-one planning tools."
                " From setting up invites and managing RSVPs to scheduling reminders and coordinating details,"
                " we’ve got you covered. Plan with ease and focus on what matters – "
                "creating an unforgettable experience for you and your guests.",
            image: AppAssets.introScreen2,
          ),
          buildIntroPage(
            height: height,
            title: "Connect with Friends & Share Moments",
            description: "Make every event memorable by sharing the experience with others."
                " Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together."
                " Capture and share the excitement with your network,"
                " so you can relive the highlights and cherish the memories.",
            image: AppAssets.introScreen3,
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
        dotsContainerDecorator: BoxDecoration(color: AppColors.lightThemeColor,),
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
    );
  }

  PageViewModel buildIntroPage({required String image,required double height, required String title,String description=''}){
    return PageViewModel(
      decoration: PageDecoration(
        pageColor: AppColors.lightThemeColor,
        imagePadding: EdgeInsets.symmetric(vertical: height*0.01),
        imageAlignment: Alignment.topCenter,
        bodyPadding: EdgeInsets.only(left: 16),
        titlePadding: EdgeInsets.only(left: 16,bottom: height*0.02,top: height*0.01),
        imageFlex: 4,
        bodyFlex: 3,
      ),
      image: Image.asset(image),
      titleWidget: Align(
        alignment: Alignment.centerLeft,
        child: Text(
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
