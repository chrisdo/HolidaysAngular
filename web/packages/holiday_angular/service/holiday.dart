library holiday;


import 'dart:convert';

class Holiday{
  String id;
  String title;
  String category;
  DateTime startDate;
  DateTime endDate;
  String description;
  int duration = 0;

  Holiday(this.id, this.title, this.category, this.startDate, this.endDate, this.description, this.duration);

  String toJsonString() {
    Map data = {
                "id" : id,
                "title" : title,
                "category" : category,
                "startdate" : startDate,
                "enddate" : endDate,
                "description" : description,
                "duration" : duration
    };
    return JSON.encode(data);
  }

  factory Holiday.fromJsonMap(Map json) {
    return new Holiday(json['id'], json['title'], json['category'],
        DateTime.parse(json['startdate']), DateTime.parse(json['enddate']), json['descrption'], json['duration']);
  }

}