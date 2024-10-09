import 'package:flutter/material.dart';

class DatailsPage extends StatefulWidget {
  DatailsPage({super.key});

  @override
  State<DatailsPage> createState() => _DatailsPageState();
}

class _DatailsPageState extends State<DatailsPage> {
  List images = [
    'assets/3.jpg',
    'assets/4.jpg',
    'assets/5.jpg',
    'assets/6.jpg',
    'assets/4.jpg',
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
       
       backgroundColor: Colors.white,
        elevation: 0,
        leading: Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.bookmark_outline_sharp,
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 400,
              width: 400,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        children: [
                          Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.asset(
                                images[index],
                                width: 350,
                                height: 400,
                                fit: BoxFit.cover,
                              ),
                            ),
                           
                           
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          Positioned(
                            bottom: 45,
                            left: 280,
                            child: IconButton(
                              onPressed: () {
                                

                                setState(() {
                                  _index++;
                                  if (_index == images.length) {
                                    _index = 0;
                                  }
                                });
                              },
                              icon: Icon(
                                  color: Colors.white,
                                  size: 40,
                                  Icons.arrow_circle_right_outlined),
                            ),
                          ),
                          Positioned(
                            left: 40,
                            bottom: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: SizedBox(
                                height: 20,
                                width: 70,
                                child: ColoredBox(
                                  color: Colors.white,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: images.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0, top: 2, bottom: 2, right: 2),
                                        child: CircleAvatar(
                                          radius: 3,
                                          backgroundColor: _index == index
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20.0,top: 10 ),
              child: Text(
                "LIPSYLONDON",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ),
            const Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5),
              child: Text(
                "Sleevless Reffle",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
              child: Row(

                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(10),
                          
                          backgroundColor: Color.fromARGB(255, 106, 248, 108)),
                      onPressed: () {},
                      child: Text(
                        "Availiable in stock",
                        style: TextStyle(color: Colors.white),
                      )),
                  const Spacer(),
                  const Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 230, 207, 9),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text('4.6'),
                  ),
                  Text("(120 Review)")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 5,bottom: 10),
              child: Text(
                "Product Info",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              child: Text(
                "A cool gray cap in soft coduaoy Watch me. 'By buying cotton products from Lindex, you're supporting more responsibly...",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Center(
                          child: Text(
                        r"$120 Unit Price",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                    VerticalDivider(),
                    Expanded(
                      child: Center(
                          child: Text(
                        r"Buy now",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Color(0xff7B61FF),
                ),
                width: 400,
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
