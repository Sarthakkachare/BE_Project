import 'package:carousel_slider/carousel_slider.dart';
import 'Login_Page.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Map<String, dynamic>> imageList = [
    {"id": 1, "Image_path": "lib/assets/Starting_Images/Image1.png"},
    {"id": 2, "Image_path": "lib/assets/Starting_Images/istockphoto1.jpg"},
    {"id": 3, "Image_path": "lib/assets/Starting_Images/istockphoto-1152356154-612x612.jpg"},
    {"id": 4, "Image_path": "lib/assets/Starting_Images/istockphoto.jpg"},
  ];

  List<String> textList = [
    "College is not just about acquiring knowledge it's about discovering who you are and who you want to be.In college, you don't just earn a degree, you gain a lifetime of experiences, friendships, and opportunities.",
    "College education opens doors to endless possibilities and empowers you to shape your future.College is where dreams take flight and aspirations become reality.",
    "Embrace the journey of college education, it's a transformative experience that will leave an indelible mark on your life."
  ];

  final CarouselController carouselController = CarouselController();
  final PageController textController = PageController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              InkWell(
                onTap: () => print(currentIndex),
                child: CarouselSlider(
                  items: imageList.map(
                    (item) => Image.asset(
                      item['Image_path'],
                      width: double.infinity,
                      height: 400,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.contain,
                    ),
                  ).toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 1.1,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imageList.asMap().entries.map((entry) {
                    final index = entry.key;
                    return GestureDetector(
                      onTap: () => carouselController.animateToPage(index),
                      child: Container(
                        width: currentIndex == index ? 17 : 7,
                        height: 7.0,
                        margin: const EdgeInsets.symmetric(horizontal: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == index
                              ? Colors.red
                              : Colors.teal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 15.0),
            child: Text(
              "Learning With Fun", // Change this to your desired title
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          
          SizedBox(
            height: 100,
            child: PageView.builder(
              controller: textController,
              itemCount: textList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left:30.0,right: 30.0),
                  child: Center(
                    child: Text(
                      textList[index],
                      style:const  TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.only(bottom: 10,top:80),
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 9, 114, 158))),
              child: const Text("Get Started",
              style:TextStyle(
                color: Colors.white,
              ),),
            ),
          )
        ],
      ),
    );
  }
}
