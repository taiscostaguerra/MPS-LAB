import 'package:mps/app/domain/entity/contact/contact_entity.dart';
import 'package:mps/app/memento/memento.dart';

class ContactMemento implements Memento {
  ContactEntity _state;

  ContactMemento(ContactEntity contact) {
    _state = contact;
  }

  ContactEntity getState() => _state;

  Memento salvar() {
    return new ContactMemento(_state);
  }
}
