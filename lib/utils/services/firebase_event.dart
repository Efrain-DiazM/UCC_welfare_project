import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createEvent(String name, String description, int hours, DateTime date, TimeOfDay startTime, TimeOfDay endTime, String category) async {
    await _db.collection('events').add({
      'name': name,
      'description': description,
      'hours': hours,
      'date': Timestamp.fromDate(date),
      'startTime': '${startTime.hour}:${startTime.minute}',
      'endTime': '${endTime.hour}:${endTime.minute}',
      'category': category,
    });
  }

  Stream<List<Event>> getEvents() {
    return _db.collection('events').snapshots().map((snapshot) =>
      snapshot.docs.map((doc) => Event.fromFirestore(doc)).toList()
    );
  }
}

class Event {
  final String title;
  final String description;
  final int hours;
  final DateTime date;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String category;

  Event(this.title, this.description, this.hours, this.date, this.startTime, this.endTime, this.category);

  factory Event.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Event(
      data['name'],
      data['description'],
      data['hours'],
      (data['date'] as Timestamp).toDate(),
      TimeOfDay(hour: int.parse(data['startTime'].split(":")[0]), minute: int.parse(data['startTime'].split(":")[1])),
      TimeOfDay(hour: int.parse(data['endTime'].split(":")[0]), minute: int.parse(data['endTime'].split(":")[1])),
      data['category'],
    );
  }
}
