
import 'package:hive/hive.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 1)
class ContactModel{

  @HiveField(0)
  String type;

  @HiveField(1)
  String contact;
}