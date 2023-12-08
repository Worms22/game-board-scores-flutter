import 'package:flutter/material.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_colors.dart';
import 'package:game_board_scores/features/base/utils/namespaces/app_styles.dart';
import 'package:game_board_scores/features/base/utils/namespaces/font_size.dart';
import 'package:game_board_scores/features/base/utils/namespaces/fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    TextEditingController? controller,
    String? hint,
    String? errorText,
    String? suffixIcon,
    String? labelText,
    bool? isSuffix = false,
    bool? isError = false,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    Color? suffixIconColor = AppColors.lightBlack,
    ValueChanged<String>? onChanged,
    bool isObscure = false,
    VoidCallback? onTap,
    bool? isReadable = false,
    VoidCallback? suffixCallBack,
    bool? isClearSuffix = false,
    bool? isAutoCorrection = true,
    double? width,
    Color? filledColor,
    Color? borderColor,
  })  : _controller = controller,
        _hint = hint,
        _errorText = errorText,
        _suffixIcon = suffixIcon,
        _labelText = labelText,
        _isObscure = isObscure,
        _isSuffix = isSuffix,
        _isError = isError,
        _textInputType = textInputType,
        _textInputAction = textInputAction,
        _suffixIconColor = suffixIconColor,
        _onChanged = onChanged,
        _onTap = onTap,
        _isReadable = isReadable,
        _suffixCallBack = suffixCallBack,
        _isClearSuffix = isClearSuffix,
        _isAutoCorrection = isAutoCorrection,
        _width = width,
        _filledColor = filledColor,
        _borderColor = borderColor;

  final TextEditingController? _controller;
  final String? _hint;
  final String? _errorText;
  final String? _suffixIcon;
  final String? _labelText;
  final bool? _isSuffix;
  final bool? _isError;
  final TextInputType? _textInputType;
  final TextInputAction? _textInputAction;
  final Color? _suffixIconColor;
  final ValueChanged<String>? _onChanged;
  final bool? _isObscure;
  final VoidCallback? _onTap;
  final bool? _isReadable;
  final VoidCallback? _suffixCallBack;
  final bool? _isClearSuffix;
  final bool? _isAutoCorrection;
  final double? _width;
  final Color? _filledColor;
  final Color? _borderColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width ?? Get.width,
      child: TextField(
        cursorColor: AppColors.black,
        readOnly: _isReadable!,
        autocorrect: _isAutoCorrection!,
        controller: _controller,
        onTap: _onTap,
        onChanged: _onChanged,
        keyboardType: _textInputType,
        textInputAction: _textInputAction,
        obscureText: _isObscure!,
        decoration: InputDecoration(
          filled: true,
          fillColor: _filledColor ?? Colors.white,
          labelStyle: TextStyle(
            color:
                _isError! == true ? AppColors.errorTextColor : AppColors.black,
            fontSize: FontSize.fontSizeS13,
            fontFamily:
                _isError! == true ? Fonts.petitaBold : Fonts.petitaMedium,
          ),
          hintText: _hint,
          labelText: _labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                color: _borderColor ?? Colors.transparent,
              ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: _isError! == true
                  ? AppColors.errorTextColor
                  : _borderColor ?? Colors.transparent,
            ),
          ),
          focusedErrorBorder: _isError! == true
              ? const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: AppColors.errorTextColor, width: 2),
                )
              : null,
          errorText: _isError! == true ? _errorText : null,
          suffixIconColor: _suffixIconColor,
          suffixIcon: _isSuffix! && _isClearSuffix!
              ? GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _suffixCallBack,
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.errorTextColor,
                  ),
                )
              : _isSuffix!
                  ? GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: _suffixCallBack,
                      child: customSvgAsset(
                        svgImage: _suffixIcon,
                        height: 5,
                        width: 5,
                        fit: BoxFit.scaleDown,
                        color: _suffixIconColor,
                      ),
                    )
                  : null,
        ),
        style: AppStyles.textStyleExtraLarge.copyWith(
          color: AppColors.lightBlack,
          fontSize: FontSize.fontSizeS13,
          fontFamily: Fonts.petitaMedium,
        ),
      ),
    );
  }

  Widget customSvgAsset({
    String? svgImage,
    double? height,
    double? width,
    BoxFit? fit,
    Color? color,
  }) {
    return SvgPicture.asset(
      svgImage!,
      width: width,
      height: height,
      fit: fit!,
      color: color,
    );
  }
}
