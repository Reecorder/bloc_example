import 'package:flutter_bloc_example/model/bike.dart';

class BikeData {
  static List<Map<String, dynamic>> bikes = [
    {
      "id": 1,
      "name": "Mountain Explorer",
      "description":
          "A durable mountain bike designed for rugged terrain and outdoor adventures.",
      "price": 1200.99,
      "image_url":
          "https://5.imimg.com/data5/SELLER/Default/2023/10/356050774/FC/FK/YG/184835388/newest-8-0-talaria-sting-r-mx4-8000w-electric-mountain-bike-motorbike-off-road-electric-motorcycle.jpg"
    },
    {
      "id": 2,
      "name": "City Cruiser",
      "description":
          "A sleek and stylish bike perfect for city commutes and urban riding.",
      "price": 899.50,
      "image_url":
          "https://bd.gaadicdn.com/processedimages/kawasaki/eliminator-400/source/eliminator-40065950d19e90a4.jpg"
    },
    {
      "id": 3,
      "name": "Electric Boost",
      "description":
          "A powerful electric bike with a long-lasting battery for extended rides.",
      "price": 1600.00,
      "image_url": "https://m.media-amazon.com/images/I/61-f1tR4ndL.jpg"
    },
    {
      "id": 4,
      "name": "Road Racer",
      "description":
          "A high-performance road bike for competitive racing and fast-paced rides.",
      "price": 2500.75,
      "image_url":
          "https://silodrome.com/wp-content/uploads/2021/05/Harley-Davidson-XRTT-Road-Racer-3.jpg"
    },
    {
      "id": 5,
      "name": "Hybrid Commuter",
      "description":
          "A versatile bike combining features of road and mountain bikes, ideal for mixed-terrain commutes.",
      "price": 1050.20,
      "image_url":
          "https://bikeindia.in/wp-content/uploads/2014/05/Bultaco-Rapitan-Electric-Motorcycle-1-web.jpg"
    }
  ];
}

// liked item
List<BikeModel> likedItemList = [];

// cart item
List<BikeModel> cartItemList = [];
