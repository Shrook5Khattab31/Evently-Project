import 'package:flutter/material.dart';

class EventModel {
   String title;
   String description;
   DateTime date;
   TimeOfDay time;
   String location;
   String category;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
  });
}
