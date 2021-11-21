import 'package:flutter/material.dart';
import 'package:the_ultimate_todo/presentation/widgets/loginrectangle.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF2D2F41),

      body: Stack(
        children: [
          Container(
            height: 320,
            width: 420,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Ellipse 2.png'))),
          ),
          Positioned(
            child: Column(
              children: [
                Container(
                  child: LoginRectangle(),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          // Container(
          //   child: Container(
          //     child: LoginButton(),
          //   ),
          // )
        ],
      ),
      // body: Container(
      //   child: Stack(
      //     fit: StackFit.passthrough,
      //     children: [
      //       LoginRectangle(),
      //       Container(

      // height: 270,
      // decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/Ellipse 1.png')))
      //),
      // Container(
      //   height: 515,
      //   decoration: const BoxDecoration(
      //     image: DecorationImage(
      //         image: AssetImage('assets/images/Rectangle 1.png')),
      //   ),
      // Container(
      //   child: Align(
      //     alignment: Alignment.bottomRight,
      //     heightFactor: 0.75,
      //     widthFactor: 0.75,
      //   ),
      //   decoration: BoxDecoration(
      //     shape: BoxShape.rectangle,
      //     border: Border.all(width: 5.0, color: Colors.black),
      //   ),
      // ),
      // LoginRectangle(),
      // // flex: 1,
      // Column(
      //   children: [
      //     Container(
      //       height: 52,
      //       margin: const EdgeInsets.all(55.0),
      //       decoration: const BoxDecoration(
      //         image: DecorationImage(
      //             alignment: Alignment.topLeft,
      //             image: AssetImage('assets/images/Component 1.png')),
      //       ),
      //       child: Row(
      //         children: [
      //           Spacer(),
      //           Container(
      //             // height: 52,
      //             margin: const EdgeInsets.all(18.0),

      //             child: Text(
      //               "SIGN UP",
      //               style: TextStyle(
      //                   fontSize: 16, fontWeight: FontWeight.w400),
      //             ),

      //             // width: 278,
      //           )
      //         ],
      //       ),
      //       // child: Container(
      //       //   margin: const EdgeInsets.all(55.0),
      //       //   child: Text("SIGN UP",
      //       //       style: TextStyle(
      //       //           fontSize: 21,
      //       //           color: Colors.black,
      //       //           fontWeight: FontWeight.w900)),
      //       // ),
      //       // alignment: Alignment.topLeft,
      //     ),
      //   ],
      // ),
      //     ],
      //   ),
      // ),
    );
  }
}
