import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  final String message;

  EmptyStateWidget({required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: 60,
        child: Center(
          child: Text(
            message,
            maxLines: 2,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
