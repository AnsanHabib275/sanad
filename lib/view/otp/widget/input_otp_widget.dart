import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/otp/otp_view_model.dart';

class InputOTPWidget extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  const InputOTPWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  @override
  State<InputOTPWidget> createState() => _InputOTPWidgetState();
}

class _InputOTPWidgetState extends State<InputOTPWidget> {
  final otpVM = Get.put(OTPViewModel());
  late bool _hasFocus;
  late bool _hasText;

  @override
  void initState() {
    super.initState();
    _hasFocus = widget.focusNode.hasFocus;
    _hasText = widget.controller.text.isNotEmpty;

    widget.focusNode.addListener(_onFocusChange);
    widget.controller.addListener(_onTextChange);
  }

  void _onFocusChange() {
    setState(() => _hasFocus = widget.focusNode.hasFocus);
  }

  void _onTextChange() {
    setState(() => _hasText = widget.controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    widget.controller.removeListener(_onTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor =
        _hasFocus
            ? AppColor.primaryButtonColor
            : (_hasText
                ? AppColor.primaryButtonColor
                : Theme.of(
                  context,
                ).inputDecorationTheme.border!.borderSide.color);
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      onChanged: (value) {
        if (value.length == 1 && widget.nextFocusNode != null) {
          Utils.fieldFocusChange(
            context,
            widget.focusNode,
            widget.nextFocusNode!,
          );
        }
        otpVM.checkOtpFilled();
      },
      style: TextStyle(
        color: Theme.of(context).extension<AppColors>()?.otpText,
        fontSize: Utils.getResponsiveSize(18),
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: false,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
          vertical: Utils.getResponsiveHeight(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(Utils.getResponsiveSize(8)),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor, width: 0.8),
          borderRadius: BorderRadius.all(
            Radius.circular(Utils.getResponsiveSize(8)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Utils.getResponsiveSize(8)),
          ),
        ),
      ),
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
    );
  }
}
