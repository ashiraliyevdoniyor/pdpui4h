import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdpui4h/home_page/utils.dart';
import 'package:pdpui4h/home_page/home_page.dart';



class IntroPage extends StatefulWidget {
  static final String id = "intro_page";

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {

  PageController? _pageController;
  int currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
        initialPage: 0
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                  image: 'assets/images/image_1.png',
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent
              ),
              makePage(
                  reverse: true,
                  image: 'assets/images/image_2.png',
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent
              ),
              makePage(
                  image: 'assets/images/image_3.png',
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent
              ),

            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),// _buildIndicator(),
            ),
          ),



        ],
      ),
    );
  }

  Widget makePage({image, title, content, reverse = false}) {
    return Container(

      padding: EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 150),
          Expanded(child: Text(
            title, style: TextStyle(
              color: Colors.red,
              fontSize: 36,
              fontWeight: FontWeight.bold
          ),),),

          SizedBox(height: 20,),
          Expanded(
            flex: 2,
            child: Text(content, textAlign: TextAlign.center, style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                fontWeight: FontWeight.w400
            ),),),
          Expanded(
            flex: 5,
            child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
              SizedBox(height: 10,),
            ],
          ),),


          SizedBox(height: 10),
          Expanded(child: Container(
            //transformAlignment: Alignment.bottomRight,
            alignment: Alignment.bottomRight,
            child: _skip(_buildSkip()),
          ))

        ],
      ),
    );
  }

  Widget _skip(bool active) {
    return Container(

      child: active ?
      GestureDetector(
        onTap: (){
          Navigator.pushReplacementNamed(context, HomePage.id);
        },
        child: Text('Skip',style: TextStyle(color: Colors.redAccent,fontSize: 22)),
      )
          :
      Text('',style: TextStyle(color: Colors.black,fontSize: 24))

    );

  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(5)
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i<3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  bool _buildSkip() {
    bool sskip=false;
      if (currentIndex == 2) {
        sskip=true;
      } else {
        sskip=false;
      }
    return sskip;
  }

}