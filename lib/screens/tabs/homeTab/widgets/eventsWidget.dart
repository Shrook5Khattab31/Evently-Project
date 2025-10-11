import 'package:easy_localization/easy_localization.dart';
import 'package:evently_project/utils/appColors.dart';
import 'package:evently_project/utils/appStyles.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';
import '../../../eventCreation/eventModel.dart';
import '../../../../providers/appThemeProvider.dart';

class EventsWidget extends StatelessWidget {
  final EventModel event;
  final VoidCallback? onTap;

  EventsWidget({required this.event, this.onTap});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    final date = DateFormat('dd').format(event.eventDate);
    final month = DateFormat('MMM').format(event.eventDate);

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: height * 0.009, horizontal: width * 0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.primaryColor),
          image: DecorationImage(
            image: AssetImage(event.eventImg),
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
              padding: EdgeInsets.symmetric(vertical: height * 0.009, horizontal: width * 0.02),
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
                      event.title,
                      style: themeProvider.appTheme == 'light'
                          ?AppStyles.bold14black:AppStyles.bold14offWhite,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(LineAwesome.heart_solid, color: AppColors.primaryColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
