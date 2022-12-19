import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';

class WelComePage extends StatelessWidget {
  const WelComePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(vertical: 70),
            child: Column(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    "Tic Tac Toe",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: "RubikMoonrocks"),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: size.width,
                    child: AvatarGlow(
                      endRadius: 200,
                      duration: const Duration(seconds: 2),
                      child: Material(
                        elevation: 10,
                        shape: CircleBorder(),
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          child: Image.asset(
                            'assets/images/tic.png',
                            color: Colors.white,
                            height: 100,
                          ),
                          radius: 100.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: size.width,
                    child: MaterialButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      child: const Text(
                        "Start Game",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            fontFamily: "RubikMoonrocks"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            right: 10,
            bottom: 10,
            child: Text(
              "By Gamal Ahmed",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RubikMoonrocks"),
            ),
          ),
        ],
      ),
    );
  }
}
