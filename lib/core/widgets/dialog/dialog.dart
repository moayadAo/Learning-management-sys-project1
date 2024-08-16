import 'package:flutter/material.dart';
import 'package:learning_system/core/widgets/white_blue_button.dart';

import '../../utils/color_manager.dart';
import '../../utils/values_manager.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget({
    super.key,
    this.topWidget,
    this.contentWidget,
    this.bottomWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
  });

  final Widget? topWidget;
  final Widget? contentWidget;
  final Widget? bottomWidget;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(AppPadding.p12),
            margin: const EdgeInsets.symmetric(horizontal: AppMargin.m8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: ColorManager.white,
            ),
            child: Column(
              children: [
                topWidget ?? const SizedBox.shrink(),
                const SizedBox(height: AppSize.s10),
                contentWidget ?? const SizedBox.shrink(),
                const SizedBox(height: AppSize.s10),
                Row(
                  mainAxisAlignment: mainAxisAlignment,
                  children: [
                    bottomWidget ?? const SizedBox.shrink(),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

showConfirm(
    {required BuildContext context,
    required VoidCallback confirm,
    String? title}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return DialogWidget(
          mainAxisAlignment: MainAxisAlignment.center,
          topWidget: title != null ? Text(title) : null,
          bottomWidget: WhiteBlueButton(
            height: 50,
            label: 'ok',
            isBlue: false,
            colorbut: ColorManager.greenLightButton,
            onPressed: confirm,
          ),
        );
      });
}
