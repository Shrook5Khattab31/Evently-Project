import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_elevatedButton.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/reusableWidgets/c_toggleSwitch.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../providers/appLanguageProvider.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.076,
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)
        ),
        title: Text('register_title',style: AppStyles.regular22primary,).tr(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.04),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AppAssets.eventlyLogo,height: height*0.22,fit: BoxFit.cover,),
              Padding(
                padding: EdgeInsets.only(top: height*0.02),
                child: Column(
                  spacing: height*0.019,
                  children: [
                    C_textFormField(hintText: 'name',
                      prefixIcon: Icon(Icons.person),
                    ),
                    C_textFormField(hintText: 'email',prefixIcon: Icon(BoxIcons.bxs_envelope),),
                    C_textFormField(hintText: 'password',
                      prefixIcon: Icon(BoxIcons.bxs_lock),
                      suffixIcon: Icon(BoxIcons.bxs_hide),
                    ),
                    C_textFormField(hintText: 're_password',
                      prefixIcon: Icon(BoxIcons.bxs_lock),
                      suffixIcon: Icon(BoxIcons.bxs_hide),
                    ),
                    C_elevatedButton(text: 'create_account',
                      onPressed: (){
                        Navigator.pushNamed(context, RouteNames.homeScreen);
                      }
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('already_have_account',style: Theme.of(context).textTheme.bodySmall).tr(),
                  C_hyperLink(text: 'login', onPressed: (){
                    Navigator.pushNamed(context, RouteNames.loginScreen);
                  }),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height*0.02),
                child: C_ToggleSwitch(
                  selectedIndex: selectedIndex,
                  onToggle: (index) {
                    if(index==0){
                      languageProvider.changeLanguage(context, 'en');
                    }else{
                      languageProvider.changeLanguage(context, 'ar');
                    }
                    setState(() {
                      selectedIndex = index!;
                    });
                  },
                  icons: [
                    Image.asset(AppAssets.usIcon, height: 30),
                    Image.asset(AppAssets.egIcon, height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}