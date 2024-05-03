import 'package:flutter/material.dart';
import 'package:petpal/models/pet.dart';

class PetDetails extends StatelessWidget {
  final Pet pet;

  const PetDetails({super.key, required this.pet});

  final textStyle = const TextStyle(
    color: Color(0xFF242D68),
    fontSize: 17,
    fontFamily: 'Poppins-Light',
    fontStyle: FontStyle.normal,
    // fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 7,
            offset: Offset(3, 7),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 27, top: 23),
            child: Text(
              '${pet.name} the ${pet.type}',
              style: const TextStyle(
                color: Color(0xFF242D68),
                fontSize: 20,
                fontFamily: 'Comic Sans MS',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 25),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet.sex,
                  style: textStyle,
                ),
                const Spacer(),
                Text(
                  '${pet.weight} kg',
                  style: textStyle,
                ),
                const Spacer(),
                Text(
                  '${pet.age} years',
                  style: textStyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
