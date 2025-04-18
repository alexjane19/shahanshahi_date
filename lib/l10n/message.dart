enum Locale {
  en,
  fa,
}

enum MessageType {
  general,
  mitrai,
  afghanistan,
}

class Message {
  Message(this.key, this.title, this.type);

  final String key;
  final String title;
  final MessageType type;
}

class MessageKey {
  final String key;
  final MessageType type;

  MessageKey(this.key, MessageType? type) : type = type ?? MessageType.general;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageKey &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          type == other.type;

  @override
  int get hashCode => key.hashCode ^ type.hashCode;
}
