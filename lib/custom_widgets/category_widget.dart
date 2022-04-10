import 'package:flutter/material.dart';
import '../constant.dart';

class CategoryCardWidget extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final VoidCallback onTap;

  const CategoryCardWidget({
    Key? key,
    required this.mealName,
    required this.mealImage,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kMainYellow),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  mealImage,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              mealName,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }
}
