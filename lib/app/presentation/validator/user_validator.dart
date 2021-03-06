mixin UserValidator {
  String validateLogin(String login) {
    if (login.isEmpty) {
      return "Não pode ser vazio";
    } else if (login.length > 20) {
      return "Máximo de 20 caracteres";
    }
    //To do conferir isso aqui
    else if (login.contains(RegExp("[0-9]{1,20}"))) {
       return "Não pode ter números";
     }
    else {
      return null;
    }
  }

  String validatePassword(String password) {
    if (password.length > 12) {
      return "Máximo 12 caracteres";
    } else if (password.length < 8) {
      return "Mínimo de 8 caracteres";
    }
    
     else if (password.contains(RegExp("[A-Z-a-z]{6,}[0-9]{2,}"))) {
       return "Deve possuir letras e números e ao menos 2 números.";
     }
    else {
      return null;
    }
  }
}
