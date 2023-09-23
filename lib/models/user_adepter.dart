import 'package:flutter_prectical/models/user_models.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<UserData> {
  @override
  final int typeId = 0; // Unique ID for this adapter

  @override
  UserData read(BinaryReader reader) {
    return UserData(
      avatarUrl: reader.readString(),
      name: reader.readString(),
      email: reader.readString(),
      skills: List<String>.from(reader.readList()),
      workExperience: reader.readString(),
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer.writeString(obj.avatarUrl);
    writer.writeString(obj.name);
    writer.writeString(obj.email);
    writer.writeList(obj.skills);
    writer.writeString(obj.workExperience);
  }
}
