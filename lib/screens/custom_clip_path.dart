import 'package:flutter/material.dart';
import 'package:petpal/screens/inicialization_screen.dart';
import '../widgets/custom_path.dart';

class CustomClipPathWidget extends StatelessWidget {
  const CustomClipPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Clip path container with image and text
        ClipPath(
          clipper: CustomPath(),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(253, 197, 126, 1),
                  Color.fromRGBO(249, 235, 162, 0.27),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 200,
                  width: 250,
                  height: 250,
                  child: Image.asset(
                    'assets/images/smile 1.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 60,
                  left: 185,
                  child: Image.asset(
                    'assets/images/paws.png',
                    width: 65,
                    height: 65,
                    fit: BoxFit.contain,
                  ),
                ),
                const Positioned(
                  top: 90,
                  left: 30,
                  child: Text(
                    'PetPal Health',
                    style: TextStyle(
                      color: Color.fromRGBO(36, 45, 104, 1),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Comic Sans MS',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Additional text and button outside the clip path
          Positioned(
                left: 96,
                top: 713,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const InitializePet(taskList: [], categories: [],))
                    );
                  },
                  style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  backgroundColor: const Color(0xFFFFC363),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                  ),   
              ),
           
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Meow Ahead',
                  style: TextStyle(
                    color: Color(0xFF242D68),
                    fontSize: 21,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          
        ),
        const Positioned(
          bottom: 220,
          left: 70,
          child: Text(
            'For Every Pet Health Story',
            style: TextStyle(
              color: Color.fromRGBO(36, 45, 104, 1),
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
        ),
        const Positioned(
          bottom: 180,
          left: 33,
          child: Text(
            'Where pet health meets loving care. \nTrack, nurture, and cherish your furry friends journey.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
      ],
    );
  }
}


