import 'package:flutter/material.dart';

class ViewModeSwitch extends StatefulWidget {
  const ViewModeSwitch({Key? key}) : super(key: key);

  @override
  State<ViewModeSwitch> createState() => _ViewModeSwitchState();
}

class _ViewModeSwitchState extends State<ViewModeSwitch> {
  int selectMode = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          _button(
            index: 0,
            icon: Icons.list_rounded,
            boxColor: selectMode == 0 ? Colors.indigoAccent : null,
            iconColor: selectMode == 0 ? Colors.white : null,
          ),
          _button(
            index: 1,
            icon: Icons.grid_view_outlined,
            boxColor: selectMode == 1 ? Colors.indigoAccent : null,
            iconColor: selectMode == 1 ? Colors.white : null,
          ),
        ],
      ),
    );
  }

  GestureDetector _button({
    required IconData icon,
    required int index,
    Color? boxColor,
    Color? iconColor,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (selectMode == index) return;

          selectMode = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: boxColor,
        ),
        child: Icon(
          icon,
          size: 20,
          color: iconColor ?? Colors.grey,
        ),
      ),
    );
  }
}
