class UserModel {
  String name;
  String text;
  String timestamps;
  String userId;

  UserModel({
    required this.name,
    required this.text,
    required this.timestamps,
    required this.userId,
    });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] ?? "",
      text: json['text'] ?? "",
      timestamps: json['timestamps'] ?? "",
      userId: json['userId'] ?? "",
    );
  }

 Map<String, dynamic> toJson() => {
        'name': name,
        "text": text,
        "timestamps": timestamps,
        "userId": userId,
  };

  @override
  String toString() {
    return ''''
       name : $name,
       text : $text,
       timestamps : $timestamps,
       userId : $userId,
      ''';
  }
}