import 'package:mps/app/memento/memento.dart';

import 'contact_originator.dart';

class ContactCaretaker {
  Memento memento;

  ContactOriginator originator;

  ContactCaretaker(ContactOriginator originator) {
    this.originator = originator;
  }

  void backup() {
    this.memento = this.originator.save();
  }

  void desfazer() {
    if (this.memento == null) return;

    try {
      originator.restore(memento);
    } catch (Exception) {
      print("Não é possivel restaurar mais");
    }

    memento = null;
  }
}
