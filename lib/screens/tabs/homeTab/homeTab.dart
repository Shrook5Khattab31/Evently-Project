import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/screens/tabs/homeTab/widgets/customTab.dart';
import 'package:evently_project/screens/tabs/homeTab/widgets/eventsWidget.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../providers/appEventProvider.dart';
import '../../eventCreation/eventDetailsScreen.dart';
import '../../../providers/appLanguageProvider.dart';
import '../../../providers/appThemeProvider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<String> categories = [ 'all', 'sport','birthday', 'meeting',
    'gaming','eating', 'holiday','exhibition','workshop','bookclub'
  ];

  List<IconData> eventIcons = [
    LineAwesome.compass,Icons.directions_bike,
    LineAwesome.birthday_cake_solid, LineAwesome.database_solid,
    LineAwesome.gamepad_solid, LineAwesome.glass_martini_solid,
    LineAwesome.ship_solid,LineAwesome.glasses_solid,
    LineAwesome.warehouse_solid,LineAwesome.book_open_solid,
  ];

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var eventprovider = Provider.of<AppEventProvider>(context);
    if(eventprovider.events.isEmpty){
      eventprovider.getAllEvents();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        toolbarHeight: height*0.2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.vertical(bottom: Radius.circular(45),),
        ),
        automaticallyImplyLeading: false,
        title: Column(
          spacing: height*0.009,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('welcome_message',style: AppStyles.regular14offWhite,).tr(),
                    Text('John Safwat',style: AppStyles.bold24offWhite,),
                  ],
                ),
                Spacer(),
                Icon(themeProvider.appTheme=='light'?
                  Icons.wb_sunny_outlined:Icons.brightness_2_sharp,
                  color: Theme.of(context).canvasColor,),
                Container(
                  margin: EdgeInsetsDirectional.only(start: width*0.03),
                  padding: EdgeInsets.symmetric(horizontal: width*0.02,vertical: height*0.009),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text((languageProvider.appLanguage).toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall,
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
              initialIndex: eventprovider.selectedIndex,
              length: categories.length,
              child: TabBar(
                padding: EdgeInsetsGeometry.only(top: height*0.009),
                isScrollable: true,
                labelPadding: EdgeInsetsGeometry.directional(start: width*0.02),
                onTap: (index)=> eventprovider.changeSelectedIndex(index),
                tabs: List.generate(categories.length, (index)=>
                  CustomTab(icon: eventIcons[index], label: categories[index])),
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
              child: eventprovider.events.isEmpty?
                  Center(child: Text('Searching for events'),):
              ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(event: eventprovider.filteredEvents[index]),
                        ),
                      );
                      eventprovider.selectedIndex == 0
                          ? eventprovider.getAllEvents()
                          : eventprovider.getFilteredEvents();
                    },
                    child: EventsWidget(event: eventprovider.filteredEvents[index]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: height*0.019,),
                itemCount: eventprovider.filteredEvents.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}