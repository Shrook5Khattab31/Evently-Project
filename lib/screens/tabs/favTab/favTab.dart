import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

import '../homeTab/widgets/eventsWidget.dart';

class FavTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.directional(top: height*0.07,start: width*0.04,end: width*0.04),
        child: Column(
          children: [
            SizedBox(
              child: C_textFormField(
                hintText: 'Search for Event',
                prefixIcon: Icon(BoxIcons.bx_search),
                borderColor: AppColors.primaryColor,
                hintStyle: AppStyles.bold14primary,
                prefixIconColor: AppColors.primaryColor,
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 16),
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
