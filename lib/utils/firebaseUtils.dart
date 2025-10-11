import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently_project/screens/eventCreation/eventModel.dart';

class FirebaseUtils{
  static CollectionReference<EventModel> getEventCollection(){
    return FirebaseFirestore.instance.collection(EventModel.collectionName)
    .withConverter<EventModel>(
      fromFirestore: (snapshot, options) => EventModel.fromFireStore(snapshot.data()!),
      toFirestore: (event, options) => event.toFireStore(),
    );
  }
  static Future<void> addEventToFireStore(EventModel event){
  CollectionReference<EventModel> collectionRef =getEventCollection();
  DocumentReference<EventModel> documentRef= collectionRef.doc();
  event.id=documentRef.id;
  return documentRef.set(event);
  }
}