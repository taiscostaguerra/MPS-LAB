import 'package:flutter/material.dart';
import 'package:mps/app/domain/exception/login_exception.dart';
import 'package:mps/app/domain/model/address/address_model.dart';
import 'package:mps/app/domain/model/contact/contact_model.dart';
import 'package:mps/app/domain/model/user/user_model.dart';
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

  Controller(this.userRepository, this.addressRepository, this.contactRepository);

  void saveUser(Function(String) callback, Function(String) success) async {
    try {
      if (formKey.currentState.validate()) {
        final user = UserModel(
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
        final user = UserModel(
            login: loginController.text, password: passwordController.text);
        await userRepository.remove(user);
        success("Usuário ${user.login} removido com sucesso");
      }
    } on LoginException catch (e) {
      callback(e.message);
    }
  }

  void saveAddress(AddressModel addressModel) => addressRepository.save(addressModel);

  void updateAddress(AddressModel addressModel) => addressRepository.update(addressModel);

  Future<AddressModel> getAddress(String id) => addressRepository.findOne(id);

  void removeAddress(AddressModel addressModel) => addressRepository.delete(addressModel);

  void saveContact(ContactModel contactModel) => contactRepository.save(contactModel);

  void updateContact(ContactModel contactModel) => contactRepository.update(contactModel);

  Future<ContactModel> getContact(String id) => contactRepository.findOne(id);

  void removeContact(ContactModel contactModel) => contactRepository.delete(contactModel);

  

}
