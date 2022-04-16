class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? image;
  String? role;
  String? status;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.image,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt});
  // User.userFromEmailAndPassword(this.email, this.password);

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, password: $password, phone: $phone, address: $address, image: $image, role: $role, status: $status, createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

