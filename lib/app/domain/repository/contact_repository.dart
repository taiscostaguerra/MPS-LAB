import 'package:mps/app/domain/model/contact/contact_model.dart';

abstract class ContactRepository{
  Future<void> save(ContactModel contactModel);
  Future<void> update(ContactModel contactModel);
  Future<ContactModel> findOne(String id);
  Future<void> delete(ContactModel contactModel);
}