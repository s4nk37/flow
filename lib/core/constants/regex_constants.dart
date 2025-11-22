class RegexConstants {
  static const String onlyDigits = r'^[0-9]*$';

  static const String onlyCharacter = r'^[a-zA-Z]';

  static const String emailRegex = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';

  static const String completeEmailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static const String phoneRegex = r'^\+?0[0-9]{10}$';

  static const String regexForInValidCharInEmail = r'([^0-9A-Za-z_.@+-]+)';

  static const String regexForOnlyWhiteSpaces = r'^(?!.*[\s])';

  static const String regexForPasswordAllowOnly = r'[A-Za-z0-9#?!@$%^&*_().-]';

  static const String passwordRegex =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,25}$';

  static const String emojiRegex =
      r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])';

  static const String onlyCharacterRegex = r"[0-9a-zA-Z,._()\s']";

  static const String link =
      r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+';
}
