class LoginModel {
  String? email;
  String? password;
  String? token;

  LoginModel({this.email, this.password, this.token}) {
    // if (email == null || password == null) {
    //   throw ArgumentError('Email and password cannot be null');
    // }
  }

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'],
      password: json['password'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
}
