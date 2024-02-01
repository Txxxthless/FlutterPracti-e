import 'package:flutter/material.dart';

const imageUrl =
    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e7/Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg/1200px-Everest_North_Face_toward_Base_Camp_Tibet_Luca_Galuzzi_2006.jpg';

const sundarban =
    '''The Sundarbans mangrove forest, one of the largest such forests in the world (140,000 ha), lies on the delta of the Ganges, Brahmaputra and Meghna rivers on the Bay of Bengal. It is adjacent to the border of India’s Sundarbans World Heritage site inscribed in 1987. The site is intersected by a complex network of tidal waterways, mudflats and small islands of salt-tolerant mangrove forests, and presents an excellent example of ongoing ecological processes. The area is known for its wide range of fauna, including 260 bird species, the Bengal tiger and other threatened species such as the estuarine crocodile and the Indian python.''';

void main() {
  runApp(
    const AppWidget(),
  );
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: 250,
            width: double.infinity,
            fit: BoxFit.cover,
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
