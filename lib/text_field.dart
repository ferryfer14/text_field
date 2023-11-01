library text_field;

import 'package:flutter/material.dart';

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
      this.info,
      this.fontFamily,
      this.fontSizeLabel,
      this.fontSizeInput,
      this.fontSizeInfo,
      this.validator,
      this.onChanged,
      this.onFieldSubmitted,
      this.contentPadding,
      this.textController,
      this.focusNode,
      this.suffixIcon,
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
  final String? info;
  final String? fontFamily;
  final double? fontSizeLabel, fontSizeInput, fontSizeInfo;
  final BorderRadius? borderRadius;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType inputType;
  final bool isPhone;
  final bool isNumber;
  final bool isPassword;
  final bool isFocus;
  final bool isRequired;
  final int maxLines;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool labelOutline;
  final bool isFilled;
  final Widget? suffixIcon;
  final FontWeight labelFontWeight;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.labelOutline
            ? SizedBox()
            : Row(children: [
                Text(widget.label ?? '',
                    style: TextStyle(
                        color: widget.colorLabel ?? Colors.black,
                        fontSize: widget.fontSizeLabel ?? 10,
                        fontFamily: widget.fontFamily ?? null,
                        fontWeight: widget.labelFontWeight)),
                SizedBox(width: 4),
                widget.isRequired
                    ? Text("*",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: widget.fontSizeLabel ?? 10,
                            fontFamily: widget.fontFamily ?? null,
                            fontWeight: widget.labelFontWeight))
                    : const SizedBox()
              ]),
        const SizedBox(
          height: 4,
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
                maxLines: widget.maxLines,
                onFieldSubmitted: widget.onFieldSubmitted,
                style: TextStyle(
                    color: widget.colorInput ?? Colors.black,
                    fontSize: widget.fontSizeInput ?? 12,
                    fontFamily: widget.fontFamily ?? null,
                    fontWeight: FontWeight.w500),
                obscureText: widget.isPassword ? isHide : false,
                keyboardType:
                    widget.isNumber ? TextInputType.phone : widget.inputType,
                decoration: InputDecoration(
                  filled: widget.isFilled,
                  fillColor: widget.inputFillColor,
                  focusColor: widget.inputFillColor,
                  labelText: widget.labelOutline ? widget.label : null,
                  floatingLabelBehavior:
                      widget.labelOutline ? FloatingLabelBehavior.always : null,
                  prefixIcon: widget.isPhone
                      ? Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 4),
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(widget.countryCode ?? '+62',
                              style: TextStyle(
                                  color: widget.colorCountry ?? Colors.grey,
                                  fontFamily: widget.fontFamily ?? null,
                                  fontSize: widget.fontSizeInput ?? 12)),
                        )
                      : null,
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
                      : widget.suffixIcon ?? null,
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: widget.colorHint ?? Colors.grey,
                      fontFamily: widget.fontFamily ?? null,
                      fontSize: widget.fontSizeInput ?? 12),
                  errorStyle: TextStyle(
                      color: widget.colorError ?? Colors.red,
                      fontFamily: widget.fontFamily ?? null,
                      fontSize: widget.fontSizeInput ?? 12),
                  focusedBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: widget.colorFocus ?? Colors.black45),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: widget.colorBorder ?? Colors.black45),
                  ),
                  border: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: widget.colorBorder ?? Colors.black45),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius:
                        widget.borderRadius ?? BorderRadius.circular(8),
                    borderSide:
                        BorderSide(color: widget.colorError ?? Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 4,
        ),
        Text(widget.info ?? '',
            style: TextStyle(
                color: widget.colorInfo ?? Colors.black,
                fontSize: widget.fontSizeInfo ?? 10,
                fontFamily: widget.fontFamily ?? null,
                fontWeight: widget.labelFontWeight)),
      ],
    );
  }
}
