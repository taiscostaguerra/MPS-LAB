import 'package:mps/app/domain/entity/address/address_entity.dart';
import 'package:mps/app/domain/entity/user/user_entity.dart';
import 'package:mps/app/domain/repository/address_repository.dart';
import 'package:mps/app/domain/repository/user_repository.dart';

class AddAddressComand {
  List<AddressEntity> addedAddress = new List();

  final AddressRepository _addressRepository;

  AddAddressComand(this._addressRepository);

  Future<void> execute(AddressEntity addressEntity) async {
    await _addressRepository.save(addressEntity);
    addedAddress.add(addressEntity);
  }

  Future<void> undo() async {
    if (addedAddress.isNotEmpty) {
      await _addressRepository.delete(addedAddress.last);
      addedAddress.removeLast();
    }
  }
}
