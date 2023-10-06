// To parse this JSON data, do
//
//     final postmethod = postmethodFromJson(jsonString);

import 'dart:convert';

Postmethod postmethodFromJson(String str) => Postmethod.fromJson(json.decode(str));

String postmethodToJson(Postmethod data) => json.encode(data.toJson());

class Postmethod {
  String name;
  String job;

  Postmethod({
    required this.name,
    required this.job,
  });

  factory Postmethod.fromJson(Map<String, dynamic> json) => Postmethod(
    name: json["name"],
    job: json["job"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "job": job,
  };
}
