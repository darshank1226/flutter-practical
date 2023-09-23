import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class UserData extends HiveObject {
  @HiveField(0)
  final String avatarUrl;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final List<String> skills;

  @HiveField(4)
  final String workExperience;

  UserData({
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.skills,
    required this.workExperience,
  });

  static UserData fromMap(Map<String, dynamic> map) {
    return UserData(
      avatarUrl: map['avatarUrl'],
      name: map['name'],
      email: map['email'],
      skills: List<String>.from(map['skills']),
      workExperience: map['workExperience'],
    );
  }

  // Method to convert a User instance to a Map
  Map<String, dynamic> toMap() {
    return {
      'avatarUrl': avatarUrl,
      'name': name,
      'email': email,
      'skills': skills,
      'workExperience': workExperience,
    };
  }
}
