import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    this.label,
    this.onTap,
    this.height = 48,
    this.width = 150,
    this.textStyle,
    this.isDisabled = true,
    this.isFill = false,
    this.color = AppColors.primary,
    this.borderColor = AppColors.primary,
    super.key,
  });

  final String? label;
  final VoidCallback? onTap;
  final bool isFill;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final Color? color;
  final Color? borderColor;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: isFill
            ? ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
            side: BorderSide(
              color: borderColor ?? Colors.transparent,
              width: 3,
            )
        )
            : ElevatedButton.styleFrom(
          surfaceTintColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: AppColors.white,
          side: const BorderSide(
            color: AppColors.primary,
            width: 3,
          ),
        ),
        onPressed: isDisabled ? null : onTap,
        child: Text(
          label ?? '',
          style: textStyle,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('label', label));
    properties.add(ObjectFlagProperty<VoidCallback?>.has('onTap', onTap));
    properties.add(DiagnosticsProperty<bool>('isFill', isFill));
    properties.add(DoubleProperty('height', height));
    properties.add(DoubleProperty('width', width));
    properties.add(DiagnosticsProperty<TextStyle?>('textStyle', textStyle));
    properties.add(DiagnosticsProperty<bool>('isDisabled', isDisabled));
  }
}
