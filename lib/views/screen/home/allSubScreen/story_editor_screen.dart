import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_extension/controller/home_controller.dart';
import 'package:flutter_extension/data/model/story_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

// ============================================================
//                     TEXT OVERLAY MODEL
// ============================================================
class TextOverlay {
  String text;
  Matrix4 matrix;
  double fontSize;
  Color color;
  FontWeight fontWeight;
  FontStyle fontStyle;
  bool isUnderlined;
  String fontFamily;
  bool hasBackground;

  TextOverlay({
    required this.text,
    Matrix4? matrix,
    this.fontSize = 32,
    this.color = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.isUnderlined = false,
    this.fontFamily = 'Poppins',
    this.hasBackground = false,
  }) : matrix = matrix ?? Matrix4.identity();
}

// ============================================================
//                  STORY EDITOR SCREEN
// ============================================================
class StoryEditorScreen extends StatefulWidget {
  final Story story;
  const StoryEditorScreen({super.key, required this.story});

  @override
  State<StoryEditorScreen> createState() => _StoryEditorScreenState();
}

class _StoryEditorScreenState extends State<StoryEditorScreen> {
  final ScreenshotController _screenshotController = ScreenshotController();
  final _homeController = Get.put(HomeController());

  final List<TextOverlay> _textOverlays = [];
  int? _selectedOverlayIndex;

  static const double _headerHeight = 56;

