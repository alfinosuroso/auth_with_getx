// ignore: file_names
import 'package:auth_with_getx/common/app_colors.dart';
import 'package:auth_with_getx/common/shared_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final bool? obsecure;
  final bool? readOnly;
  final VoidCallback? onTap;
  final Function? onTapImage;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator, onChanged;
  final bool? isMulti;
  final bool? autofocus;
  final bool? enabled;
  final bool? isNeedValidation;
  final String? errorText;
  final String? helperText;
  final Widget? suffix;
  final Widget? prefix;
  final String? hintText;
  final String? title;
  final String? subtitle;
  final String? currentValue;
  final String? assetImage;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? nextFocusNode;
  final FocusNode? focusNode;
  final bool? isDropDown;
  final bool? isDateForm;
  final bool? isTimeForm;
  final bool? isUploadImage;
  final bool? isCostForm;
  final bool? uploadFile;
  final bool? editFile;
  final bool? isTitle;
  final bool? isFlag;
  final bool alwaysValidate;
  final bool removeSpacing;
  final List<DropdownMenuItem<String>>? customDropdownItems;
  final String? customSelectedValue;
  final TextStyle? titleStyle;
  final Color? fillColor;
  final Function(String)? onFieldSubmitted;

  const CustomTextFormField(
      {this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.onTapImage,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.helperText,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.isNeedValidation = true,
      this.onEditingCompleted,
      this.onChanged,
      this.hintText,
      required this.title,
      this.subtitle,
      this.currentValue,
      this.assetImage = 'assets/images/ktp-sample.png',
      this.inputFormatters,
      // dua node ini nanti di-required
      this.nextFocusNode,
      this.focusNode,
      this.isDropDown = false,
      this.isDateForm = false,
      this.isTimeForm = false,
      this.isUploadImage = false,
      this.isCostForm = false,
      this.uploadFile = false,
      this.editFile = false,
      this.isTitle = true,
      this.isFlag = false,
      this.alwaysValidate = false,
      this.removeSpacing = false,
      this.customDropdownItems,
      this.customSelectedValue,
      this.titleStyle,
      this.fillColor,
      this.onFieldSubmitted,
      super.key});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title != null || widget.title == ""
            ? Text(widget.title!,
                style:
                    widget.titleStyle ?? Theme.of(context).textTheme.bodyMedium)
            : const SizedBox(height: 0),
        widget.title != null || widget.title == ""
            ? SizedBox(height: 1.h)
            : const SizedBox(height: 0),
        _buildRegularTextForm(context),
        widget.subtitle != null || widget.subtitle == ""
            ? Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Text(
                  widget.subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppColors.textInput,
                      ),
                ),
              )
            : const SizedBox(height: 0),
        widget.removeSpacing == true
            ? const SizedBox.shrink()
            : SizedBox(height: 2.h),
      ],
    );
  }

  Widget _buildRegularTextForm(context) {
    dynamic validator = widget.validator;
    widget.isNeedValidation == false
        ? validator = null
        : validator ??= SharedCode(context).emptyValidator;
    return TextFormField(
      textInputAction:
          widget.onFieldSubmitted == null ? TextInputAction.next : null,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: widget.enabled == true
          ? Theme.of(context).textTheme.bodyMedium
          : Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.black.withOpacity(0.2)),
      // onFieldSubmitted: (_) => widget.nextFocusNode?.requestFocus(),
      focusNode: widget.focusNode,
      onChanged: widget.onChanged,
      initialValue: widget.currentValue,
      onEditingComplete: widget.onEditingCompleted,
      autofocus: widget.autofocus!,
      minLines: widget.isMulti! ? 6 : 1,
      maxLines: widget.isMulti! ? null : 1,
      onTap: widget.onTap,
      enabled: widget.enabled,
      readOnly: widget.readOnly!,
      obscureText: widget.obsecure!,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      inputFormatters: widget.inputFormatters,
      // inputFormatters: [FilteringTextInputFormatter.allow(filterPattern)],
      decoration: InputDecoration(
        errorText: widget.errorText,
        prefixIcon: widget.prefix,
        suffixIcon: widget.suffix,
        hintText: widget.hintText,
        helperText: widget.helperText,
        fillColor: widget.fillColor,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: AppColors.textInput),
        contentPadding:
            EdgeInsets.symmetric(vertical: 10.sp, horizontal: 14.sp),
      ),
      validator: widget.validator ?? validator,
      autovalidateMode: widget.alwaysValidate
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
    );
  }
}
