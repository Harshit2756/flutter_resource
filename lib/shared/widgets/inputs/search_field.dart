import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final String? hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final TextEditingController? controller;

  const SearchField({
    super.key,
    this.hint,
    this.onChanged,
    this.onClear,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint ?? 'Search',
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            controller?.clear();
            onClear?.call();
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
