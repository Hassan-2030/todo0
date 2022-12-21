import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';

CollectionReference<Task> getTaskCollection() {
  return FirebaseFirestore.instance.collection('Task').withConverter<Task>(
        fromFirestore: (snapshot, options) => Task.fromJson(snapshot.data()!),
        toFirestore: (task, options) => task.toJson(),
      );
}

// atou id to fierbase

Future<void> AddTaskToFierstore(Task task) {
  var collection = getTaskCollection();
  var docRef = collection.doc();
  task.id = docRef.id;
  return docRef.set(task);
}

Future<QuerySnapshot<Task>> getTasksFromFierstore(DateTime dateTime) {
  return getTaskCollection()
      .where('date',
          isEqualTo: DateUtils.dateOnly(dateTime).microsecondsSinceEpoch)
      .get();
}

Future<void> deleteTaskFromFierstore(Task task) {
  return getTaskCollection().doc(task.id).delete();
}

Future<void> ubdateTaskFromFierstore(Task task) {
  return getTaskCollection().doc(task.id).update(task.toJson());
}
