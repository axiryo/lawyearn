import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onSearchChanged;
  final String hintText;

  const SearchTextField({
    super.key,
    required this.onSearchChanged,
    this.hintText = 'Search...',
  });

  @override
  SearchTextFieldState createState() => SearchTextFieldState();
}

class SearchTextFieldState extends State<SearchTextField> {
  TextEditingController searchController = TextEditingController();
  Timer? _debounceTimer;

  @override
  void dispose() {
    _debounceTimer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      widget.onSearchChanged(value);
      setState(() {});
    });
  }

  void _clearSearch() {
    searchController.clear();
    widget.onSearchChanged('');
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: EdgeInsets.all(12.sp),
          child: SvgPicture.asset(
            'assets/images/search/search_icon.svg',
          ),
        ),
        suffixIcon: searchController.text.isNotEmpty
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  size: 16.sp,
                ),
                onPressed: _clearSearch,
              )
            : null,
        border: InputBorder.none,
      ),
      onChanged: _onSearchChanged,
    );
  }
}
