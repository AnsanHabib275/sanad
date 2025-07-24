import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/verifyEmail/verify_email_view_model.dart';

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
  final verifyEmailVM = Get.put(VerifyEmailViewModel());
  late bool hasFocus;
  late bool hasText;

  @override
  void initState() {
    super.initState();
    hasFocus = widget.focusNode.hasFocus;
    hasText = widget.controller.text.isNotEmpty;

    widget.focusNode.addListener(onFocusChange);
    widget.controller.addListener(onTextChange);
  }

  void onFocusChange() {
    setState(() => hasFocus = widget.focusNode.hasFocus);
  }

  void onTextChange() {
    setState(() => hasText = widget.controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(onFocusChange);
    widget.controller.removeListener(onTextChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor =
        hasFocus
            ? AppColor.primaryButtonColor
            : (hasText
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
        verifyEmailVM.checkOtpFilled();
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
          borderSide: BorderSide(
            color: borderColor, // Default border color
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Utils.getResponsiveSize(8)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor, // Default border color
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
