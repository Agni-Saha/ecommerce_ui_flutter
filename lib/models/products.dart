import 'package:flutter/material.dart';

class Products {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Products({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  });
}

List<Products> products = [
  Products(
    id: 1,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_1.png",
    color: const Color(0xFF3D82AE),
  ),
  Products(
    id: 2,
    title: "Belt Bag",
    price: 234,
    size: 8,
    description: dummyText,
    image: "assets/images/bag_2.png",
    color: const Color(0xFFD3A984),
  ),
  Products(
    id: 3,
    title: "Hang Top",
    price: 234,
    size: 10,
    description: dummyText,
    image: "assets/images/bag_3.png",
    color: const Color(0xFF989493),
  ),
  Products(
    id: 4,
    title: "Old Fashion",
    price: 234,
    size: 11,
    description: dummyText,
    image: "assets/images/bag_4.png",
    color: const Color(0xFFE6B398),
  ),
  Products(
    id: 5,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_5.png",
    color: const Color(0xFFFB7883),
  ),
  Products(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/images/bag_6.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean hendrerit diam at tortor ultrices pretium. In sollicitudin, velit a tempor ultricies, eros neque consequat justo, id aliquet elit nibh in dolor. Aenean et fermentum nisi.";
