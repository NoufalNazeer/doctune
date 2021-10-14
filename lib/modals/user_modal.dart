import 'dart:convert';

class Userdata {


  List<Users> ?users;

  Userdata({this.users});

  Userdata.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = new List<Users>.empty();
      json['users'].forEach((v) {
        users?.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      data['users'] = this.users?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String ?userName;
  String ?contact;
  String ?password;
  String ?email;

  Users({this.userName, this.contact, this.password, this.email});

  Users.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    contact = json['contact'];
    password = json['password'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['contact'] = this.contact;
    data['password'] = this.password;
    data['email'] = this.email;
    return data;
  }

  static String encode(List<Users> users) => json.encode(
    users
        .map<Map<String, dynamic>>((music) => Users.toMap(music))
        .toList(),
  );

  static List<Users> decode(String user) =>
      (json.decode(user) as List<dynamic>)
          .map<Users>((item) => Users.fromJson(item))
          .toList();

  static Map<String, dynamic> toMap(Users users) => {
    'userName': users.userName,
    'contact': users.contact,
    'email': users.email,
    'password': users.password,
  };
  
  
}
