
import 'package:hive/hive.dart';

part 'contact_entity.g.dart';

@HiveType(typeId: 1)
class ContactEntity{

  @HiveField(0)
  String type;

  @HiveField(1)
  String contact;
}