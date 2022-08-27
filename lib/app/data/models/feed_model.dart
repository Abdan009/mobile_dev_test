import 'package:test_mobile_dev/app/data/models/user_model.dart';

class Feed {
  int? userId;
  int? id;
  String? title;
  String? body;
  User? user;

  Feed({this.userId, this.id, this.title, this.body, this.user});

  Feed.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  Feed copyWith({
  String? title,
  String? body,
  User? user,
  }){
    return Feed(
      id: id,
      userId: userId,
      title: title??this.title,
      body: body??this.body,
      user: user??this.user,
    );
  }
  
}
