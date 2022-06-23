import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final bool isSelected;
  final String title;
  final EdgeInsets? padding;

  const GradientButton({
    Key? key,
    required this.isSelected,
    required this.title,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return categoryItem();
  }

  Widget categoryItem() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Center(
        child: Container(
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            gradient: isSelected ? selectedGradient() : unselectedGradient(),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  LinearGradient selectedGradient() {
    return LinearGradient(colors: [
      Color.lerp(Colors.blue.withOpacity(.2), Colors.blue, 0.2)!,
      Colors.blue,
      Colors.blue[800]!,
    ]);
  }

  LinearGradient unselectedGradient() {
    return LinearGradient(colors: [
      Color.lerp(Colors.blue.withOpacity(.1), Colors.lightBlue, 0.2)!,
      Colors.lightBlue.withOpacity(0.2),
      Colors.lightBlue.withOpacity(0.2),
    ]);
  }
}
