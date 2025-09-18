import 'package:evently_project/screens/profileTab.dart';
import 'package:evently_project/screens/widgets/navBarWidget.dart';
import 'package:flutter/material.dart';
import '../utils/appColors.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('HomeTab')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 40, color: AppColors.offWhiteColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
