class ChatSettingsEntity {
  final String chatId;
  final bool isMuted;
  final bool isPinned;

  ChatSettingsEntity({
    required this.chatId,
    required this.isMuted,
    required this.isPinned,
  });
}
