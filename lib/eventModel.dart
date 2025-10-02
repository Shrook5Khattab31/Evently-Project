import 'package:flutter/material.dart';

class EventModel {
  final String title;
  final String description;
  final DateTime date;
  final TimeOfDay time;
  final String location;
  final String category;

  EventModel({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.location,
    required this.category,
  });
}
