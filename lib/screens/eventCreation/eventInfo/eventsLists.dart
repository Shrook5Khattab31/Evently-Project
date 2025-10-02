import 'package:evently_project/utils/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EventsLists{
  static List<String> events = [
    'sport','birthday','meeting','gaming','eating',
    'holiday','exhibition','workshop','bookclub'
  ];

  static List<String> eventsImages = [
    AppAssets.sportEventImg,AppAssets.birthdayEventImg,AppAssets.meetingEventImg,
    AppAssets.gamingEventImg,AppAssets.eatingEventImg,AppAssets.holidayEventImg,
    AppAssets.exhibitionEventImg,AppAssets.workshopEventImg,AppAssets.bookClubEventImg,
  ];

  static List<IconData> eventIcons = [
    Icons.directions_bike,LineAwesome.birthday_cake_solid,
    LineAwesome.database_solid,LineAwesome.gamepad_solid,
    LineAwesome.glass_martini_solid,
    LineAwesome.ship_solid,LineAwesome.glasses_solid,
    LineAwesome.warehouse_solid,LineAwesome.book_open_solid,
  ];
}