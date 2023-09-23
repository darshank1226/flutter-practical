class User {
  final int? id;
  final String avatarUrl;
  final String name;
  final String email;
  final List<String> skills;
  final String workExperience;

  User({
    this.id,
    required this.avatarUrl,
    required this.name,
    required this.email,
    required this.skills,
    required this.workExperience,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatarUrl': avatarUrl,
      'name': name,
      'email': email,
      'skills': skills.join(', '),
      'workExperience': workExperience
    };
  }
}
