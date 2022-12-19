import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int numberShow = 0;
  List<String> displayExOh = ["", "", "", "", "", "", "", "", ""];
  bool isTurn = true;
  int pointA = 0;
  int pointB = 0;
  int fillbox = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: -10,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Player X : ${pointA.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontFamily: "RubikMoonrocks"),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Text(
                "Player O : ${pointB.toString()}",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontFamily: "RubikMoonrocks"),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.6),
            itemBuilder: (BuildContext context, index) => InkWell(
                  onTap: () {
                    playFunc(index);
                  },
                  child: Container(
                    decoration: index == 0 ||
                            index == 2 ||
                            index == 6 ||
                            index == 8
                        ? const BoxDecoration(border: Border())
                        : BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Center(
                      child: Text(
                        displayExOh[index],
                        // index.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: "RubikMoonrocks"),
                      ),
                    ),
                  ),
                )),
      ),
    );
  }

  void playFunc(int index) {
    setState(() {
      // displayExOh[index] = "";
      if (isTurn && displayExOh[index] == "") {
        displayExOh[index] = "O";
        fillbox += 1;
      } else if (!isTurn && displayExOh[index] == "") {
        displayExOh[index] = "X";
        fillbox += 1;
      }
      isTurn = !isTurn;
      checkingWinner(index);
    });
    // whoWin(index);
  }

  void checkingWinner(int index) {
    //check in first row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != "") {
      showDilogM(index);
    }
    //check in seconde row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != "") {
      showDilogM(index);
    }
    //check in third row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != "") {
      showDilogM(index);
    }
    //check in first column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != "") {
      showDilogM(index);
    }
    //check in seconde column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != "") {
      showDilogM(index);
    }
    //check in third column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != "") {
      showDilogM(index);
    }
    //check line
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != "") {
      showDilogM(index);
    }
    //check line verse
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != "") {
      showDilogM(index);
    } else if (fillbox == 9) {
      displayExOh = ["", "", "", "", "", "", "", "", ""];
    }
  }

  void test(int index) {
    //check row

    for (var i = 0; i < 3; i++) {
      if (displayExOh[0] == displayExOh[1] &&
          displayExOh[0] == displayExOh[2] &&
          displayExOh[0] != "") {
        showDilogM(index);
      }
      //check in seconde row
      if (displayExOh[3] == displayExOh[4] &&
          displayExOh[3] == displayExOh[5] &&
          displayExOh[3] != "") {
        showDilogM(index);
      }
      //check in third row
      if (displayExOh[6] == displayExOh[7] &&
          displayExOh[6] == displayExOh[8] &&
          displayExOh[6] != "") {
        showDilogM(index);
      }
    }
  }

  void showDilogM(int index) {
    print("He is ${displayExOh[index]}");
    setState(() {
      if (displayExOh[index] == "X") {
        pointA++;
      } else {
        pointB++;
      }
      fillbox = 0;
    });
    displayExOh = ["", "", "", "", "", "", "", "", ""];
  }
}
