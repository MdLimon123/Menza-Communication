import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:flutter_extension/views/base/custom_network_image.dart';
import 'package:flutter_extension/views/screen/home/allSubScreen/channel/channel_details_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({super.key});

  @override
  State<ChannelScreen> createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<Map<String, dynamic>> messages = [
    {'type': 'date', 'text': 'Yesterday at 12:54 am'},
    {
      'type': 'received',
      'text': 'Hey, saw your dot near the café yesterday. You go there often?',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=11',
    },
    {
      'type': 'sent',
      'text': 'Yeah, I work there sometimes. How about you?',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=5',
    },
    {
      'type': 'received',
      'text': 'Same! Want to grab a coffee together?',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=11',
    },
    {
      'type': 'sent',
      'text': 'Sure, this weekend?',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=5',
    },
    {'type': 'date', 'text': 'Today at 06:24 pm'},
    {
      'type': 'voice',
      'duration': '0:15',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=11',
    },
    {
      'type': 'sent',
      'text': 'Sure, this weekend?',
      'time': '6:24 pm',
      'avatar': 'https://i.pravatar.cc/150?img=5',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(width: 24),
                      InkWell(
                        onTap: () {
                          Get.to(()=> const ChannelDetailsScreen());
                        },
                        child: Container(
                          height: 32,
                          width: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/nima.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                            Get.to(()=> const ChannelDetailsScreen());
                        },
                        child: Text(
                          "Qmona Minus",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),

                      const SizedBox(width: 8),

                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 'mute') {
                          } else if (value == 'search') {
                          } else if (value == 'leave') {
                            _showBlockConfirmationDialog(context);
                          }
                        },

                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                              PopupMenuItem<String>(
                                value: 'mute',
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icon/mute.svg'),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Mute',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              PopupMenuItem<String>(
                                value: 'search',

                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/icon/search.svg'),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Search',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              PopupMenuItem<String>(
                                value: 'leave',
                                child: Row(
                                  children: [
                                    SvgPicture.asset("assets/icon/leave.svg"),
                                    const SizedBox(width: 12),
                                    Text(
                                      'Leave Group',
                                      style: TextStyle(
                                        color: Colors.white.withValues(
                                          alpha: 0.90,
                                        ),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],

                        color: const Color(0xFF2C2C2C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        offset: const Offset(0, 40),

                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xFF3E1A1A),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                const Color(0xFFFFFFFF).withOpacity(0.15),
                                const Color(0xFFFFFFFF).withOpacity(0.0),
                              ],
                            ),
                            border: Border.all(
                              color: const Color(0xFFFFFFFF).withOpacity(0.2),
                              width: 0.5,
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return _buildMessage(messages[index]);
                      },
                    ),
                  ),

                  _buildInputArea(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBlockConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF202020),
              borderRadius: BorderRadius.circular(24),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.25),
                  blurRadius: 12,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: CustomPaint(painter: NoisePainter()),
                  ),
                ),
                // Content
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 24,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          'Leave Channel Confirmation',
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      const Text(
                        'Are you sure you want to leave this channel? You will no longer receive channel messages or updates.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF595959),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Container(
                                height: 44,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF690102),
                                      Color(0xFFFF1070),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'Leave Channel',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    if (message['type'] == 'date') {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              message['text'],
              style: const TextStyle(
                color: Color(0xFF5F5F5F),
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomNetworkImage(
            imageUrl: message['avatar'],
            boxShape: BoxShape.circle,
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: message['type'] == 'voice' ? 12 : 10,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF141414),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: message['type'] == 'voice'
                      ? _buildVoiceMessage()
                      : Text(
                          message['text'],
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                ),
                const SizedBox(height: 4),

                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    message['time'],
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.5),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
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

  Widget _buildVoiceMessage() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFF505050)),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.play_arrow,
            color: Color(0xFF505050),
            size: 14,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildWaveform(),
              const SizedBox(height: 4),
              // Text(
              //   '0:15',
              //   style: TextStyle(
              //     color: Colors.white.withOpacity(0.6),
              //     fontSize: 12,
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildWaveform() {
    return Container(
      height: 30,
      child: CustomPaint(painter: WaveformPainter(), size: Size.infinite),
    );
  }

  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF3C3C3C), width: 1),
      ),
      child: SafeArea(
        child: Row(
          children: [
            SvgPicture.asset('assets/icon/attach.svg'),
            const SizedBox(width: 12),
            SvgPicture.asset('assets/icon/file.svg'),
            const SizedBox(width: 12),
            SvgPicture.asset('assets/icon/micro.svg'),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                controller: _controller,
                style: const TextStyle(
                  color: Color(0xFF767676),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  hintStyle: TextStyle(
                    color: Color(0xFF767676),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                color: Color(0xFF8B2635),
                shape: BoxShape.circle,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset('assets/icon/send.svg'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WaveformPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white.withOpacity(0.8)
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    double barWidth = 3;
    double spacing = 4;
    int barCount = 30;

    for (int i = 0; i < barCount; i++) {
      double height = 8 + (i % 5) * 4;
      double x = i * (barWidth + spacing);
      double y = (size.height - height) / 2;

      canvas.drawRect(Rect.fromLTWH(x, y, barWidth, height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class NoisePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black.withValues(alpha: 0.25)
      ..style = PaintingStyle.fill;

    final random = Random();
    final noiseCount = (size.width * size.height / 100).toInt();

    for (int i = 0; i < noiseCount; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = random.nextDouble() * 0.3;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
