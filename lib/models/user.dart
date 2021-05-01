class User {
  String id, name, email, image;
  User({this.id, this.name, this.email, this.image});
  @override
  String toString() {
    return "{id: $id, name: $name, email: $email, image: $image}";
  }
}
