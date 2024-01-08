import 'package:flutter/material.dart';

class PlaceInfo {
  final String location, image, name, desc;
  PlaceInfo({
    required this.desc,
    required this.name,
    required this.image,
    required this.location,
  });
}

List places = [
  PlaceInfo(
    image: 'assets/hamma.jpeg',
    location: 'Alger',
    name: 'Hamma',
    desc:
        "This 590 foot high fort spread across 692 acres is the largest fort in India and a World Heritage Sit.",
  ),
  PlaceInfo(
    image: 'assets/oran.jpeg',
    location: 'Oran',
    name: "Oran Overview",
    desc:
        "Cinque Terre literally means Five Lands, and consists of 5 villages located across the rugged hillside",
  ),
  PlaceInfo(
    image: 'assets/bejaia.jpeg',
    location: 'Bejaia',
    name: "Bejaia Mountain",
    desc:
        "Cinque Terre literally means Five Lands, and consists of 5 villages located across the rugged hillside",
  ),
  PlaceInfo(
    image: 'assets/jmila.jpeg',
    location: 'Setif',
    name: "Jmila",
    desc:
        "Kyoto Terre literally means Five Lands, and consists of 5 villages located across the rugged hillside",
  ),
];
