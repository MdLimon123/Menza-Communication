import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum OtpState { empty, typing, correct, wrong }

class AuthController extends GetxController {
  RxString selectedOption = 'phone'.obs;

  final int otpLength = 6;

  late List<TextEditingController> controllers;
  late List<FocusNode> focusNodes;

  final _otpState = OtpState.empty.obs;
  OtpState get otpState => _otpState.value;

  final String _correctOtp = '858965';

  void selectOption(String option) {
    selectedOption.value = option;
  }

  bool isSelected(String option) => selectedOption.value == option;
  String get filledOtp => controllers.map((c) => c.text).join();

  @override
  void onInit() {
    super.onInit();
    controllers = List.generate(otpLength, (_) => TextEditingController());
    focusNodes = List.generate(otpLength, (_) => FocusNode());
  }

  @override
  void onClose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.onClose();
  }

  void onChanged(String value, int index) {
    if (value.length == 1) {
      if (index < otpLength - 1) {
        focusNodes[index + 1].requestFocus();
      } else {
        focusNodes[index].unfocus();
        verifyOtp();
      }
    } else if (value.isEmpty && index > 0) {
      focusNodes[index - 1].requestFocus();
    }
    _otpState.value = OtpState.typing;
  }

  void verifyOtp() {
    final entered = controllers.map((c) => c.text).join();
    if (entered.length == otpLength) {
      _otpState.value = entered == _correctOtp
          ? OtpState.correct
          : OtpState.wrong;
    }
  }

  Color boxColor(int index) {
    final filled = controllers[index].text.isNotEmpty;
    if (!filled) return const Color(0xFF1A1A2E);
    switch (_otpState.value) {
      case OtpState.correct:
        return const Color(0xFF1B4332);
      case OtpState.wrong:
        return const Color(0xFF4A0E0E);
      default:
        return const Color(0xFF2A2A3E);
    }
  }

  Color borderColor(int index) {
    final filled = controllers[index].text.isNotEmpty;
    if (!filled) return const Color(0xFF3A3A5A);
    switch (_otpState.value) {
      case OtpState.correct:
        return const Color(0xFF22C55E);
      case OtpState.wrong:
        return const Color(0xFFEF4444);
      default:
        return Colors.white54;
    }
  }
}
