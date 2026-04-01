import 'message.dart';
import 'messages_en.dart';
import 'messages_fa.dart';

/// Backward compatible helper.
///
/// Sets the current locale for localization messages.
void initializeMessagesForLocale(String locale) {
  LocalizationMessages.setLocaleByName(locale);
}

class LocalizationMessages {
  static final Map<Locale, Map<MessageKey, String>> _messagesByLocale = {
    Locale.en: _toMessageMap(messagesEn),
    Locale.fa: _toMessageMap(messagesFa),
  };

  static Locale _currentLocale = Locale.fa;
  static MessageType _defaultMessageType = MessageType.general;

  final Locale locale;

  LocalizationMessages(this.locale);

  void init() {
    setLocale(locale);
  }

  static Locale get currentLocale => _currentLocale;

  static MessageType get defaultMessageType => _defaultMessageType;

  static List<Locale> get supportedLocales => Locale.values;

  static void setLocale(Locale locale) {
    _currentLocale = locale;
  }

  static void setLocaleByName(String locale) {
    final locale0 = Locale.values.firstWhere(
      (item) => item.name == locale,
      orElse: () =>
          throw ArgumentError.value(locale, 'locale', 'Unsupported locale.'),
    );
    setLocale(locale0);
  }

  static void setDefaultMessageType(MessageType type) {
    _defaultMessageType = type;
  }

  static Map<MessageKey, String> _toMessageMap(List<Message> messages) {
    return {
      for (var message in messages)
        MessageKey(message.key, message.type): message.title
    };
  }

  static String _lookup(
    String key, {
    Locale? locale,
    MessageType? type,
    required String fallback,
  }) {
    final locale0 = locale ?? _currentLocale;
    final type0 = type ?? _defaultMessageType;
    final localeMessages = _messagesByLocale[locale0];

    return localeMessages?[MessageKey(key, type0)] ??
        localeMessages?[MessageKey(key, MessageType.general)] ??
        fallback;
  }

  static String weekday(
    int weekday, {
    Locale? locale,
    MessageType? type,
  }) =>
      _lookup(
        'day_$weekday',
        locale: locale,
        type: type,
        fallback: '$weekday',
      );

  static String weekdayShort(
    int dayNumber, {
    Locale? locale,
    MessageType? type,
  }) {
    final String weekDayName = weekday(
      dayNumber,
      locale: locale,
      type: type,
    );
    if (weekDayName.isEmpty) {
      return weekDayName;
    }

    return weekDayName.substring(0, 1).toUpperCase();
  }

  static String month(
    int month, {
    Locale? locale,
    MessageType? type,
  }) {
    final locale0 = locale ?? _currentLocale;
    final fallback = locale0 == Locale.en ? 'Month $month' : 'ماه $month';

    return _lookup(
      'month_$month',
      locale: locale0,
      type: type,
      fallback: fallback,
    );
  }
}
