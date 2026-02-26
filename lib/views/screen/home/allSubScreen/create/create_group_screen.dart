import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final List<_ContactItem> _contacts = [
    _ContactItem(
      name: 'Cottage Country Comic-Con',
      status: 'Last seen Mon 01 Jun, 2020 05:05 pm',
      image: 'assets/images/nima.png',
    ),
    _ContactItem(
      name: 'Kyiv Comic Con',
      status: 'Last seen Fri 19 Jun, 2020 09:35 am',
      image: 'assets/images/jhon.png',
    ),
    _ContactItem(
      name: 'Cherry Blossom Festival Fort Wayne',
      status: 'Last seen Tue 02 Jun, 2020 09:12 am',
      image: 'assets/images/mark.png',
    ),
    _ContactItem(
      name: 'Lake Como Comic Art Festival',
      status: '@lakecomo, 4 543 subscriber',
      image: 'assets/images/simail.png',
    ),
    _ContactItem(
      name: 'East Coast Black Age of Comics Convention',
      status: '@eastcoastblack, 12 543 subscriber',
      image: 'assets/images/me.png',
    ),
    _ContactItem(
      name: 'East Coast Black Age of Comics Convention',
      status: '@eastcoastblack, 12 543 members',
      image: 'assets/images/dummy.png',
    ),
  ];

  final Set<int> _selectedIndices = {0, 2};

  void _toggleContact(int index) {
    setState(() {
      if (_selectedIndices.contains(index)) {
        _selectedIndices.remove(index);
      } else {
        _selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── AppBar ──────────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        borderRadius: BorderRadius.circular(20),
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Create Group',
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '${_selectedIndices.length} of 500 selected',
                              style: TextStyle(
                                color: AppColors.hintColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Part 1: Group Info Card ──────────────────────────
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFF272727),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Camera icon button
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(
                            0xFFFFFFFF,
                          ).withValues(alpha: 0.10),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(
                              0xFFFFFFFF,
                            ).withValues(alpha: 0.30),
                            width: 1,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: SvgPicture.asset(
                            'assets/icon/attach_fill.svg',
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Name + Description fields
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Enter group name',
                                hintStyle: TextStyle(
                                  color: const Color(
                                    0xFFFFFFFF,
                                  ).withValues(alpha: 0.40),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                            const Divider(color: Color(0xFF428EFF), height: 14),
                            TextField(
                              style: TextStyle(
                                color: AppColors.textColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Description',
                                hintStyle: TextStyle(
                                  color: const Color(
                                    0xFFFFFFFF,
                                  ).withValues(alpha: 0.40),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                              ),
                            ),
                            const Divider(color: Color(0xFF428EFF), height: 14),
                            const SizedBox(height: 4),
                            Text(
                              'you can give an optional description for you Group',
                              style: TextStyle(
                                color: AppColors.textColor.withValues(
                                  alpha: 0.50,
                                ),
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Part 2: Contact List (scrollable) ────────────────
                Expanded(
                  child: Container(
                    color: const Color(0xFF1D1D1D),
                    child: Column(
                      children: [
                        // Header row
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Select who would like to add?',
                                  style: TextStyle(
                                    color: AppColors.hintColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 9,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF2C6E4A),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '${_selectedIndices.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Scrollable contact list
                        Expanded(
                          child: Container(
                            color: const Color(0xFFF141414),
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                ..._contacts.asMap().entries.map((entry) {
                                  final index = entry.key;
                                  final contact = entry.value;
                                  final isSelected = _selectedIndices.contains(
                                    index,
                                  );
                                  return _ContactTile(
                                    contact: contact,
                                    isSelected: isSelected,
                                    onTap: () => _toggleContact(index),
                                  );
                                }),
                                const SizedBox(height: 20),
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
          ),
        ],
      ),
    );
  }
}

// ── Contact Tile ────────────────────────────────────────────────────────────

class _ContactTile extends StatelessWidget {
  final _ContactItem contact;
  final bool isSelected;
  final VoidCallback onTap;

  const _ContactTile({
    required this.contact,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage(contact.image),
                  backgroundColor: AppColors.cardColor,
                ),
                if (isSelected)
                  Positioned.fill(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xBB2C6E4A),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.name,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    contact.status,
                    style: TextStyle(
                      color: AppColors.textColor.withValues(alpha: 0.30),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data Class ──────────────────────────────────────────────────────────────

class _ContactItem {
  final String name;
  final String status;
  final String image;

  _ContactItem({required this.name, required this.status, required this.image});
}
