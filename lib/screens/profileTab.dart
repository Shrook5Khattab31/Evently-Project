import 'package:evently_project/screens/widgets/navBarWidget.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add, size: 40, color: AppColors.offWhiteColor,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
