import 'message.dart';
import 'messages_en.dart';
import 'messages_fa.dart';

void initializeMessagesForLocale(String locale) {
  final locale0 = Locale.values.firstWhere((item) => item.name == locale);
  Localization(locale0).init();
}

class Localization {
  final Locale locale;
  static Map<MessageKey, String> messages = {};

  Localization(this.locale);

  void init() {
    if (locale == Locale.en) {
      messages = _toMessageMap(messagesEn);
    }
    if (locale == Locale.fa) {
      messages = _toMessageMap(messagesFa);
    }
  }

  Map<MessageKey, String> _toMessageMap(List<Message> messages) {
    return {
      for (var message in messages)
        MessageKey(message.key, message.type): message.title
    };
  }

  static String weekday(int weekday,
          {MessageType type = MessageType.general}) =>
      messages[MessageKey('day_$weekday', type)] ?? '$weekday';

  static String month(int month, {MessageType type = MessageType.general}) =>
      messages[MessageKey('month_$month', type)] ?? 'ماه $month';
}
