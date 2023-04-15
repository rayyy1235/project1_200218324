import 'package:flutter/material.dart';

class Note {
  final int? id;
  final String title;
  final String description;
  final Color? cucolor;

  const Note({
    required this.title,
    required this.description,
    this.id,
    this.cucolor,
  });

  factory Note.fromMap(Map<String, dynamic> Notemap) => Note(
        id: Notemap['id'],
        title: Notemap['title'],
        description: Notemap['description'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
