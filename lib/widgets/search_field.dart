import 'package:flutter/material.dart';

import '../core/constants.dart';

class searchField extends StatelessWidget {
  const searchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search note....',
        hintStyle: const TextStyle(fontSize: 14),
        prefixIcon: const Icon(
          Icons.search,
          size: 18,
        ),
        fillColor: white,
        filled: true,
        isDense: true,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primary)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: primary)),
      ),
    );
  }
}
