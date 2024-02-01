import 'package:flutter/material.dart';

const sundarban =
    '''The Sundarbans mangrove forest, one of the largest such forests in the world (140,000 ha), lies on the delta of the Ganges, Brahmaputra and Meghna rivers on the Bay of Bengal. It is adjacent to the border of India’s Sundarbans World Heritage site inscribed in 1987. The site is intersected by a complex network of tidal waterways, mudflats and small islands of salt-tolerant mangrove forests, and presents an excellent example of ongoing ecological processes. The area is known for its wide range of fauna, including 260 bird species, the Bengal tiger and other threatened species such as the estuarine crocodile and the Indian python.''';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/1200px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg',
    'https://images.pexels.com/photos/673020/pexels-photo-673020.jpeg?cs=srgb&dl=pexels-eberhard-grossgasteiger-673020.jpg&fm=jpg',
    'https://i.pinimg.com/originals/d3/45/11/d3451114ab4e1d55ead624930bcff60c.jpg',
    'https://t3.ftcdn.net/jpg/03/17/76/14/360_F_317761488_lUO7Enkcskj6wppf9Ycf5zck5Jm2Y2b9.jpg',
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.network(
                images[currentIndex],
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                  bottom: 20,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        onPressed: currentIndex == 0
                            ? null
                            : () {
                                setState(() {
                                  currentIndex--;
                                });
                              },
                        child: Icon(Icons.arrow_left, size: 20),
                      ),
                      FloatingActionButton(
                        onPressed: currentIndex == images.length - 1
                            ? null
                            : () {
                                setState(() {
                                  currentIndex++;
                                });
                              },
                        child: Icon(Icons.arrow_right, size: 20),
                      ),
                    ],
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Column(
              children: [
                _headerSection(),
                _actionSection(),
                _textSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _textSection() => Text(sundarban);

  Padding _actionSection() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _actionIcon(Icons.phone, 'CALL'),
          _actionIcon(Icons.navigation, 'ROUTE'),
          _actionIcon(Icons.share, 'SHARE'),
        ],
      ),
    );
  }

  Column _actionIcon(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue),
        Text(text, style: const TextStyle(color: Colors.blue)),
      ],
    );
  }

  Row _headerSection() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Oeschinen Lake Campground',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey)),
          ],
        ),
        Row(
          children: [
            Icon(Icons.star, color: Colors.orange),
            Text('41'),
          ],
        ),
      ],
    );
  }
}
