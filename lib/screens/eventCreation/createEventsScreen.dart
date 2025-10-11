import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appEventProvider.dart';
import 'package:evently_project/reusableWidgets/c_elevatedButton.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/screens/tabs/homeTab/widgets/customTab.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/firebaseUtils.dart';
import 'package:evently_project/utils/routeNames.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import 'eventInfo/eventModel.dart';
import 'eventInfo/eventRepository.dart';
import '../../utils/appStyles.dart';

class CreateEventsScreen extends StatefulWidget {
  @override
  State<CreateEventsScreen> createState() => _CreateEventsScreenState();
}

class _CreateEventsScreenState extends State<CreateEventsScreen> {
  int selectedIndex=0;
  late AppEventProvider eventProvider;
  DateTime? selectedDate;
  String formatedDate='';
  TimeOfDay? selectedTime;
  String formatedTime='';
  String? dateError;
  String? timeError;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

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
        title: Text('create_event').tr(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.017),
          child: SafeArea(
            child: Column(
              spacing: height*0.017,
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16)
                  ),
                  child: Image.asset(EventModel.eventsImages[selectedIndex])
                ),
                DefaultTabController(
                  initialIndex: selectedIndex,
                  length: eventProvider.eventCategories.length,
                  child: TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(46),
                      color: AppColors.primaryColor,
                    ),
                    unselectedLabelStyle: AppStyles.bold16primary,
                    labelStyle: Theme.of(context).textTheme.displayLarge,
                    padding: EdgeInsetsGeometry.only(top: height*0.009),
                    isScrollable: true,
                    labelPadding: EdgeInsetsGeometry.directional(start: width*0.02),
                    onTap: (index) {
                      selectedIndex=index;
                      eventProvider.changeSelectedIndex(index);
                    },
                    tabs: List.generate(
                      eventProvider.eventCategories.length,
                      (index)=> CustomTab(
                        icon: EventModel.eventIcons[index], label: eventProvider.eventCategories[index],
                        borderColor: AppColors.primaryColor,),
                    ),
                  ),
                ),

                Column(
                  spacing: height*0.008,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('title',style: Theme.of(context).textTheme.bodySmall,).tr(),
                    ),
                    C_textFormField(
                      prefixIcon: Icon(BoxIcons.bx_edit),
                      hintText: 'event_title',
                      controller: titleController,
                    ),
                  ],
                ),

                Column(
                  spacing: height*0.008,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('description',style: Theme.of(context).textTheme.bodySmall,).tr(),
                    ),
                    C_textFormField(hintText: 'event_description',controller: descriptionController,maxLines: 4,),
                  ],
                ),

                Column(
                  children: [
                    Row(
                      children: [
                        Icon(BoxIcons.bx_calendar,color: Theme.of(context).cardColor,),
                        SizedBox(width: width*0.02,),
                        Text('event_date',style: Theme.of(context).textTheme.bodySmall,).tr(),
                        Spacer(),
                        C_hyperLink(
                          text: selectedDate==null?'choose_date':formatedDate,
                          fontWeight: FontWeight.w500,
                          onPressed: choseDate,
                        ),
                      ],
                    ),
                    Visibility(
                      visible: dateError != null,
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          dateError ?? '',
                          style: TextStyle(color: AppColors.redColor, fontSize: 12),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(BoxIcons.bx_time,color: Theme.of(context).cardColor,),
                        SizedBox(width: width*0.02,),
                        Text('event_time', style: Theme.of(context).textTheme.bodySmall,).tr(),
                        Spacer(),
                        C_hyperLink(
                          text: selectedTime==null?'choose_time':formatedTime,
                          fontWeight: FontWeight.w500,
                          onPressed: choseTime,
                        ),
                      ],
                    ),
                    Visibility(
                      visible: timeError != null,
                      child: Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          timeError ?? '',
                          style: TextStyle(color: AppColors.redColor, fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),

                Column(
                  spacing: height*0.008,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: Text('location',style: Theme.of(context).textTheme.bodySmall,).tr(),
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
                            Text('choose_location',style: AppStyles.medium16primary,).tr(),
                            Spacer(),
                            Icon(Icons.arrow_forward_ios_rounded,color: AppColors.primaryColor,),
                          ],
                        ),
                      ),
                      onPressed: (){
                        //todo: open location
                      },
                    ),
                  ],
                ),
                C_elevatedButton(
                  onPressed: addEvent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('add_event',style: AppStyles.medium20offWhite,).tr(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    eventProvider.getAllEvents();
  }
  void choseDate() async{
    var choosenDate= await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365))
    );
    selectedDate=choosenDate;
    if(selectedDate!=null){
      formatedDate=DateFormat('dd/MM/yyyy').format(selectedDate!);
      dateError = null;
    }
    setState(() {});
  }

  void choseTime() async{
    var choosenTime= await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now()
    );
    selectedTime=choosenTime;
    if(selectedTime!=null){
      formatedTime= selectedTime!.format(context);
      timeError=null;
    }
    setState(() {});
  }

  void addEvent(){
    bool isValid = formKey.currentState?.validate() == true;
    dateError = selectedDate == null ? 'date_required'.tr() : null;
    timeError = selectedTime == null ? 'time_required'.tr() : null;
    setState(() {});
    if (isValid && dateError == null && timeError == null) {
      // todo: add event
      EventModel event=EventModel(
        title: titleController.text,
        description: descriptionController.text,
        eventDate: selectedDate!,
        eventTime: formatedTime,
        location: 'Cairo, Egypt',
        eventImg: EventModel.eventsImages[selectedIndex],
        eventName: eventProvider.eventCategories[selectedIndex],
      );
      FirebaseUtils.addEventToFireStore(event).timeout(Duration(seconds: 1),
        onTimeout: () {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: AppColors.primaryColor,
              content: Text('${titleController.text} has been added successfully'),
              duration: Duration(seconds: 1),
            ),
          );
          Future.delayed(Duration(seconds: 1), () {
            Navigator.pop(context);
          });
        },
      );
    }
  }
}