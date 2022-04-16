class Campus{
  final String CampusName;
  final String CampusCode;

  const Album({
    required this.CampusName,
    required this.CampusCode,
  });
  factory Campus.fromJson(Map<String, dynamic> json) {
    return Campus(
      userId: json['userId'],
      id: json['id'],
    );
  }
}