import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? error;
  final bool obscureText;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final int? maxLength;
  final bool enabled;

  const CustomTextField({
    super.key,
    this.label,
    this.hint,
    this.error,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.suffixIcon,
    this.textInputAction,
    this.maxLines = 1,
    this.maxLength,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        errorText: error,
        suffixIcon: suffixIcon,
        border: const OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor.withValues(alpha: 0.5),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
      onChanged: onChanged,
      textInputAction: textInputAction,
      maxLines: maxLines,
      maxLength: maxLength,
      enabled: enabled,
    );
  }
}
