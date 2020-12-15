import 'package:mps/app/domain/entity/contact/contact_entity.dart';
import '../../memento/memento.dart';
import 'contact_memento.dart';

class ContactOriginator {
  ContactEntity _state;

  ContactOriginator(dynamic state) {
    this._state = state;
  }

  Memento save() {
    return new ContactMemento(this._state);
  }

  void restore(Memento memento) {
    if (!(memento is ContactMemento))
      throw new Exception("Memento desconhecido" + memento.toString());

    this._state = memento.getState();
  }
}
