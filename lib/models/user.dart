class User {
  int id;
  String name, email, image;
  User({this.id, this.name, this.email, this.image});
  User.fromJson(Map json) {
    String name = '${json['first_name']} ${json['last_name']}';
    this.id = json['id'];
    this.name = name;
    this.email = json['email'];
    this.image = json['avatar'];
  }
  @override
  String toString() {
    return "{id: $id, name: $name, email: $email, image: $image}";
  }
}
