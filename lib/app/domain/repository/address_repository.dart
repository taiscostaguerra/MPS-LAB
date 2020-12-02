import 'package:mps/app/domain/model/address/address_model.dart';

abstract class AddressRepository{
  Future<void> save(AddressModel addressModel);
  Future<void> update(AddressModel addressModel);
  Future<AddressModel> findOne(String id);
  Future<void> delete(AddressModel addressModel);
}