  final List<String> _fontFamilies = [
    'Poppins',
    'Lato',
    'Oswald',
    'Pacifico',
    'Lobster',
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // ── Gradient Header ──────────────────────────────────
          Container(
            width: double.infinity,
            height: topPadding + _headerHeight,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF780E00), Color(0xFF000000)],
                begin: Alignment.topCenter,
                end: Alignment.topLeft,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: topPadding),
              child: SizedBox(
                height: _headerHeight,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                    const Text(
                      'Add Story',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ── Editor Body ──────────────────────────────────────
          Expanded(
            child: Stack(
              children: [
                // ── Screenshot area ──
                Positioned.fill(
                  child: Screenshot(
                    controller: _screenshotController,
                    child: Stack(
                      children: [
                        // Background image
                        Positioned.fill(
                          child: widget.story.mediaPaths.isEmpty
                              ? Container(
                                  color: Colors.grey[900],
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : Image.file(
                                  File(widget.story.mediaPaths.first),
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, error, __) => Container(
                                    color: Colors.black,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.broken_image,
                                            color: Colors.red,
                                            size: 50,
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            "Image load failed!\n$error",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                        ),

                        // ✅ Text overlays (inside screenshot)
                        ..._buildTextOverlays(screenSize, topPadding),

                        // Tap empty to deselect
                        Positioned.fill(
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () =>
                                setState(() => _selectedOverlayIndex = null),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Right Toolbar (outside screenshot) ──
                Positioned(
                  right: 15,
                  top: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.40),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _minimalToolBtn(
                          text: 'Aa',
                          onTap: () => _openTextEditor(),
                          isActive: false,
                        ),
                        const SizedBox(height: 8),
                        _minimalToolBtn(
                          text: 'B',
                          onTap: _toggleBold,
                          isActive:
                              _selectedOverlayIndex != null &&
                              _textOverlays[_selectedOverlayIndex!]
                                      .fontWeight ==
                                  FontWeight.bold,
                        ),
                        const SizedBox(height: 8),
                        _minimalToolBtn(
                          text: 'U',
                          onTap: _toggleUnderline,
                          isActive:
                              _selectedOverlayIndex != null &&
                              _textOverlays[_selectedOverlayIndex!]
                                  .isUnderlined,
                        ),
                        const SizedBox(height: 8),
                        _minimalToolBtn(
                          text: 'I',
                          onTap: _toggleItalic,
                          isActive:
                              _selectedOverlayIndex != null &&
                              _textOverlays[_selectedOverlayIndex!].fontStyle ==
                                  FontStyle.italic,
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Share Button ──
                Positioned(
                  bottom: 25,
                  right: 20,
                  child: GestureDetector(
                    onTap: _saveAndShareStory,
                    child: Container(
                      height: 50,
                      width: 175, // ✅ fixed width
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFF102BDA), Color(0xFFBC0003)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(
                              0xFFFFFFFF,
                            ).withValues(alpha: 0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Share to Story',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset('assets/icon/send.svg'),
                        ],
                      ),
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

  // ──────────────────────────────────────────────────────────
  //  TEXT OVERLAY BUILDER  ✅ FIXED
  // ──────────────────────────────────────────────────────────
  List<Widget> _buildTextOverlays(Size screenSize, double topPadding) {
    return List.generate(_textOverlays.length, (i) {
      final overlay = _textOverlays[i];
      final isSelected = _selectedOverlayIndex == i;

      return Positioned(
        // ✅ Span the full editor area so gesture detector has room
        left: 0,
        top: 0,
        right: 0,
        bottom: 0,
        child: MatrixGestureDetector(
          shouldRotate: true,
          shouldScale: true,
          shouldTranslate: true,
          onMatrixUpdate:
              (matrix, translationMatrix, scaleMatrix, rotationMatrix) {
                setState(() {
                  overlay.matrix = MatrixGestureDetector.compose(
                    overlay.matrix,
                    translationMatrix,
                    scaleMatrix,
                    rotationMatrix,
                  );
                });
              },
          // ✅ Stack inside so Transform doesn't collapse to 0 size
          child: Stack(
            children: [
              Transform(
                transform: overlay.matrix,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => setState(
                    () => _selectedOverlayIndex = isSelected ? null : i,
                  ),
                  onDoubleTap: () => _openTextEditor(editIndex: i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: isSelected
                          ? Border.all(
                              color: Colors.white.withOpacity(0.8),
                              width: 1.5,
                            )
                          : null,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      overlay.text,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.getFont(
                        overlay.fontFamily,
                        color: overlay.color,
                        fontSize: overlay.fontSize,
                        fontWeight: overlay.fontWeight,
                        fontStyle: overlay.fontStyle,
                        decoration: overlay.isUnderlined
                            ? TextDecoration.underline
                            : TextDecoration.none,
                        decorationColor: overlay.color,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.7),
                            blurRadius: 8,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  // ──────────────────────────────────────────────────────────
  //  TOOLBAR BUTTON
  // ──────────────────────────────────────────────────────────
  Widget _minimalToolBtn({
    required String text,
    required VoidCallback onTap,
    bool isActive = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive ? Colors.black : Colors.white,
              fontFamily: 'Poppins',
              fontStyle: text == 'I' && isActive
                  ? FontStyle.italic
                  : FontStyle.normal,
              decoration: text == 'U' && isActive
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: isActive ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  //  STYLE TOGGLES
  // ──────────────────────────────────────────────────────────
  void _toggleBold() {
    if (_selectedOverlayIndex != null) {
      setState(() {
        final ov = _textOverlays[_selectedOverlayIndex!];
        ov.fontWeight = ov.fontWeight == FontWeight.bold
            ? FontWeight.normal
            : FontWeight.bold;
      });
    } else {
      _openTextEditor();
    }
  }

  void _toggleUnderline() {
    if (_selectedOverlayIndex != null) {
      setState(() {
        _textOverlays[_selectedOverlayIndex!].isUnderlined =
            !_textOverlays[_selectedOverlayIndex!].isUnderlined;
      });
    } else {
      _openTextEditor();
    }
  }

  void _toggleItalic() {
    if (_selectedOverlayIndex != null) {
      setState(() {
        final ov = _textOverlays[_selectedOverlayIndex!];
        ov.fontStyle = ov.fontStyle == FontStyle.italic
            ? FontStyle.normal
            : FontStyle.italic;
      });
    } else {
      _openTextEditor();
    }
  }

  // ──────────────────────────────────────────────────────────
  //  TEXT EDITOR DIALOG
  // ──────────────────────────────────────────────────────────
  void _openTextEditor({int? editIndex}) {
    final overlay = editIndex != null ? _textOverlays[editIndex] : null;
    final controller = TextEditingController(text: overlay?.text ?? '');

    final tempFontSize = ValueNotifier<double>(overlay?.fontSize ?? 32);
    final tempColor = ValueNotifier<Color>(overlay?.color ?? Colors.white);
    final tempWeight = ValueNotifier<FontWeight>(
      overlay?.fontWeight ?? FontWeight.normal,
    );
    final tempStyle = ValueNotifier<FontStyle>(
      overlay?.fontStyle ?? FontStyle.normal,
    );
    final tempUnderline = ValueNotifier<bool>(overlay?.isUnderlined ?? false);
    final tempFont = ValueNotifier<String>(overlay?.fontFamily ?? 'Poppins');

    showGeneralDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.85),
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (ctx, anim1, anim2) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            void update(VoidCallback fn) {
              fn();
              setDialogState(() {});
            }

            TextStyle previewStyle() => GoogleFonts.getFont(
              tempFont.value,
              color: tempColor.value,
              fontSize: tempFontSize.value,
              fontWeight: tempWeight.value,
              fontStyle: tempStyle.value,
              decoration: tempUnderline.value
                  ? TextDecoration.underline
                  : TextDecoration.none,
              decorationColor: tempColor.value,
              shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.6),
                  blurRadius: 6,
                  offset: const Offset(1, 2),
                ),
              ],
            );

            return Scaffold(
              backgroundColor: Colors.transparent,
              body: GestureDetector(
                onTap: () => FocusScope.of(ctx).unfocus(),
                child: Column(
                  children: [
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.of(ctx).pop(),
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                final text = controller.text.trim();
                                if (text.isEmpty) {
                                  if (editIndex != null) {
                                    setState(
                                      () => _textOverlays.removeAt(editIndex),
                                    );
                                  }
                                  Navigator.of(ctx).pop();
                                  return;
                                }

                                // ✅ Editor area size (excluding header)
                                final topPadding = MediaQuery.of(
                                  context,
                                ).padding.top;
                                final editorH =
                                    MediaQuery.of(context).size.height -
                                    topPadding -
                                    _headerHeight;
                                final editorW = MediaQuery.of(
                                  context,
                                ).size.width;

                                setState(() {
                                  if (editIndex != null) {
                                    final ov = _textOverlays[editIndex];
                                    ov.text = text;
                                    ov.fontSize = tempFontSize.value;
                                    ov.color = tempColor.value;
                                    ov.fontWeight = tempWeight.value;
                                    ov.fontStyle = tempStyle.value;
                                    ov.isUnderlined = tempUnderline.value;
                                    ov.fontFamily = tempFont.value;
                                  } else {
                                    // ✅ Place new text at center of editor
                                    final centerMatrix = Matrix4.identity()
                                      ..translate(
                                        editorW / 2 - 80.0,
                                        editorH / 2 - 30.0,
                                      );
                                    _textOverlays.add(
                                      TextOverlay(
                                        text: text,
                                        matrix: centerMatrix,
                                        fontSize: tempFontSize.value,
                                        color: tempColor.value,
                                        fontWeight: tempWeight.value,
                                        fontStyle: tempStyle.value,
                                        isUnderlined: tempUnderline.value,
                                        fontFamily: tempFont.value,
                                      ),
                                    );
                                  }
                                });

                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          // Style toolbar
                          Container(
                            color: Colors.black38,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            child: Row(
                              children: [
                                _dialogBtn(
                                  child: const Text(
                                    'A',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  ),
                                  onTap: () => update(() {
                                    if (tempFontSize.value > 14)
                                      tempFontSize.value -= 2;
                                  }),
                                ),
                                const SizedBox(width: 6),
                                _dialogBtn(
                                  child: const Text(
                                    'A',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                    ),
                                  ),
                                  onTap: () => update(() {
                                    if (tempFontSize.value < 60)
                                      tempFontSize.value += 2;
                                  }),
                                ),
                                const SizedBox(width: 6),
                                _dialogBtn(
                                  active: tempWeight.value == FontWeight.bold,
                                  child: const Text(
                                    'B',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onTap: () => update(() {
                                    tempWeight.value =
                                        tempWeight.value == FontWeight.bold
                                        ? FontWeight.normal
                                        : FontWeight.bold;
                                  }),
                                ),
                                const SizedBox(width: 6),
                                _dialogBtn(
                                  active: tempUnderline.value,
                                  child: const Text(
                                    'U',
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                  onTap: () => update(() {
                                    tempUnderline.value = !tempUnderline.value;
                                  }),
                                ),
                                const SizedBox(width: 6),
                                _dialogBtn(
                                  active: tempStyle.value == FontStyle.italic,
                                  child: const Text(
                                    'I',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  onTap: () => update(() {
                                    tempStyle.value =
                                        tempStyle.value == FontStyle.italic
                                        ? FontStyle.normal
                                        : FontStyle.italic;
                                  }),
                                ),
                                const Spacer(),
                                // Color picker
                                GestureDetector(
                                  onTap: () {
                                    Color pickerColor = tempColor.value;
                                    showDialog(
                                      context: ctx,
                                      builder: (pickerCtx) => StatefulBuilder(
                                        builder: (pickerCtx, setPickerState) =>
                                            AlertDialog(
                                              backgroundColor: Colors.grey[900],
                                              title: const Text(
                                                'Pick Color',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                              content: SingleChildScrollView(
                                                child: ColorPicker(
                                                  pickerColor: pickerColor,
                                                  onColorChanged: (c) {
                                                    setPickerState(
                                                      () => pickerColor = c,
                                                    );
                                                  },
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {
                                                    update(
                                                      () => tempColor.value =
                                                          pickerColor,
                                                    );
                                                    Navigator.of(
                                                      pickerCtx,
                                                    ).pop();
                                                  },
                                                  child: const Text(
                                                    'OK',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: tempColor.value,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Font family selector
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              itemCount: _fontFamilies.length,
                              itemBuilder: (_, i) {
                                final isSelected =
                                    _fontFamilies[i] == tempFont.value;
                                return GestureDetector(
                                  onTap: () => update(
                                    () => tempFont.value = _fontFamilies[i],
                                  ),
                                  child: AnimatedContainer(
                                    duration: const Duration(milliseconds: 150),
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.white12,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.white30,
                                      ),
                                    ),
                                    child: Text(
                                      _fontFamilies[i],
                                      style: GoogleFonts.getFont(
                                        _fontFamilies[i],
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          // Text input
                          Expanded(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                ),
                                child: TextField(
                                  controller: controller,
                                  autofocus: true,
                                  textAlign: TextAlign.center,
                                  maxLines: null,
                                  style: previewStyle(),
                                  cursorColor: tempColor.value,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Type something...',
                                    hintStyle: TextStyle(color: Colors.white38),
                                  ),
                                  onChanged: (_) => setDialogState(() {}),
                                ),
                              ),
                            ),
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
      },
    );
  }

  Widget _dialogBtn({
    required Widget child,
    required VoidCallback onTap,
    bool active = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: active ? Colors.white : Colors.white12,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: active ? Colors.white : Colors.white30),
        ),
        child: Center(child: child),
      ),
    );
  }

  // ──────────────────────────────────────────────────────────
  //  SAVE & SHARE
  // ──────────────────────────────────────────────────────────
  Future<void> _saveAndShareStory() async {
    setState(() => _selectedOverlayIndex = null);
    await Future.delayed(const Duration(milliseconds: 150));

    try {
      final Uint8List? imageBytes = await _screenshotController.capture(
        pixelRatio: MediaQuery.of(context).devicePixelRatio,
      );

      if (imageBytes == null) {
        Get.snackbar("Error", "Failed to capture story");
        return;
      }

      final directory = await getApplicationDocumentsDirectory();
      final String fileName =
          'story_${DateTime.now().millisecondsSinceEpoch}.png';
      final String filePath = '${directory.path}/$fileName';

      await File(filePath).writeAsBytes(imageBytes);
      debugPrint("✅ Story saved at: $filePath");

      final finalStory = Story(
        userName: "You",
        mediaPaths: [filePath],
        isMe: true,
      );

      _homeController.myStory.value = finalStory;
      _homeController.currentMediaIndex.value = 0;

      if (mounted) Navigator.of(context).pop();

      Get.snackbar(
        "✅ Success",
        "Story shared successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.9),
        colorText: Colors.white,
        margin: const EdgeInsets.all(16),
        borderRadius: 12,
      );
    } catch (e) {
      debugPrint("❌ Error: $e");
      Get.snackbar("Error", "Failed to save story: $e");
    }
  }
}
