import 'package:evently_project/screens/tabs/homeTab/widgets/customTab.dart';
import 'package:evently_project/screens/tabs/homeTab/widgets/eventsWidget.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../providers/appLanguageProvider.dart';
import '../../../providers/appThemeProvider.dart';

class HomeTab extends StatelessWidget {
  List<String> events = [ 'all',
    'sport','birthday','meeting','gaming','eating',
    'holiday','exhibition','workshop','bookclub'
  ];
  List<IconData> eventIcons = [
    LineAwesome.compass,Icons.directions_bike,LineAwesome.birthday_cake_solid,
    LineAwesome.compass,LineAwesome.compass,LineAwesome.compass,
    LineAwesome.compass,LineAwesome.compass,LineAwesome.compass,
    LineAwesome.compass,
  ];
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height*0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(45),),
        ),
        title: Column(
          spacing: height*0.009,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back ✨',style: AppStyles.regular14offWhite,),
                    Text('John Safwat',style: AppStyles.bold24offWhite,),
                  ],
                ),
                Spacer(),
                ///change the style
                Icon(themeProvider.appTheme=='light'?
                  Icons.wb_sunny_outlined:Icons.brightness_2_sharp,
                  color: themeProvider.appTheme=='light'?
                  AppColors.lightBlueColor:AppColors.offWhiteColor,),
                Container(
                  margin: EdgeInsetsDirectional.only(start: width*0.03),
                  padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.009),
                  decoration: BoxDecoration(
                    color: themeProvider.appTheme=='light'?
                    AppColors.lightBlueColor:AppColors.offWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text((languageProvider.appLanguage).toUpperCase(),
                    style: themeProvider.appTheme=='light'?
                    AppStyles.bold14primary:AppStyles.bold14darkPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(LineAwesome.map_marker_solid,color: AppColors.lightBlueColor,size: 24,),
                Text('Cairo , Egypt',style: AppStyles.medium16offWhite,),
              ],
            ),
            DefaultTabController(
              initialIndex: selectedIndex,
              length: events.length,
              child: TabBar(
                padding: EdgeInsets.only(top: height*0.009),
                isScrollable: true,
                labelPadding: EdgeInsetsGeometry.directional(start: width*0.02),
                onTap: (index)=> selectedIndex=index,
                tabs: List.generate(events.length, (index)=>
                  CustomTab(icon: eventIcons[index], label: events[index])),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.directional(top: height*0.019,start: width*0.04,end: width*0.04),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => EventsWidget(),
                separatorBuilder: (context, index) => SizedBox(height: height*0.019,),
                itemCount: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}