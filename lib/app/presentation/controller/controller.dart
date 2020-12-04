import 'package:flutter/material.dart';
import 'package:mps/app/domain/command/add_user_comand.dart';
import 'package:mps/app/domain/entity/address/address_entity.dart';
import 'package:mps/app/domain/entity/contact/contact_entity.dart';
import 'package:mps/app/domain/entity/user/user_entity.dart';
import 'package:mps/app/domain/exception/login_exception.dart';
import 'package:mps/app/domain/repository/address_repository.dart';
import 'package:mps/app/domain/repository/contact_repository.dart';
import 'package:mps/app/domain/repository/user_repository.dart';
import 'package:mps/app/presentation/validator/user_validator.dart';


class Controller with UserValidator {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final UserRepository userRepository;
  final AddressRepository addressRepository;
  final ContactRepository contactRepository;
  final AddAddressComand addAddressComand;

  Controller(this.userRepository, this.addressRepository, this.contactRepository, this.addAddressComand);

  void saveUser(Function(String) callback, Function(String) success) async {
    try {
      if (formKey.currentState.validate()) {
        final user = UserEntity(
            login: loginController.text, password: passwordController.text);
        await userRepository.save(user);
        success("Usuário ${user.login} salvo com sucesso");
      }
    } on LoginException catch (e) {
      callback(e.message);
    }
  }

  void removeUser(Function(String) callback, Function(String) success) async {
    try {
      if (formKey.currentState.validate()) {
        final user = UserEntity(
            login: loginController.text, password: passwordController.text);
        await userRepository.remove(user);
        success("Usuário ${user.login} removido com sucesso");
      }
    } on LoginException catch (e) {
      callback(e.message);
    }
  }

  void saveAddress(AddressEntity addressModel) => addAddressComand.execute(addressModel);

  void undoAddAdrress() => addAddressComand.undo();

  void updateAddress(AddressEntity addressModel) => addressRepository.update(addressModel);

  Future<AddressEntity> getAddress(String id) => addressRepository.findOne(id);

  void removeAddress(AddressEntity addressModel) => addressRepository.delete(addressModel);

  void saveContact(ContactEntity contactModel) => contactRepository.save(contactModel);

  void updateContact(ContactEntity contactModel) => contactRepository.update(contactModel);

  Future<ContactEntity> getContact(String id) => contactRepository.findOne(id);

  void removeContact(ContactEntity contactModel) => contactRepository.delete(contactModel);

  

}
