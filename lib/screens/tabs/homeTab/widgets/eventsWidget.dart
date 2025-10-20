import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/providers/appEventProvider.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../eventCreation/eventModel.dart';
import '../../../../providers/appThemeProvider.dart';

class EventsWidget extends StatefulWidget {
  final EventModel event;
  final VoidCallback? onTap;

  EventsWidget({required this.event, this.onTap});

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final date = DateFormat('dd').format(widget.event.eventDate);
    final month = DateFormat('MMM').format(widget.event.eventDate);
    var eventProvider = Provider.of<AppEventProvider>(context);

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.009, horizontal: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor),
          image: DecorationImage(
            image: AssetImage(widget.event.eventImg),
            fit: BoxFit.cover,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        width: double.infinity,
        height: height * 0.24,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.009, horizontal: width * 0.02),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor.withValues(alpha: 0.85),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(date, style: AppStyles.bold20primary),
                  Text(month, style: AppStyles.bold14primary),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.02),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.event.title,
                      style: Theme.of(context).textTheme.labelSmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: (){
                      setState(() {
                        widget.event.isFavourite = ! widget.event.isFavourite;
                        eventProvider.getFavouriteEvents();
                        eventProvider.updateFavEvent(widget.event);
                      });
                    },
                    icon: Icon(
                      widget.event.isFavourite? LineAwesome.heart_solid : LineAwesome.heart,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
