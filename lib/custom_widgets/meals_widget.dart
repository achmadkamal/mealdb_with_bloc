import 'package:flutter/material.dart';
import '../constant.dart';

class MealsCardWidget extends StatelessWidget {
  final String mealName;
  final String mealImage;
  final VoidCallback onTap;

  const MealsCardWidget({
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
          image: DecorationImage(
            image: NetworkImage(mealImage),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [
                kMainBrown.withOpacity(
                  1,
                ),
                kLightBrown.withOpacity(0)
              ],
              begin: Alignment.bottomCenter,
              end: const Alignment(0, 0.1),
            ),
          ),
          padding: const EdgeInsets.all(10),
          child: Align(
            alignment: const Alignment(-1, 1),
            child: Text(
              mealName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: kLightYellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
