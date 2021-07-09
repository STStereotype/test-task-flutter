// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
// import 'dart:convert';

// NewsModels newsModelFromJson(String str) =>
//     NewsModels.fromJson(json.decode(str));

// String newsModelToJson(NewsModels data) => json.encode(data.toJson());

// class NewsModels {
//   NewsModels({
//     this.status,
//     this.totalResults,
//     required this.articles,
//   });

//   var status;
//   var totalResults;
//   List<Article> articles;

//   factory NewsModels.fromJson(Map<String, dynamic> json) => NewsModels(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//       };
// }

// class Article {
//   Article({
//     this.source,
//     this.author,
//     this.title,
//     this.description,
//     this.url,
//     this.urlToImage,
//     this.publishedAt,
//     this.content,
//   });

//   var source;
//   var author;
//   var title;
//   var description;
//   var url;
//   var urlToImage;
//   var publishedAt;
//   var content;

//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"] == null ? null : json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );

//   Map<String, dynamic> toJson() => {
//         "source": source.toJson(),
//         "author": author == null ? null : author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt.toIso8601String(),
//         "content": content,
//       };
// }

// class Source {
//   Source({
//     this.id,
//     this.name,
//   });

//   var id;
//   var name;

//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: idValues.map[json["id"]],
//         name: nameValues.map[json["name"]],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": idValues.reverse[id],
//         "name": nameValues.reverse[name],
//       };
// }

// enum Id { THE_WALL_STREET_JOURNAL }

// final idValues =
//     EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});

// enum Name { THE_WALL_STREET_JOURNAL }

// final nameValues =
//     EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

NewsModels newsModelsFromJson(String str) =>
    NewsModels.fromJson(json.decode(str));

String newsModelsToJson(NewsModels data) => json.encode(data.toJson());

class NewsModels {
  NewsModels({
    this.statusCode,
    required this.result,
  });

  var statusCode; // int
  Result result; //Result

  factory NewsModels.fromJson(Map<String, dynamic> json) => NewsModels(
        statusCode: json["statusCode"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "result": result.toJson(),
      };
}

class Result {
  Result({
    this.count,
    required this.posts,
  });

  var count; // int
  List<Post> posts;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        count: json["count"],
        posts: List<Post>.from(json["posts"].map((x) => Post.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "posts": List<dynamic>.from(posts.map((x) => x.toJson())),
      };
}

class Post {
  Post({
    this.id,
    required this.meta,
    this.caption,
    required this.tags,
    this.location,
    this.userId,
    this.photoId,
    required this.createdAt,
    required this.updatedAt,
    this.photo,
    required this.user,
  });

  var id; // int
  Meta meta; // Meta
  var caption; // String
  List<dynamic> tags;
  var location; // dynamic
  var userId; // int
  var photoId; // string
  DateTime createdAt; // DateTime
  DateTime updatedAt; // DateTime
  var photo; // Photo
  User user; // User

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        meta: Meta.fromJson(json["meta"]),
        caption: json["caption"] == null ? null : json["caption"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        location: json["location"],
        userId: json["userId"],
        photoId: json["photoId"] == null ? null : json["photoId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "meta": meta.toJson(),
        "caption": caption == null ? null : caption,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "location": location,
        "userId": userId,
        "photoId": photoId == null ? null : photoId,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "photo": photo == null ? null : photo.toJson(),
        "user": user.toJson(),
      };
}

class Meta {
  Meta({
    required this.entries,
  });

  List<dynamic> entries;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        entries: List<dynamic>.from(json["entries"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "entries": List<dynamic>.from(entries.map((x) => x)),
      };
}

class Photo {
  Photo({
    this.height,
    this.width,
    this.id,
  });

  var height; //int
  var width; //int
  var id; //String

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        width: json["width"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "id": id,
      };
}

class User {
  User({
    this.id,
    this.username,
    this.avatar,
    this.firstName,
    this.lastName,
  });

  var id; // int
  var username; // string
  var avatar; // dynamic
  var firstName; //String
  var lastName; // String

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        avatar: json["avatar"],
        firstName: json["firstName"],
        lastName: json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "avatar": avatar,
        "firstName": firstName,
        "lastName": lastName,
      };
}
