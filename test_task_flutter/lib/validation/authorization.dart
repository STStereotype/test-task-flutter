class AuthorizationService {
  bool _validNickName(String nickName) {
    if (nickName != '') {
      return true;
    } else {
      return false;
    }
  }

  bool _validPassword(String password) {
    if (password.length >= 3 && password.length <= 9) {
      return true;
    } else {
      return false;
    }
  }

  bool signInWithNicknameAndPassword(String nickName, String password) {
    return _validNickName(nickName)
        ? _validPassword(password)
            ? true
            : false
        : false;
  }
}
