import 'package:flutter/material.dart';
import 'package:shoplan/homePage/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
      bool isLoading = true;
  List images = [
    'assets/aa.png',
    'assets/bb.png',
    'assets/cc.png',
  
  ];
  List text1 = [
    "It's Shopping Time!",
    'Start Online Shopping',
    'Get Big Sale with Us',
   
  ];
  List text2 = [
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
    
  ];
  late final TabController controller;
  int _index = 0;
  @override
  void initState() {
    controller =
        TabController(vsync: this, length: images.length, initialIndex: _index);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding:
            const EdgeInsets.only(top: 0, left: 20, bottom: 0, right: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                   
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return HomePage();
                    }));
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    images[_index],
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text(
                  text1[_index],
                  style: TextStyle(
                    fontSize: 35,
                    color: const Color.fromARGB(255, 58, 50, 50),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10,),
               
                Text(
                  text2[_index],
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xffD9D9D9),
                  ),
                  textAlign: TextAlign.center,
                ),
              
                SizedBox(
                  height: 40,
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 20,
                  width: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: _index == index
                                ? Colors.black
                                : Color(0xffD9D9D9),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index++;
                      if (_index == images.length) {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                          return isLoading?HomePage():Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CircularProgressIndicator(),
                            ],
                          );
                        }));
                      }
                    });
                  },
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Color(0xff7B61FF),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.arrow_right_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
