import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/screens/tabs/favTab/favTab.dart';
import 'package:evently_project/screens/tabs/homeTab/homeTab.dart';
import 'package:evently_project/screens/tabs/profileTab.dart';
import 'package:flutter/material.dart';
import '../utils/appAssets.dart';
import '../utils/appColors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
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

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: buildTab(selectedIndex),
      floatingActionButton: Transform.translate(
        offset: Offset(0, 6),
        child:FloatingActionButton(
          backgroundColor: Theme.of(context).bottomAppBarTheme.color,
          onPressed: () {},
          child: Icon(Icons.add, size: 40, color: AppColors.offWhiteColor,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: height*0.09,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) => setState(() {
            selectedIndex=index;
          }),
          items: [
            buildBottomAppBarItem(label: 'home',index: 0,),
            buildBottomAppBarItem(label: 'map',index: 1,),
            buildBottomAppBarItem(label: 'love',index: 2),
            buildBottomAppBarItem(label: 'profile',index: 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem buildBottomAppBarItem({required String label,required int index}){
    return BottomNavigationBarItem(
      label: tr(label),
      icon: ImageIcon(
          AssetImage(selectedIndex==index?selectedIcons[index]:unSelectedIcons[index])
      ),
    );
  }

  Widget buildTab(int index){
    switch(index){
      case 0: return HomeTab();
      case 1: return Center(child: Text('Map'),);
      case 2: return FavTab();
      case 3: return ProfileTab();
      default: return ProfileTab();
    }
  }
}
