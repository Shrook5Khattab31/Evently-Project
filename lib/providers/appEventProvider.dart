import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/utils/firebaseUtils.dart';
import 'package:flutter/material.dart';
import '../screens/eventCreation/eventModel.dart';

class AppEventProvider extends ChangeNotifier{
  List<EventModel> events = [];
  List<EventModel> filteredEvents = [];
  List<String> eventCategories = [
    'sport','birthday','meeting','gaming','eating',
    'holiday','exhibition','workshop','bookclub'
  ];
  int selectedIndex=0;

  void getAllEvents() async{
    QuerySnapshot<EventModel> querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('event_date').get();
    events= querySnapshot.docs.map((doc){
      return doc.data();
    },).toList();
    filteredEvents=events;
    notifyListeners();
  }
  void getFilteredEvents() async{
    QuerySnapshot<EventModel> querySnapshot = await FirebaseUtils.getEventCollection()
        .orderBy('event_date').where('event_name',isEqualTo: eventCategories[selectedIndex-1]).get();
    filteredEvents= querySnapshot.docs.map((doc){
      return doc.data();
    },).toList();
    notifyListeners();
  }
  void updateEvent(EventModel event) {
   FirebaseUtils.getEventCollection().doc(event.id)
        .update({
     'title': event.title,
     'description': event.description,
     'event_img': event.eventImg,
     'event_name': event.eventName,
     'event_date': event.eventDate,
     'event_time': event.eventTime,
     'location': event.location,
   });
   //deleteEvent(event);
   selectedIndex==0? getAllEvents():getFilteredEvents();
   notifyListeners();
  }
  void deleteEvent(EventModel event) {
    FirebaseUtils.getEventCollection().doc(event.id).delete();
    notifyListeners();
  }
  void changeSelectedIndex(int newIndex){
    selectedIndex=newIndex;
    selectedIndex==0? getAllEvents(): getFilteredEvents();
  }
}