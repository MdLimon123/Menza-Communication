class ChatItem {
  final String name;
  final String type; 
  final String lastSeen;
  final String time;
  final int unreadCount;
  final String imageUrl;

  ChatItem({
    required this.name,
    required this.type,
    required this.lastSeen,
    required this.time,
    required this.unreadCount,
    this.imageUrl = "assets/images/nima.png", 
  });
}