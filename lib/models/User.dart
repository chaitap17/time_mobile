class User {
  String id;
  String type;
  String name;
  String firstName;
  String lastName;
  String username;
  String phone;
  String email;
  String avatar;
  String cover;
  String birthday;
  String lastActived;

  User({
    this.id,
    this.type,
    this.name,
    this.firstName,
    this.lastName,
    this.username,
    this.phone,
    this.email,
    this.avatar,
    this.cover,
    this.birthday,
    this.lastActived,
  });

  Map getLessData() {
    return {
      'id': id,
      'name': name,
      'avatar': avatar,
      'username': username,
    };
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "id": this.id,
      "type": this.type,
      "name": this.name,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "username": this.username,
      "phone": this.phone,
      "email": this.email,
      "avatar": this.avatar,
      "cover": this.cover,
      "birthday": this.birthday,
      "lastActived": this.lastActived,
    };
  }

  User.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        type = map["type"],
        name = map["name"],
        firstName = map["first_name"],
        lastName = map["last_name"],
        username = map["username"],
        phone = map["phone"],
        email = map["email"],
        avatar = map["avatar"],
        cover = map["cover"],
        birthday = map["birthday"],
        lastActived = map["last_actived"];
}
