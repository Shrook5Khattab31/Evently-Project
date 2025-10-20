import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appEventProvider.dart';
import 'package:evently_project/reusableWidgets/c_textFormField.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../../../utils/routeNames.dart';
import '../../eventCreation/eventDetailsScreen.dart';
import '../../eventCreation/eventModel.dart';
import '../homeTab/widgets/eventsWidget.dart';

class FavTab extends StatefulWidget {

  @override
  State<FavTab> createState() => _FavTabState();
}

class _FavTabState extends State<FavTab> {
  late AppEventProvider eventProvider;
  List<EventModel> displayList = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventProvider.getFavouriteEvents();
      setState(() {
        displayList = eventProvider.favouriteEvents;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width;
    var height=MediaQuery.of(context).size.height;
    eventProvider = Provider.of<AppEventProvider>(context);
    final isSearching = searchQuery.isNotEmpty;
    final listToShow = isSearching ? displayList : eventProvider.favouriteEvents;
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.directional(top: height*0.07,start: width*0.04,end: width*0.04),
        child: Column(
          children: [
            SizedBox(
              child: C_textFormField(
                hintText: 'search_for_event'.tr(),
                prefixIcon: Icon(BoxIcons.bx_search),
                borderColor: AppColors.primaryColor,
                hintStyle: AppStyles.bold14primary,
                prefixIconColor: AppColors.primaryColor,
                onChanged: (value) {
                  setState(() {
                    searchQuery = value.toLowerCase();
                    displayList = eventProvider.events.where((event) =>
                    event.title.toLowerCase().contains(searchQuery)
                    ).toList();
                  });
                },
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 16),
                itemBuilder: (context, index)  {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsScreen(event: listToShow[index]),
                        ),
                      );
                    },
                    child: EventsWidget(event: listToShow[index]),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: height*0.019,),
                itemCount: listToShow.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
