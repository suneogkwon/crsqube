import 'package:flutter/material.dart';

class TablePagination extends StatelessWidget {
  const TablePagination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          child: Icon(
            Icons.chevron_left_rounded,
            size: 35,
            color: Colors.grey.shade400,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? 30
                    : 50,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(100),
          ),
          child: RichText(
            text: const TextSpan(
              children: [
                TextSpan(
                  text: '01',
                  style: TextStyle(
                    color: Colors.indigoAccent,
                  ),
                ),
                TextSpan(text: '/'),
                TextSpan(text: '01'),
              ],
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          child: Icon(
            Icons.chevron_right_rounded,
            size: 35,
            color: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
