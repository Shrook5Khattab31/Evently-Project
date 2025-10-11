import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/reusableWidgets/c_elevatedButton.dart';
import 'package:evently_project/reusableWidgets/c_hyperLink.dart';
import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/screens/tabs/homeTab/widgets/customTab.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../providers/appEventProvider.dart';
import 'eventModel.dart';
import '../../utils/appStyles.dart';

class EditEventsScreen extends StatefulWidget {
  final EventModel event;
  EditEventsScreen({required this.event});
  @override
  State<EditEventsScreen> createState() => _EditEventsScreenState();
}

class _EditEventsScreenState extends State<EditEventsScreen> {
  late int selectedIndex;
  DateTime? selectedDate;
  String formatedDate='';
  TimeOfDay? selectedTime;
  String formatedTime='';
  late String eventImg;
  final formKey = GlobalKey<FormState>();
  String? dateError;
  String? timeError;
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  late EventModel event;
  late AppEventProvider eventProvider;

  @override
  void initState() {
    super.initState();
    event = widget.event;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      titleController.text = event.title;
      descriptionController.text = event.description;
      selectedDate = event.eventDate;
      selectedIndex = eventProvider.eventCategories.indexOf(event.eventName);
      formatedDate = DateFormat('dd/MM/yyyy').format(event.eventDate);
      selectedTime = parseTimeOfDay(event.eventTime);
      formatedTime = selectedTime!.format(context);
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    var height =MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;
    eventProvider = Provider.of<AppEventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height*0.076,
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)
        ),
        title: Text('edit_event').tr(),
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
                    onTap: (index)=>setState(() {
                      selectedIndex=index;
                    }),
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
                          text: formatedDate==''?'choose_date':formatedDate,
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
                          text: formatedTime==''?'choose_time':formatedTime,
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
                  onPressed: updateEventFromFirestore,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('update_event',style: AppStyles.medium20offWhite,).tr(),
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

  TimeOfDay parseTimeOfDay(String timeString) {
    final format = DateFormat.jm();
    final dateTime = format.parse(timeString);
    return TimeOfDay.fromDateTime(dateTime);
  }

  Future<void> updateEventFromFirestore() async{
    bool isValid = formKey.currentState?.validate() == true;
    dateError = selectedDate == null ? 'date_required'.tr() : null;
    timeError = selectedTime == null ? 'time_required'.tr() : null;
    setState(() {});

    if (isValid && dateError == null && timeError == null) {
      event.title = titleController.text;
      event.description = descriptionController.text;
      event.eventDate = selectedDate!;
      event.eventTime = formatedTime;
      event.eventImg = EventModel.eventsImages[selectedIndex];
      event.eventName = eventProvider.eventCategories[selectedIndex];

      eventProvider.updateEvent(event);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Event updated successfully')),
      );
      eventProvider.getAllEvents();
      Navigator.pop(context);
    }
  }
}