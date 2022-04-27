class UserModel {
  int id;
  String name;
  String email;
  String phone;
  String address;
  String roles;
  String profilePhotoUrl;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.roles,
    this.profilePhotoUrl,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    roles = json['roles'];
    profilePhotoUrl = json['img_url'];
    token = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'roles': roles,
      'img_url': profilePhotoUrl,
      'access_token': token,
    };
  }
}
