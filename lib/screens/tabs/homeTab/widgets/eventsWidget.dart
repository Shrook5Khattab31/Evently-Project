import 'package:evently_project/utils/appAssets.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../../../providers/appThemeProvider.dart';

class EventsWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: height*0.009,horizontal: width*0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.primaryColor),
        image: DecorationImage(
          image: AssetImage(AppAssets.sportEventImg),
          fit: BoxFit.fill
        ),
      ),
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      height: height*0.24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: height*0.009,horizontal: width*0.02),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('21',style: AppStyles.bold20primary,),
                Text('Nov',style: AppStyles.bold14primary,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: height*0.009,horizontal: width*0.02),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('This is a Birthday Party',style: themeProvider.appTheme=='light'?AppStyles.bold14black:AppStyles.bold14offWhite,),
                Icon(LineAwesome.heart_solid,color: AppColors.primaryColor,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
