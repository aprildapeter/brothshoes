// class UserModel {
//   int id;
//   String name;
//   String email;
//   String phone;
//   String address;
//   String roles;
//   String profilePhotoUrl;
//   String token;

//   UserModel({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.address,
//     this.roles,
//     this.profilePhotoUrl,
//     this.token,
//   });

//   UserModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     address = json['address'];
//     roles = json['roles'];
//     profilePhotoUrl = json['url'];
//     token = json['access_token'];
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'email': email,
//       'phone': phone,
//       'address': address,
//       'roles': roles,
//       'img_url': profilePhotoUrl,
//       'access_token': token,
//     };
//   }
// }

class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String address;
  String latitude;
  String longitude;
  String roles;
  String url;
  DateTime createdAt;
  DateTime updatedAt;
  String profilePhotoUrl;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.latitude,
    this.longitude,
    this.roles,
    this.url,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    roles = json['roles'];
    url = json['url'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
    profilePhotoUrl = json['profile_photo_url'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['roles'] = roles;
    data['url'] = url;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['profile_photo_url'] = profilePhotoUrl;
    data['access_token'] = token;
    return data;
  }
}
