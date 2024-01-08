import 'package:damproject/mesumes.dart';
import 'package:damproject/screens/details.dart';
import 'package:damproject/screens/wlcome_page.dart';
import 'package:damproject/utilities/colors.dart';
import 'package:flutter/material.dart';
import '../cafesandrestaurent.dart';
import '../historical_sites.dart';
import '../model/place_model.dart';
import '../category_card.dart';
import '../other_places.dart';
import '../recommanded.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      bottomNavigationBar: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                size: 40,
                color: Primaryclr,
              ),
              Icon(
                Icons.calendar_month,
                size: 40,
              ),
              Icon(
                Icons.bookmark,
                size: 40,
              ),
              Icon(
                Icons.comment,
                size: 40,
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage('assets/user.webp'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  RichText(
                      text: const TextSpan(
                          text: "Hello",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 18,
                          ),
                          children: [
                        TextSpan(
                            text: " ,Aissa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                      ]))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Explore new destenations',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(100),
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(100)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Search your destenation',
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 22,
                          backgroundColor: Primaryclr,
                          child: Icon(
                            Icons.sort_by_alpha_sharp,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //category
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    'Category',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 55,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                      children: [
                        Category(
                          image: 'assets/tipaza.jpeg',
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisitPlacesScreen();
                            }));
                          },
                          title: "Museums",
                        ),
                        Category(
                          image: 'assets/constantine.jpeg',
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisitPlacesScreen1();
                            }));
                          },
                          title: "Cafes and restaurants",
                        ),
                        Category(
                          image: 'assets/jmila.jpeg',
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisitPlacesScreen2();
                            }));
                          },
                          title: "Historical Sites",
                        ),
                        Category(
                          image: 'assets/tizi.jpeg',
                          press: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return VisitPlacesScreen3();
                            }));
                          },
                          title: "Other Places",
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //recomanded
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    'Recomanded',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 280,
                child: ListView.builder(
                  itemCount: places.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Row(
                        children: [
                          RecomandedCard(
                            placeInfo: places[index],
                            press: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Details(placeInfo: places[index]),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
