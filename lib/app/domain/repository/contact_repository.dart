import 'package:mps/app/domain/entity/contact/contact_entity.dart';

abstract class ContactRepository{
  Future<void> save(ContactEntity contactModel);
  Future<void> update(ContactEntity contactModel);
  Future<ContactEntity> findOne(String id);
  Future<void> delete(ContactEntity contactModel);
}