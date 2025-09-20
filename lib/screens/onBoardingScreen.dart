import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appLanguageProvider.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/appThemeProvider.dart';
import '../utils/appAssets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:icons_plus/icons_plus.dart';

typedef OnToggle = void Function(int? index);
class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectedIndex=0;
  int selectedLanguageIndex=0;

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        toolbarHeight: height*0.14,
        title: Padding(
          padding: EdgeInsets.only(top: 16.0),
          child: Image.asset(AppAssets.eventlyLogo,fit: BoxFit.fitHeight,),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 27,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: height *0.35,
              child: Image.asset(
                AppAssets.onBoardingImg,
                fit: BoxFit.contain,
                width: double.infinity,
              ),
            ),
            Text('onBoarding_title', style: AppStyles.bold20primary,).tr(),
            Text('onBoarding_desc', style: Theme.of(context).textTheme.bodySmall,).tr(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('language',style: AppStyles.medium20primary,).tr(),
                buildToggleSwitch(
                  height: height*0.03,
                  width: width*0.1,
                  icons: [
                    Image.asset(AppAssets.usIcon, height: 30),
                    Image.asset(AppAssets.egIcon, height: 30),
                  ],
                  selectedIndex: selectedLanguageIndex,
                  onToggle: (index) {
                    if(index==0){
                      languageProvider.changeLanguage(context, 'en');
                    }else{
                      languageProvider.changeLanguage(context, 'ar');
                    }
                    setState(() {
                      selectedLanguageIndex = index!;
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('theme',style: AppStyles.medium20primary,).tr(),
                buildToggleSwitch(
                  height: height*0.03,
                  width: width*0.1,
                  icons: [
                    Icon(Icons.wb_sunny_outlined,
                      color: selectedIndex ==0?
                      Theme.of(context).scaffoldBackgroundColor: AppColors.primaryColor,),
                    Icon(Icons.brightness_2_sharp,
                      color: selectedIndex ==1?Theme.of(context).scaffoldBackgroundColor:AppColors.primaryColor,)
                  ],
                  selectedIndex: selectedIndex,
                  onToggle: (index) {
                    if (index == 0) {
                      themeProvider.changeTheme('light');
                    } else {
                      themeProvider.changeTheme('dark');
                    }
                    setState(() {
                      selectedIndex = index!;
                    });
                  },
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pushNamed(context, RouteNames.introScreen);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16)
                )
              ),
              child: Text('onBoarding_button',style: AppStyles.medium20offWhite,).tr(),
            ),
          ],
        ),
      ),
    );
  }
  Widget buildToggleSwitch({required List<Widget> icons,required int selectedIndex,
    required OnToggle onToggle, double height=30, double width=45}) {
    return ToggleSwitch(
      minWidth: width,
      minHeight: height,
      borderWidth: 2,
      cornerRadius: 40,
      borderColor: [AppColors.primaryColor],
      activeBgColors: [[AppColors.primaryColor],[AppColors.primaryColor]],
      activeFgColor: Theme.of(context).primaryColor,
      inactiveBgColor: Theme.of(context).scaffoldBackgroundColor,
      totalSwitches: 2,
      initialLabelIndex: selectedIndex,
      customWidgets: icons,
      radiusStyle: true,
      onToggle: onToggle,
    );
  }
}
