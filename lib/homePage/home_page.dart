
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoplan/detailsPage/datails_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List images = [
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/4.jpg',
  ];

  List items = ['Boys', 'Girls', 'Womans', 'Mans', 'Kings'];
  int _index = 0;
  int select = 0;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xffffff),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "   Shoplan",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Icon(Icons.message),
                SizedBox(
                  width: 25,
                ),
                Icon(Icons.notifications),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30,),
            Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _index++;
                      if (_index == images.length) {
                        _index = 0;
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DatailsPage();
                        }));
                      }
                    });
                  },
                  child: Image.asset(
                    images[_index],
                    height: 230,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 100,
                  child: Container(
                    height: 100,
                    width: 20,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: CircleAvatar(
                            backgroundColor: _index == index
                                ? Colors.black
                                : const Color(0xffD9D9D9),
                            radius: 3,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 40,
                  child: Container(
                    width: 250,
                    child: Text(
                      "New Items With Free Shopping",
                      style:GoogleFonts.pacifico(fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                          
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Shop",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 70,
                        height: 2,
                        color: const Color.fromARGB(255, 172, 162, 162),
                      ),
                      const Text(
                        "now           ",
                        style: TextStyle(
                           fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35,top: 25, bottom: 25),
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 20,
                 fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Container(
                height: 40,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          select++;
                          if (select == items.length) {
                            select = 0;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: select == index
                                ? Colors.blue[200]
                                : Colors.transparent,
                            border: Border.all(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              index == 0
                                  ? const Text("All Categories")
                                  : Row(
                                      children: [
                                        const Icon(Icons.person),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text("${items[index]}")
                                      ],
                                    )
                            ],
                          ),
                          height: 40,
                          width: 140,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 35, top: 20,bottom: 20),
              child: Text(
                "Popular Products",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Container(
                height: 250,
                padding: const EdgeInsets.all(2),
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300)),
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image(
                                    width: 150, 
                                    height: 130,
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                    
                                    images[index]),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    width: 65,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffEA5D5D),
                                        borderRadius:
                                            BorderRadius.circular(7)),
                                    child: const Center(
                                      child: Text(
                                        "24% Off",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "LIPSY LONDON",
                              style: const TextStyle(
                                // fontSize: 15,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                            ),
                           
                            const Text(
                              "Montain Warehouse..",
                              style: TextStyle(
                                  fontSize: 17, color: Colors.black,fontWeight: FontWeight.bold),
                            ),
                           const SizedBox(height: 5,),
                            const Row(
                              children: [
                                Text(
                                  r"$81.21",
                                  style: TextStyle(
                                    color: Color(0xff8BD0E6),
                                  ),
                                ),
                               SizedBox(width: 10,),
                                Text(
                                  r"$543.23",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough),
                                ),
                              ],
                            )
                          ],
                        ),
                        height: 220,
                        width: 140,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavIndex,
        selectedItemColor: Colors.blueGrey,
        backgroundColor: Colors.yellow,
        selectedLabelStyle: TextStyle(color: Colors.blue),
        items: [
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
                size: 24.0,
              ),
              label: 'Home'),
                const BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 24.0,
              ),
              label: 'Search'),
         
          const BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
                size: 24.0,
              ),
              label: 'Profile'),
               const BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
              size: 24.0,
            ),
            label: 'Settings',
          ),
        
        
             
        ],
        onTap: (value) {
          setState(() {
            _bottomNavIndex = value;
          });
        },
      ),
    );
  }
}

int _bottomNavIndex = 0;
//  floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
     
     
//       bottomNavigationBar: AnimatedBottomNavigationBar(
//         icons: [
//           Icons.home,
//           Icons.search,
//           Icons.person,
//           Icons.settings,
//         ],
//         activeIndex: _bottomNavIndex,
//         gapLocation: GapLocation.center,
//         notchSmoothness: NotchSmoothness.softEdge,
//         onTap: (index) => setState(() => _bottomNavIndex = index),
//         //other params
//       ),