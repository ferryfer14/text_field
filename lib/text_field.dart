library text_field;

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
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
    this.fontSizeLabel,
    this.fontSizeInput,
    this.fontSizeInfo,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.contentPadding,
    this.textController,
    this.focusNode,
    this.isPhone = false,
    this.isNumber = false,
    this.isPassword = false,
    this.isFocus = false,
    this.labelOutline = false
  }) : super(key: key);

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
  final double? fontSizeLabel, fontSizeInput, fontSizeInfo;
  final BorderRadius? borderRadius;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final bool isPhone;
  final bool isNumber;
  final bool isPassword;
  final bool isFocus;
  final EdgeInsets? contentPadding;
  final FocusNode? focusNode;
  final TextEditingController? textController;
  final bool labelOutline;

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
            : Text(widget.label ?? '',
            style: TextStyle(
                color: widget.colorLabel ?? Colors.black,
                fontSize: widget.fontSizeLabel ?? 10,
                fontWeight: FontWeight.w600)),
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
                onFieldSubmitted: widget.onFieldSubmitted,
                style: TextStyle(
                    color: widget.colorInput ?? Colors.black,
                    fontSize: widget.fontSizeInput ?? 12,
                    fontWeight: FontWeight.w500),
                obscureText: widget.isPassword ? isHide : false,
                keyboardType: widget.isNumber ? TextInputType.phone : null,
                decoration: InputDecoration(
                  labelText: widget.labelOutline ? widget.label : null,
                  floatingLabelBehavior: widget.labelOutline ? FloatingLabelBehavior.always : null,
                  prefixIcon: widget.isPhone
                      ? Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 4),
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text(widget.countryCode ?? '+62',
                              style: TextStyle(
                                  color: widget.colorCountry ?? Colors.grey,
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
                      : null,
                  contentPadding: widget.contentPadding ??
                      const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                      color: widget.colorHint ?? Colors.grey,
                      fontSize: widget.fontSizeInput ?? 12),
                  errorStyle: TextStyle(
                      color: widget.colorError ?? Colors.red,
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
                fontWeight: FontWeight.w600)),
      ],
    );
  }
}
