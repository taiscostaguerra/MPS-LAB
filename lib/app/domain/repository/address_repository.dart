import 'package:mps/app/domain/entity/address/address_entity.dart';

abstract class AddressRepository{
  Future<void> save(AddressEntity addressModel);
  Future<void> update(AddressEntity addressModel);
  Future<AddressEntity> findOne(String id);
  Future<void> delete(AddressEntity addressModel);
}