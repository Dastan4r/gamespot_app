import 'package:flutter/material.dart';

class SearchFormWidget extends StatefulWidget {
  const SearchFormWidget({Key? key}) : super(key: key);

  @override
  _SearchFormWidgetState createState() => _SearchFormWidgetState();
}

class _SearchFormWidgetState extends State<SearchFormWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: TextFormField(
        controller: _controller,
        autofocus: false,
        decoration: InputDecoration(
          filled: true,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
          ),
          fillColor: const Color.fromRGBO(118, 118, 128, 1),
          hintText: 'Search',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.transparent,
              width: 0.0,
            ),
          ),
          hintStyle: const TextStyle(
            fontSize: 17,
            color: Color.fromRGBO(235, 235, 245, 1),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        cursorColor: Theme.of(context).textTheme.headline1!.color,
        style: TextStyle(
          color: Theme.of(context).textTheme.headline1!.color,
        ),
        keyboardType: TextInputType.text,
      ),
    );
  }
}
