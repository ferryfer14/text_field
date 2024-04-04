library text_field;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remove_emoji_input_formatter/remove_emoji_input_formatter.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {Key? key,
      this.colorLabel,
      this.countryCode,
      this.colorIconPassword,
      this.colorCountry,
      this.colorHint,
      this.colorError,
      this.colorBorder,
      this.colorFocus,
      this.colorInput,
      this.colorInfo,
      this.cursorColor,
      this.borderRadius,
      this.hint,
      this.label,
      this.initialValue,
      this.info,
      this.fontFamily,
      this.fontSizeLabel,
      this.fontSizeInput,
      this.fontSizeInfo,
      this.validator,
      this.onChanged,
      this.onTap,
      this.onFieldSubmitted,
      this.contentPadding,
      this.onTapOutside,
      this.textController,
      this.focusNode,
      this.suffixIcon,
      this.prefixIcon,
      this.inputFormatters,
      this.inputFillColor = Colors.white,
      this.labelFontWeight = FontWeight.w600,
      this.inputType = TextInputType.text,
      this.maxLines = 1,
      this.isFilled = false,
      this.isPhone = false,
      this.isNumber = false,
      this.isPassword = false,
      this.isFocus = false,
      this.isRequired = false,
      this.readOnly = false,
      this.withInfo = false,
      this.disabledBorder = false,
      this.smallPadding = false,
      this.unlimitedLines = false,
      this.showLength = false,
      this.withoutEmoji = true,
      this.marginLabel = 4,
      this.maxLength = 255,
      this.textDecorationValue = TextDecoration.none,
      this.floatingLabelBehavior = FloatingLabelBehavior.auto,
      this.labelOutline = false})
      : super(key: key);

  final Color inputFillColor;
  final Color? colorLabel;
  final Color? colorCountry;
  final Color? colorIconPassword;
  final Color? colorHint;
  final Color? colorError;
  final Color? colorBorder;
  final Color? colorFocus;
  final Color? colorInput;
  final Color? colorInfo;
  final Color? cursorColor;
  final String? countryCode;
  final String? hint;
  final String? label;
  final String? initialValue;
  final String? info;
  final String? fontFamily;
  final double? fontSizeLabel, fontSizeInput, fontSizeInfo;
  final BorderRadius? borderRadius;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(PointerDownEvent)? onTapOutside;
  final VoidCallback? onTap;
  final TextInputType inputType;
  final bool isPhone;
  final bool isNumber;
  final bool isPassword;
  final bool isFocus;
  final bool isRequired;
  final bool showLength;
  final int maxLines;
  final bool unlimitedLines;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool labelOutline;
  final bool isFilled;
  final bool readOnly;
  final bool withInfo;
  final bool withoutEmoji;
  final double marginLabel;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final FontWeight labelFontWeight;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextDecoration textDecorationValue;
  final bool disabledBorder;
  final bool smallPadding;
  final int maxLength;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  void initState() {
    if (widget.withoutEmoji) {
      widget.inputFormatters?.add(RemoveEmojiInputFormatter());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelOutline
            ? const SizedBox()
            : Row(children: [
                Text(widget.label ?? '',
                    style: TextStyle(
                        color: widget.colorLabel ?? Colors.black,
                        fontSize: widget.fontSizeLabel ?? 10,
                        fontFamily: widget.fontFamily,
                        fontWeight: widget.labelFontWeight)),
                const SizedBox(width: 4),
                widget.isRequired
                    ? Text("*",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: widget.fontSizeLabel ?? 10,
                            fontFamily: widget.fontFamily,
                            fontWeight: widget.labelFontWeight))
                    : const SizedBox()
              ]),
        SizedBox(
          height: widget.marginLabel,
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: widget.textController,
                focusNode: widget.focusNode,
                cursorColor: widget.cursorColor ?? Colors.lightBlue,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                autofocus: widget.isFocus,
                onChanged: widget.onChanged,
                onTapOutside: widget.onTapOutside,
                onTap: widget.onTap,
                initialValue: widget.initialValue,
                maxLines: widget.unlimitedLines ? null : widget.maxLines,
                maxLength: widget.showLength ? widget.maxLength : null,
                readOnly: widget.readOnly,
                onFieldSubmitted: widget.onFieldSubmitted,
                style: TextStyle(
                    color: widget.colorInput ?? Colors.black,
                    fontSize: widget.fontSizeInput ?? 12,
                    fontFamily: widget.fontFamily,
                    decoration: widget.textDecorationValue,
                    fontWeight: FontWeight.w500),
                obscureText: widget.isPassword ? isHide : false,
                keyboardType:
                    widget.isNumber ? TextInputType.phone : widget.inputType,
                decoration: InputDecoration(
                  isDense: widget.smallPadding,
                  filled: widget.isFilled,
                  fillColor: widget.inputFillColor,
                  focusColor: widget.inputFillColor,
                  labelStyle: widget.labelOutline
                      ? TextStyle(
                          color: widget.colorLabel ?? Colors.black,
                          fontSize: widget.fontSizeLabel ?? 10,
                          fontFamily: widget.fontFamily,
                          fontWeight: widget.labelFontWeight)
                      : null,
                  labelText: widget.labelOutline ? widget.label : null,
                  floatingLabelBehavior:
                      widget.labelOutline ? widget.floatingLabelBehavior : null,
                  prefixIcon: widget.isPhone
                      ? Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 4),
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(widget.countryCode ?? '+62',
                              style: TextStyle(
                                  color: widget.colorCountry ?? Colors.grey,
                                  fontFamily: widget.fontFamily,
                                  fontSize: widget.fontSizeInput ?? 12)),
                        )
                      : widget.prefixIcon,
                  suffixIcon: widget.isPassword
                      ? GestureDetector(
                          onTap: () {
                            isHide = !isHide;
                            setState(() {});
                          },
                          child: Icon(
                            isHide
                                ? Icons.visibility_off
                                : Icons.remove_red_eye_outlined,
                            size: 20,
                            color: widget.colorIconPassword ??
                                Colors.grey.shade400,
                          ),
                        )
                      : widget.suffixIcon,
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: widget.colorHint ?? Colors.grey,
                      fontFamily: widget.fontFamily,
                      fontSize: widget.fontSizeInput ?? 12),
                  errorStyle: TextStyle(
                      color: widget.colorError ?? Colors.red,
                      fontFamily: widget.fontFamily,
                      fontSize: widget.fontSizeInput ?? 12),
                  focusedBorder: widget.disabledBorder
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: widget.colorFocus ?? Colors.black45),
                        ),
                  enabledBorder: widget.disabledBorder
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: widget.colorBorder ?? Colors.black45),
                        ),
                  border: widget.disabledBorder
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: widget.colorBorder ?? Colors.black45),
                        ),
                  errorBorder: widget.disabledBorder
                      ? InputBorder.none
                      : OutlineInputBorder(
                          borderRadius:
                              widget.borderRadius ?? BorderRadius.circular(8),
                          borderSide: BorderSide(
                              color: widget.colorError ?? Colors.red),
                        ),
                ),
                inputFormatters: widget.inputFormatters,
              ),
            ),
          ],
        ),
        widget.withInfo
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SizedBox(
                  height: 4,
                ),
                Text(widget.info ?? '',
                    style: TextStyle(
                        color: widget.colorInfo ?? Colors.black,
                        fontSize: widget.fontSizeInfo ?? 10,
                        fontFamily: widget.fontFamily,
                        fontWeight: widget.labelFontWeight)),
              ])
            : const SizedBox()
      ],
    );
  }
}
