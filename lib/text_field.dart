library text_field;
import 'package:flutter/material.dart';

class TextField extends StatefulWidget {
  const TextField({
    Key? key,
    this.colorLabel,
    this.countryCode,
    this.colorIconPassword,
    this.colorCountry,
    this.colorHint,
    this.colorError,
    this.colorBorder,
    this.colorInput,
    this.hint,
    this.label,
    this.validator,
    this.onChanged,
    this.isPhone = false,
    this.isNumber = false,
    this.isPassword = false,
  }) : super(key: key);

  final Color? colorLabel;
  final Color? colorCountry;
  final Color? colorIconPassword;
  final Color? colorHint;
  final Color? colorError;  
  final Color? colorBorder;
  final Color? colorInput;
  final String? countryCode;
  final String? hint;
  final String? label;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool isPhone;
  final bool isNumber;
  final bool isPassword;

  @override
  State<TextField> createState() => _TextFieldState();
}

class _TextFieldState extends State<TextField> {
  bool isHide = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label ?? '', style: TextStyle(color: widget.colorLabel ?? Colors.black, fontSize: 10,fontWeight: FontWeight.w600)),
        const SizedBox(height: 4,),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: widget.validator,
                onChanged: widget.onChanged,
                style: TextStyle(color: widget.colorInput ?? Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
                obscureText: widget.isPassword ? isHide : false,
                keyboardType: widget.isNumber ? TextInputType.phone : null,
                decoration: InputDecoration(
                  prefixIcon: widget.isPhone
                      ? Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(right: 4),
                          width: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: Text( widget.countryCode ?? '+62', style: TextStyle(color: widget.colorCountry ?? Colors.grey, fontSize: 12)),
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
                                : Icons.remove_red_eye,
                            size: 20,
                            color: widget.colorIconPassword ?? Colors.grey.shade400,
                          ),
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  hintText: widget.hint,
                  hintStyle: TextStyle(color: widget.colorHint ?? Colors.grey, fontSize: 12),
                  errorStyle: TextStyle(color: widget.colorError ?? Colors.red, fontSize: 12),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: widget.colorBorder ?? Colors.black45),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: widget.colorBorder ?? Colors.black45),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: widget.colorError ?? Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
