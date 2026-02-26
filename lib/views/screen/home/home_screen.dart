import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/home_controller.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/filter_button.dart';
import 'package:flutter_extension/views/base/story_thumb.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/channel/channel_screen.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/group/group_chat_screen.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/personal/personal_chat_screen.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icon/drawer_iocn.svg'),
                      const SizedBox(width: 24),

                      Text(
                        "MENZA",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                        ),
                      ),

                      const Spacer(),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          color: const Color(0xFF3E1A1A),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFFFFFFF).withValues(alpha: 0.15),
                              const Color(0xFFFFFFFF).withValues(alpha: 0.0),
                            ],
                          ),

                          border: Border.all(
                            color: const Color(
                              0xFFFFFFFF,
                            ).withValues(alpha: 0.2),
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icon/search.svg',

                            color: Colors.white,
                          ),
                        ),
                      ),

                      const SizedBox(width: 8),

                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,

                          color: const Color(0xFF3E1A1A),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              const Color(0xFFFFFFFF).withValues(alpha: 0.15),
                              const Color(0xFFFFFFFF).withValues(alpha: 0.0),
                            ],
                          ),

                          border: Border.all(
                            color: const Color(
                              0xFFFFFFFF,
                            ).withValues(alpha: 0.2),
                            width: 0.5,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/icon/add_icon.svg',

                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Obx(() {
                    final total =
                        1 +
                        (_homeController.myStory.value != null ? 1 : 0) +
                        _homeController.others.length;
                    return SizedBox(
                      height: 100,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: total,
                        separatorBuilder: (_, __) => const SizedBox(width: 12),
                        itemBuilder: (context, idx) {
                          final hasMine = _homeController.myStory.value != null;
                          final isAdd = idx == 0;
                          final isMine = !isAdd && hasMine && idx == 1;

                          String title;
                          String? thumb;
                          if (isAdd) {
                            title = "Add Story";
                          } else if (isMine) {
                            title = "Me";
                            thumb =
                                _homeController.myStory.value!.mediaPaths.first;
                          } else {
                            final other = _homeController
                                .others[idx - 1 - (hasMine ? 1 : 0)];
                            title = other.userName;
                            thumb = other.mediaPaths.first;
                          }

                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  if (isAdd) {
                                    await _homeController
                                        .pickAndCreateMyStory();
                                  } else if (isMine) {
                                    _homeController.currentMediaIndex.value = 0;
                                    // await Get.to(
                                    //   () => MyStoryViewer(thumb: thumb!),
                                    // );
                                  } else {
                                    _homeController.currentUserIndex.value =
                                        idx - 1 - (hasMine ? 1 : 0);
                                    _homeController.currentMediaIndex.value = 0;
                                    // await Get.to(
                                    //   () => const OthersStoryViewer(),
                                    // );
                                  }
                                },
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: const Color(0xFF3C3C3C),
                                    border: Border.all(
                                      color: isAdd
                                          ? AppColors.textColor
                                          : const Color(0xFF0048FF),

                                      width: 2,
                                    ),
                                  ),
                                  child: ClipOval(
                                    child: isAdd
                                        ? Center(
                                            child: Icon(
                                              Icons.add,
                                              size: 30,
                                              color: AppColors.textColor,
                                            ),
                                          )
                                        : StoryThumb(path: thumb!),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                title,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: isAdd
                                      ? AppColors.textColor
                                      : Colors.white60,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  }),

                  const SizedBox(height: 16),

                  Expanded(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => Row(
                              children: [
                                Expanded(
                                  child: FilterButton(
                                    label: 'All',
                                    isSelected: _homeController.isSelected(
                                      'All',
                                    ),
                                    onTap: () =>
                                        _homeController.selectFilter('All'),
                                  ),
                                ),
                                Expanded(
                                  child: FilterButton(
                                    label: 'Person',
                                    isSelected: _homeController.isSelected(
                                      'Person',
                                    ),
                                    onTap: () =>
                                        _homeController.selectFilter('Person'),
                                  ),
                                ),
                                Expanded(
                                  child: FilterButton(
                                    label: 'Channel',
                                    isSelected: _homeController.isSelected(
                                      'Channel',
                                    ),
                                    onTap: () =>
                                        _homeController.selectFilter('Channel'),
                                  ),
                                ),
                                Expanded(
                                  child: FilterButton(
                                    label: 'Group',
                                    isSelected: _homeController.isSelected(
                                      'Group',
                                    ),
                                    onTap: () =>
                                        _homeController.selectFilter('Group'),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 24),

                          Expanded(
                            child: Obx(() {
                              final listData = _homeController.filteredList;

                              if (listData.isEmpty) {
                                return const Center(
                                  child: Text(
                                    "No data found",
                                    style: TextStyle(color: Colors.white54),
                                  ),
                                );
                              }

                              return ListView.separated(
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 16),
                                itemCount: listData.length,
                                itemBuilder: (context, index) {
                                  final item = listData[index];

                                  return GestureDetector(
                                    onTap: () {
                                      if (item.type == 'Person') {
                                        Get.to(
                                          () => const PersonalChatScreen(),
                                        );
                                      } else if (item.type == 'Channel') {
                                        Get.to(() => const ChannelScreen());
                                      } else if (item.type == 'Group') {
                                        Get.to(() => const GroupChatScreen());
                                      } else {
                                        print("All ========> ");
                                      }
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 52,
                                          width: 52,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            border: Border.all(
                                              color: const Color(
                                                0xFFFFFFFF,
                                              ).withValues(alpha: 0.30),
                                              width: 1,
                                            ),
                                            // ডামি ইমেজ ব্যবহার করা হচ্ছে
                                            image: const DecorationImage(
                                              image: AssetImage(
                                                "assets/images/nima.png",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.name,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: AppColors.textColor,
                                                ),
                                              ),
                                              Text(
                                                item.lastSeen,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color(
                                                    0xFFFFFFFF,
                                                  ).withValues(alpha: 0.30),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              item.time,
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(
                                                  0xFFFFFFFF,
                                                ).withValues(alpha: 0.30),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            if (item.unreadCount > 0)
                                              Container(
                                                height: 18,
                                                width: 33,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(52),
                                                  color: const Color(
                                                    0xFFFFFFFF,
                                                  ).withValues(alpha: 0.10),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "${item.unreadCount}",
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          AppColors.textColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
