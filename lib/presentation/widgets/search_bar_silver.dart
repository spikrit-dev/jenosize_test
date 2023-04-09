import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBarSilver extends SliverAppBar {
  Function(String)? onChanged;
  SearchBarSilver({
    this.onChanged,
    super.key,
  }) : super(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          pinned: true,
          title: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(1.1, 1.1),
                    blurRadius: 5.0),
              ],
            ),
            child: CupertinoTextField(
              // controller: _filter,
              keyboardType: TextInputType.text,
              onChanged: onChanged,
              placeholder: 'ค้นหาร้านอาหาร',
              placeholderStyle: const TextStyle(
                color: Color(0xffC4C6CC),
                fontSize: 14.0,
              ),
              prefix: const Padding(
                padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
            ),
          ),
        );
}
