import 'package:flutter/material.dart';
import 'package:gramipasto_mobileapp/core/core.dart';

class AppBarSearchWidget extends PreferredSize {
  final Function(String)? onChanged;

  AppBarSearchWidget({required this.onChanged})
      : super(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.lightGrey),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BackButton(),
                  Container(
                    width: 250,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Pesquisa na lista',
                        border: InputBorder.none,
                      ),
                      onChanged: onChanged,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ),
        );
}
