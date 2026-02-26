import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/util/images.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_icon_card_widget.dart';
import 'package:flutter_extension/views/base/custom_search_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiscoveryScreen extends StatefulWidget {
  const DiscoveryScreen({super.key});

  @override
  State<DiscoveryScreen> createState() => _DiscoveryScreenState();
}

class _DiscoveryScreenState extends State<DiscoveryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          Positioned.fill(
            child: SafeArea(
              child: Container(
                ///  clipBehavior: Clip.antiAlias,
                margin: EdgeInsets.only(top: 20.h),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: AppColors.orangeColor, width: 2.w),
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.r),
                    topRight: Radius.circular(30.r),
                  ),
                  color: AppColors.backgroundColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //--- Search widget
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomSearchWidget(
                              hintText: 'Search...',
                              iconPath: Images.searchIcon,
                              onIconClick: () {},
                            ),
                          ),
                          SizedBox(width: 5.w),
                          CustomIconCardWidget(svgPath: Images.googleLogo),
                        ],
                      ),
                    ),

                    ///--- starting body
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          border: Border(
                            top: BorderSide(
                              width: 2.w,
                              color: Colors.grey.withOpacity(0.2),
                            ),
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(28.r),
                            topRight: Radius.circular(28.r),
                          ),
                        ),
                        child: ListView(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          children: const [
                            _FeaturedChannelsSection(),
                            SizedBox(height: 24),
                            _PopularChannelsSection(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Featured Channels Section ─────────────────────────────────────────────────

class _FeaturedChannelsSection extends StatefulWidget {
  const _FeaturedChannelsSection();

  @override
  State<_FeaturedChannelsSection> createState() =>
      _FeaturedChannelsSectionState();
}

class _FeaturedChannelsSectionState extends State<_FeaturedChannelsSection> {
  int _currentIndex = 0;

  static const List<_ChannelItem> _channels = [
    _ChannelItem(
      name: 'Sberbank Russia',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      subscribers: '35K subscriber',
      image: 'assets/images/nima.png',
      isFeatured: true,
    ),
    _ChannelItem(
      name: 'Sberbank India',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      subscribers: '5K subscriber',
      image: 'assets/images/jhon.png',
      isFeatured: false,
    ),
    _ChannelItem(
      name: 'Sberbank UAE',
      lastSeen: 'last seen 10/02/2025 at 10:00 AM',
      subscribers: '12K subscriber',
      image: 'assets/images/mark.png',
      isFeatured: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ──────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.verified, color: Color(0xFFFFC107), size: 22),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Featured Channels',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Top channels this week',
                    style: TextStyle(
                      color: AppColors.hintColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 14),

        // ── Horizontal Cards ─────────────────────────────────────
        SizedBox(
          height: 170,
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollUpdateNotification) {
                final offset = notification.metrics.pixels;
                const cardWidth = 160.0 + 12.0;
                final newIndex = (offset / cardWidth).round().clamp(
                  0,
                  _channels.length - 1,
                );
                if (newIndex != _currentIndex) {
                  setState(() => _currentIndex = newIndex);
                }
              }
              return false;
            },
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _channels.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (_, i) => _ChannelCard(channel: _channels[i]),
            ),
          ),
        ),

        const SizedBox(height: 12),

        // ── Dot Indicators ─────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            _channels.length,
            (i) => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: _currentIndex == i ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: _currentIndex == i
                    ? const Color(0xFFFFFFFF)
                    : const Color(0xFFD9D9D9),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Channel Card ──────────────────────────────────────────────────────────────

class _ChannelCard extends StatelessWidget {
  final _ChannelItem channel;

  const _ChannelCard({required this.channel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => _JoinGroupSheet(),
        );
      },
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF).withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(channel.image),
                      backgroundColor: AppColors.cardColor,
                    ),

                    if (channel.isFeatured)
                      Container(
                        margin: const EdgeInsets.only(left: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF4400), Color(0xFF9B05FF)],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Featured',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Channel name
            Text(
              channel.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 4),

            // Last seen
            Text(
              channel.lastSeen,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textColor.withValues(alpha: 0.30),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),

            const Spacer(),

            // Subscriber count
            Text(
              channel.subscribers,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Data Class ────────────────────────────────────────────────────────────────

class _ChannelItem {
  final String name;
  final String lastSeen;
  final String subscribers;
  final String image;
  final bool isFeatured;

  const _ChannelItem({
    required this.name,
    required this.lastSeen,
    required this.subscribers,
    required this.image,
    required this.isFeatured,
  });
}

// ── Popular Channels Section ──────────────────────────────────────────────────

class _PopularChannelsSection extends StatelessWidget {
  const _PopularChannelsSection();

  static const List<_PopularChannelItem> _items = [
    _PopularChannelItem(
      name: 'Sberbank Russia',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      image: 'assets/images/nima.png',
    ),
    _PopularChannelItem(
      name: 'Sberbank Russia',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      image: 'assets/images/jhon.png',
    ),
    _PopularChannelItem(
      name: 'Apple inc.',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      image: 'assets/images/mark.png',
    ),
    _PopularChannelItem(
      name: 'EUR/USD',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      image: 'assets/images/simail.png',
    ),
    _PopularChannelItem(
      name: 'Tesla Motors',
      lastSeen: 'last seen 11/02/2025 at 6:32 PM',
      image: 'assets/images/me.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Header ────────────────────────────────────────────
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('🔥', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Popular Channels',
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Based on real engagement',
                    style: TextStyle(
                      color: AppColors.hintColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ── List ──────────────────────────────────────────────
        ..._items.asMap().entries.map((entry) {
          final rank = entry.key + 1;
          final item = entry.value;
          return _PopularChannelTile(item: item, rank: rank);
        }),
      ],
    );
  }
}

// ── Popular Channel Tile ──────────────────────────────────────────────────────

class _PopularChannelTile extends StatelessWidget {
  final _PopularChannelItem item;
  final int rank;

  const _PopularChannelTile({required this.item, required this.rank});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (_) => _JoinGroupSheet(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(item.image),
              backgroundColor: AppColors.cardColor,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.lastSeen,
                    style: TextStyle(
                      color: AppColors.textColor.withValues(alpha: 0.30),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 28,
              height: 28,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFCC00FF), Color(0xFF61FF79)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$rank',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Join Group Bottom Sheet ───────────────────────────────────────────────────

class _JoinGroupSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF272727),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/simail.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(width: 8),

              // Channel name
              Text(
                'Sberbank Russia',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 12),
            ],
          ),
          const SizedBox(height: 7),
          // Description
          Text(
            'Are you sure you want to leave this group? You will no longer receive group messages or updates.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.textColor.withValues(alpha: 0.60),
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),

          // Buttons
          Row(
            children: [
              // Cancel
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF595959),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),

              // Join this Group
              Expanded(
                flex: 2,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF102BDA), Color(0xFFBC0003)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Join this Group',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Popular Channel Data Class ────────────────────────────────────────────────

class _PopularChannelItem {
  final String name;
  final String lastSeen;
  final String image;

  const _PopularChannelItem({
    required this.name,
    required this.lastSeen,
    required this.image,
  });
}
