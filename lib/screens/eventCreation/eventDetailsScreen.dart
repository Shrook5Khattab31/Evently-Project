import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/screens/eventCreation/editEventScreen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../providers/appEventProvider.dart';
import 'eventModel.dart';
import '../../reusableWidgets/c_elevatedButton.dart';
import '../../utils/appColors.dart';
import '../../utils/appStyles.dart';

class EventDetailsScreen extends StatelessWidget {
  late AppEventProvider eventProvider;
  final EventModel event;

  EventDetailsScreen({required this.event});

  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    eventProvider= Provider.of<AppEventProvider>(context);

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
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditEventsScreen(event: event),
                ),
              );
            }, 
            child: Icon(BoxIcons.bxs_edit_alt)
          ),
          SizedBox(width: width*0.02,),
          InkWell(
            onTap: () async {
              eventProvider.deleteEvent(event);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Event deleted successfully')),
              );
              eventProvider.getAllEvents();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.pop(context);
              });
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
                child: Image.asset(event.eventImg),
            ),
            Text(event.title, style: AppStyles.medium24primary),
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
                      Text(DateFormat('dd MMMM yyyy').format(event.eventDate), style: AppStyles.medium16primary),
                      Text(event.eventTime, style: Theme.of(context).textTheme.bodySmall),
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
                Text(event.description, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
            SizedBox(height: height*0.02,),
          ],
        ),
      ),
    );
  }
}