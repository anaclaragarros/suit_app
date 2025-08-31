import 'package:flutter/material.dart';
import 'package:suit_app/utils/responsive_utils.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const SearchField({
    super.key,
    required this.controller,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: responsive.sp(16),
        color: Colors.black87,
      ),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: Colors.grey[400],
          fontSize: responsive.sp(16),
        ),
        prefixIcon: Icon(
          Icons.search,
          color: Colors.grey[400],
          size: responsive.sp(20),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black87, width: 1.5),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: responsive.wp(4),
          vertical: responsive.hp(1.8),
        ),
      ),
    );
  }
}