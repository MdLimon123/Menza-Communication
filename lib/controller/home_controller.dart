import 'package:flutter_extension/data/model/chat_item_model.dart';
import 'package:flutter_extension/data/model/story_model.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/story_editor_screen.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class HomeController extends GetxController {
  final ImagePicker _picker = ImagePicker();

  var currentFilter = 'All'.obs;

  final List<ChatItem> _allChats = [
    // Person Types
    ChatItem(
      name: "Rahim Ahmed",
      type: "Person",
      lastSeen: "last seen 2 min ago",
      time: "10:30 AM",
      unreadCount: 2,
    ),
    ChatItem(
      name: "Karim Bhai",
      type: "Person",
      lastSeen: "last seen 1 hr ago",
      time: "09:15 AM",
      unreadCount: 0,
    ),
    ChatItem(
      name: "Sumaiya Aktar",
      type: "Person",
      lastSeen: "online",
      time: "Yesterday",
      unreadCount: 5,
    ),

    // Channel Types
    ChatItem(
      name: "Tech News BD",
      type: "Channel",
      lastSeen: "10k members",
      time: "10:45 AM",
      unreadCount: 12,
    ),
    ChatItem(
      name: "Flutter Updates",
      type: "Channel",
      lastSeen: "5k members",
      time: "08:00 AM",
      unreadCount: 0,
    ),
    ChatItem(
      name: "Daily Cricket",
      type: "Channel",
      lastSeen: "20k members",
      time: "07:30 AM",
      unreadCount: 3,
    ),
    ChatItem(
      name: "Food Lovers",
      type: "Channel",
      lastSeen: "8k members",
      time: "Yesterday",
      unreadCount: 0,
    ),

    // Group Types
    ChatItem(
      name: "Family Group",
      type: "Group",
      lastSeen: "Mom, Dad + 4 others",
      time: "10:50 AM",
      unreadCount: 99,
    ),
    ChatItem(
      name: "Office Project",
      type: "Group",
      lastSeen: "You + 10 others",
      time: "09:00 AM",
      unreadCount: 1,
    ),
    ChatItem(
      name: "University Friends",
      type: "Group",
      lastSeen: "Rahim, Karim + 8 others",
      time: "Mon",
      unreadCount: 0,
    ),
    ChatItem(
      name: "Football Fan Club",
      type: "Group",
      lastSeen: "Admin + 50 others",
      time: "Sun",
      unreadCount: 4,
    ),
  ];

  void selectFilter(String filter) {
    currentFilter.value = filter;
  }

  bool isSelected(String filter) {
    return currentFilter.value == filter;
  }

  List<ChatItem> get filteredList {
    if (currentFilter.value == 'All') {
      return _allChats;
    } else {
      return _allChats
          .where((chat) => chat.type == currentFilter.value)
          .toList();
    }
  }

  Rxn<Story> myStory = Rxn<Story>();

  RxList<Story> others = <Story>[
    Story(userName: "Olivia", mediaPaths: ["assets/images/me.png"]),
    Story(userName: "Dayssi", mediaPaths: ["assets/images/nima.png"]),
    Story(userName: "Amiliva", mediaPaths: ["assets/images/simail.png"]),
    Story(userName: "John", mediaPaths: ["assets/images/jhon.png"]),
  ].obs;

  RxInt currentMediaIndex = 0.obs;
  RxInt currentUserIndex = 0.obs;

  Future<void> pickAndCreateMyStory() async {
    final files = await _picker.pickMultiImage(imageQuality: 85);
    if (files.isEmpty) return;

    myStory.value = Story(
      userName: "You",
      mediaPaths: files.map((e) => e.path).toList(),
      isMe: true,
    );

    await Get.to(() => StoryEditorScreen(story: myStory.value!));

    // currentMediaIndex.value = 0;

    // if (others.isNotEmpty) {
    //   currentUserIndex.value = 0;
    //   currentMediaIndex.value = 0;
    // }
  }
}
