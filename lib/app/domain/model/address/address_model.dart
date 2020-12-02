
import 'package:hive/hive.dart';

part 'address_model.g.dart';

@HiveType(typeId: 2)
class AddressModel{

  @HiveField(0)
  String zipCode;
}