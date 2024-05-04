// To parse this JSON data, do
//
//     final allUserModel = allUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllUserModel allUserModelFromJson(String str) => AllUserModel.fromJson(json.decode(str));

String allUserModelToJson(AllUserModel data) => json.encode(data.toJson());

class AllUserModel {
    String message;
    List<Result> results;

    AllUserModel({
        required this.message,
        required this.results,
    });

    factory AllUserModel.fromJson(Map<String, dynamic> json) => AllUserModel(
        message: json["message"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Result {
    int id;
    String title;
    String description;
    String thumbnail;
    List<String> tags;
    int authorId;
    int categoryId;
    DateTime createdAt;
    DateTime updatedAt;

    Result({
        required this.id,
        required this.title,
        required this.description,
        required this.thumbnail,
        required this.tags,
        required this.authorId,
        required this.categoryId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        thumbnail: json["thumbnail"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        authorId: json["author_id"],
        categoryId: json["category_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "thumbnail": thumbnail,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "author_id": authorId,
        "category_id": categoryId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
