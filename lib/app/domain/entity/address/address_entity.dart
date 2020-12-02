
import 'package:hive/hive.dart';

part 'address_entity.g.dart';

@HiveType(typeId: 2)
class AddressEntity{

  @HiveField(0)
  String zipCode;
}