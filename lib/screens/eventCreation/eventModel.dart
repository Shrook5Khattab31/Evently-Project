import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/screens/eventCreation/eventModel.dart';
import 'package:evently_project/utils/appAssets.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class EventModel {
  static String collectionName ='event';
  String id;
  String title;
  String description;
  DateTime eventDate;
  String eventTime;
  String location;
  String eventImg;
  String eventName;
  bool isFavourite;

  static List<IconData> eventIcons = [
    Icons.directions_bike,LineAwesome.birthday_cake_solid,
    LineAwesome.database_solid,LineAwesome.gamepad_solid,
    LineAwesome.glass_martini_solid,
    LineAwesome.ship_solid,LineAwesome.glasses_solid,
    LineAwesome.warehouse_solid,LineAwesome.book_open_solid,
  ];
  static List<String> eventsImages = [
    AppAssets.sportEventImg,AppAssets.birthdayEventImg,AppAssets.meetingEventImg,
    AppAssets.gamingEventImg,AppAssets.eatingEventImg,AppAssets.holidayEventImg,
    AppAssets.exhibitionEventImg,AppAssets.workshopEventImg,AppAssets.bookClubEventImg,
  ];
  static Map<String, String> categoryImages = {
    'sport': AppAssets.sportEventImg,
    'birthday': AppAssets.birthdayEventImg,
    'meeting': AppAssets.meetingEventImg,
    'gaming': AppAssets.gamingEventImg,
    'eating': AppAssets.eatingEventImg,
    'holiday': AppAssets.holidayEventImg,
    'exhibition': AppAssets.exhibitionEventImg,
    'workshop': AppAssets.workshopEventImg,
    'bookclub': AppAssets.bookClubEventImg,
  };

  EventModel({
    this.id='',
    required this.title,
    required this.description,
    required this.eventImg,
    required this.eventName,
    required this.eventDate,
    required this.eventTime,
    this.isFavourite=false,
    required this.location,
  });
  EventModel.fromFireStore(Map<String,dynamic> data):this(
    id: data['id']as String,
    title: data['title']as String,
    description: data['description']as String,
    eventImg: data['event_img'],
    eventName: data['event_name'],
    eventDate: data['event_date'] is Timestamp? (data['event_date'] as Timestamp).toDate()
      : DateTime.fromMillisecondsSinceEpoch(data['event_date']),
    eventTime: data['event_time'],
    isFavourite: data['is_favourite']as bool,
    location: data['location']
  );
  Map<String,dynamic> toFireStore(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'event_img': eventImg,
      'event_name': eventName,
      'event_date': eventDate.millisecondsSinceEpoch,
      'event_time': eventTime,
      'is_favourite': isFavourite,
      'location': location,
    };
  }
}
