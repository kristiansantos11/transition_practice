import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:transition_practice/animation/home_bg_animation.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{
  // TickerProviderStateMixin is required for animation controller
  // Animation for Transition
  AnimationController animationController;
  
  PageController pageController; //Moving stuff on the page

  // ANIMATION
  Animation<double> backgroundAnimation;

  //ANIMATION CONTROLLER
  AnimationController _backgroundController;

  @override
  void initState(){
    super.initState();

    pageController = PageController();

    animationController = AnimationController(
      duration: Duration(milliseconds: 750),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

  }

  @override
  void dispose(){
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            
            BackgroundStagger(
              controller: _backgroundController.view
            ),

            /*Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)],
                )
              ),
            ),
            */

            SafeArea(
              child: Center(
                child: Text("Hello World.",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                    fontSize: MediaQuery.of(context).size.width / 10,
                  ),
                )
              )
            ),
          ]
        )
      );
  }
}
