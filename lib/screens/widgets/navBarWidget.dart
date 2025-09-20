import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/screens/profileTab.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:flutter/material.dart';
import '../../utils/appStyles.dart';
import '../../utils/routeNames.dart';
import '../homeScreen.dart';

List<String> selectedIcons = [
  AppAssets.homeFilledIcon,
  AppAssets.mapFilledIcon,
  AppAssets.heartFilledIcon,
  AppAssets.userFilledIcon,
];
List<String> unSelectedIcons = [
  AppAssets.homeIcon,
  AppAssets.mapIcon,
  AppAssets.heartIcon,
  AppAssets.userIcon,
];
int selectedIndex = 0;
class NavBarWidget extends StatefulWidget {

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildBottomAppBarItem(label: 'home',index: 0,),
          buildBottomAppBarItem(label: 'map',index: 1,),
          SizedBox(width: width*0.002,),
          buildBottomAppBarItem(label: 'love',index: 2),
          buildBottomAppBarItem(label: 'profile',index: 3),
        ],
      ),
    );
  }
  Widget buildBottomAppBarItem({required String label,required int index}){
    return GestureDetector(
      onTap: (){
        selectedIndex=index;
        Navigator.of(context).pushReplacement(PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => switchTabs(index: index),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(selectedIndex==index?selectedIcons[index]:unSelectedIcons[index]),
          Text(label.tr(),style: AppStyles.bold12offWhite,),
        ],
      ),
    );
  }
  Widget switchTabs({required int index}){
    switch(index){
      case 0: return HomeScreen();
      case 1: return HomeScreen();
      case 2: return HomeScreen();
      case 3: return ProfileTab();
      default: return HomeScreen();
    }
  }
}
//DropdownButton<Locale>(
//   value: context.locale,
//   items: const [
//     DropdownMenuItem(value: Locale('en'), child: Text("English")),
//     DropdownMenuItem(value: Locale('ar'), child: Text("العربية")),
//   ],
//   onChanged: (locale) {
//     context.setLocale(locale!);
//   },
// )