import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/screens/eventCreation/eventInfo/eventRepository.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'eventInfo/eventModel.dart';
import 'eventInfo/eventsLists.dart';
import '../../reusableWidgets/c_elevatedButton.dart';
import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';

class EventDetailsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    final event = ModalRoute.of(context)!.settings.arguments as EventModel;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.076,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)
        ),
        title: Text('event_details').tr(),
        actionsPadding: EdgeInsets.symmetric(horizontal: width*0.02),
        actions: [
          InkWell(
            onTap: () async {
              final edited= await Navigator.pushNamed(context, RouteNames.editEventScreen,arguments: event);
              if (edited == true) {
                Navigator.pop(context, true);
              }
            }, 
            child: Icon(BoxIcons.bxs_edit_alt)
          ),
          SizedBox(width: width*0.02,),
          InkWell(
            onTap: (){
              EventRepository.events.remove(event);
              Navigator.pop(context,true);
            },
            child: Icon(MingCute.delete_2_line,color: Colors.redAccent),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.017),
        child: Column(
          spacing: height*0.014,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16)
                ),
                child: Image.asset(EventRepository.categoryImages[event.category] ?? AppAssets.sportEventImg)
            ),
            Text(event.title,style: AppStyles.medium24primary,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.007),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor,),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: height*0.017,horizontal: width*0.04),
                    margin: EdgeInsetsDirectional.only(end: width*0.02),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.primaryColor,
                    ),
                    child: Icon(Icons.calendar_month_outlined,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      size: 22,),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('dd MMMM yyyy').format(event.date),style: AppStyles.medium16primary,),
                      Text(event.time.format(context),style: Theme.of(context).textTheme.bodySmall,)
                    ],
                  ),
                ],
              ),
            ),
            C_elevatedButton(
              padding: EdgeInsets.symmetric(vertical: height*0.008),
              borderColor: AppColors.primaryColor,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width*0.02),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: height*0.017,horizontal: width*0.04),
                      margin: EdgeInsetsDirectional.only(end: width*0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor,
                      ),
                      child: Icon(Icons.my_location_outlined,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        size: 22,),
                    ),
                    Text('Cairo , Egypt',style: AppStyles.medium16primary,),
                    Spacer(),
                    Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primaryColor,),
                  ],
                ),
              ),
              onPressed: (){
                //todo: open location
              },
            ),
            Container(
              height: height*0.32,
              width: width*0.91,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primaryColor),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('description',style: Theme.of(context).textTheme.bodySmall,).tr(),
                Text(event.description,style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),
            SizedBox(height: height*0.02,),
          ],
        ),
      ),
    );
  }
}
