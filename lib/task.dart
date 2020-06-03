import 'dart:ui';

import 'package:flutter/foundation.dart';

class Task{
 final String title;
 final String id;
 DateTime date;
 Color color;

 Task({
   @required this.id,
   @required this.title,
   @required this.date,
   @required this.color,
 });
}