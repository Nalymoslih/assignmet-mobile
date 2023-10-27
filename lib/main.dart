import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final List<String> dummyList = List.generate(10, (index) => 'Item $index');
  final List<String> dummyImages = [
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
    'https://via.placeholder.com/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dynamic List View & Slide Show'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: dummyList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(dummyList[index]),
                );
              },
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enlargeCenterPage: true,
              autoPlay: true,
            ),
            items: dummyImages.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                    ),
                    child: Image.network(
                      item,
                      fit: BoxFit.cover,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
