import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appLanguageProvider.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/appThemeProvider.dart';

class ProfileTab extends StatefulWidget {

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.directional(bottomStart: Radius.circular(80)),
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(vertical:height*0.019,horizontal: width*0.04),
          child: Image.asset(AppAssets.profileImg,fit: BoxFit.fill,),
        ),
        leadingWidth: width*0.39,
        toolbarHeight: height*0.18,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.only(right: height*0.019),
          child: Column(
            spacing: height*0.011,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Safwat',style: Theme.of(context).textTheme.headlineLarge,),
              Text('johnsafwat.route@gmail.com',
                softWrap: true,
                overflow: TextOverflow.visible,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: height*0.028,horizontal: width*0.04),
        child: Column(spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('language',style: Theme.of(context).textTheme.bodyMedium,).tr(),
            buildDropdown(value: languageProvider.appLanguage,
                items: ['en', 'ar'],
                labelBuilder: (code) {
                  if (code == 'en') return tr('english');
                  if (code == 'ar') return tr('arabic');
                  return code;
                },
                onChanged: (String? value) {
                  if (value != null) {
                    languageProvider.changeLanguage(context, value);
                  }
                }
            ),
            Text('theme',style: Theme.of(context).textTheme.bodyMedium,).tr(),
            buildDropdown(value: themeProvider.appTheme,
              items: ['light', 'dark'],
              labelBuilder: (code) {
                if (code == 'light') return tr('light');
                if (code == 'dark') return tr('dark');
                return code;
              },
              onChanged: (String? value) {
                if (value != null) {
                  themeProvider.changeTheme(value);
                }
              },
            ),
            Spacer(),
            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.redColor,
                padding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16),
                )
              ),
              child: Row(
                children: [
                  Icon(Icons.logout,color: AppColors.whiteColor,size: 24,),
                  SizedBox(width: 13,),
                  Text('logout',style: AppStyles.regular20white,).tr(),
                ],
              )
            )
          ],
        ),
      ),
    );
  }

  Widget buildDropdown({required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    required String Function(String) labelBuilder,}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        style: AppStyles.bold20primary,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        items: items.map((code) {
          return DropdownMenuItem(
            value: code,
            child: Text(
              labelBuilder(code),
              style: code==value?AppStyles.bold20primary:AppStyles.bold20black,
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}