import 'package:flutter/material.dart';

class ExpenseIcon extends StatelessWidget {
  final Color color;
  final IconData icon;
  final bool isHighlighted;
  final Function func;

  const ExpenseIcon({
    Key? key,
    required this.color,
    required this.icon,
    required this.isHighlighted,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          this.func();
        },
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          height: MediaQuery.of(context).size.width / 5 - 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            color: (isHighlighted) ? Colors.white : Colors.transparent,
          ),
          child: Icon(this.icon,
              color: (isHighlighted) ? this.color : Colors.white),
        ),
      ),
    );
  }
}
