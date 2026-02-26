import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_button.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/create/create_channel_screen.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/create/create_group_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  void _showCreateContactSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _CreateContactSheet(),
    );
  }

  final List<_ContactItem> _contacts = [
    _ContactItem(
      name: 'Alice Johnson',
      status: 'last seen recently',
      image: 'assets/images/nima.png',
    ),
    _ContactItem(
      name: 'Andrew Smith',
      status: 'online',
      image: 'assets/images/jhon.png',
    ),
    _ContactItem(
      name: 'Brian Lee',
      status: 'last seen 2 hours ago',
      image: 'assets/images/mark.png',
    ),
    _ContactItem(
      name: 'Clara Evans',
      status: 'last seen yesterday',
      image: 'assets/images/simail.png',
    ),
    _ContactItem(
      name: 'David Park',
      status: 'online',
      image: 'assets/images/me.png',
    ),
    _ContactItem(
      name: 'Emma Wilson',
      status: 'last seen 3 days ago',
      image: 'assets/images/dummy.png',
    ),
    _ContactItem(
      name: 'Frank Miller',
      status: 'last seen recently',
      image: 'assets/images/nima.png',
    ),
    _ContactItem(
      name: 'Grace Kim',
      status: 'online',
      image: 'assets/images/jhon.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Column(
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
                      const SizedBox(width: 20),
                      Text(
                        'Create',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                // ── Main Content Card ────────────────────────────────
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF141414),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        const SizedBox(height: 8),

                        // ── Create Options ─────────────────────────
                        _CreateOption(
                          icon: 'assets/icon/group.svg',
                          iconBgColor: const Color(0xFF2C6E4A),
                          label: 'Create Group',
                          onTap: () {
                            Get.to(() => const CreateGroupScreen());
                          },
                        ),
                        _CreateOption(
                          icon: 'assets/icon/create.svg',
                          iconBgColor: const Color(0xFF1A5276),
                          label: 'Create Channel',
                          onTap: () {
                            Get.to(() => const CreateChannelScreen());
                          },
                        ),
                        _CreateOption(
                          icon: 'assets/icon/channel.svg',
                          iconBgColor: const Color(0xFF2683EB),
                          label: 'Create Contact',
                          onTap: () => _showCreateContactSheet(context),
                        ),

                        // ── Sorted label ───────────────────────────
                        Container(
                          width: double.infinity,
                          color: const Color(0xFF1D1D1D),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 6,
                            ),
                            child: Text(
                              'Sorted by name',
                              style: TextStyle(
                                color: AppColors.hintColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),

                        // ── Contact List ───────────────────────────
                        ..._contacts.map(
                          (contact) => _ContactTile(contact: contact),
                        ),

                        const SizedBox(height: 20),
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

// ── Create Option Row ──────────────────────────────────────────────────────────

class _CreateOption extends StatelessWidget {
  final String icon;
  final Color iconBgColor;
  final String label;
  final VoidCallback onTap;

  const _CreateOption({
    required this.icon,
    required this.iconBgColor,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Center(
              child: SvgPicture.asset(
                icon,
                width: 22,
                height: 22,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 14),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Contact Tile ───────────────────────────────────────────────────────────────

class _ContactTile extends StatelessWidget {
  final _ContactItem contact;

  const _ContactTile({required this.contact});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 23,
              backgroundImage: AssetImage(contact.image),
              backgroundColor: AppColors.cardColor,
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
                      color: contact.status == 'online'
                          ? AppColors.primaryColor
                          : AppColors.hintColor,
                      fontSize: 12,
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

// ── Data Class ────────────────────────────────────────────────────────────────

class _ContactItem {
  final String name;
  final String status;
  final String image;

  _ContactItem({required this.name, required this.status, required this.image});
}

// ── Create Contact Bottom Sheet ───────────────────────────────────────────────

class _CreateContactSheet extends StatefulWidget {
  const _CreateContactSheet();

  @override
  State<_CreateContactSheet> createState() => _CreateContactSheetState();
}

class _CreateContactSheetState extends State<_CreateContactSheet> {
  final String _selectedCountryCode = '+1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF272727),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ──────────────────────────────────────────
            Row(
              children: [
                Text(
                  'Create Contact',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      border: BoxBorder.all(color: AppColors.textColor),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.close,
                      color: AppColors.textColor,
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // ── First name ──────────────────────────────────────
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF1D1D1D),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),

              child: TextField(
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  fillColor: Color(0xFF141414),
                  filled: true,
                  hintText: 'First name',
                  hintStyle: TextStyle(
                    color: Color(0xFFF787878),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ── Last name ───────────────────────────────────────
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF1D1D1D),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: TextField(
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  fillColor: Color(0xFF141414),
                  filled: true,
                  hintText: 'Last name',
                  hintStyle: TextStyle(
                    color: Color(0xFFF787878),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ── Phone number ────────────────────────────────────
            Container(
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF141414),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  // Country code picker
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                            color: AppColors.cardColor,
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🇺🇸', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 6),
                          Text(
                            _selectedCountryCode,
                            style: TextStyle(
                              color: AppColors.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: AppColors.hintColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Phone input
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: const InputDecoration(
                        hintText: '(555) 555-0545',
                        hintStyle: TextStyle(
                          color: Color(0xFF787878),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // ── Create Contact button ───────────────────────────
            CustomButton(onTap: () {},
             text: "Create Contact",),
          ],
        ),
      ),
    );
  }
}
