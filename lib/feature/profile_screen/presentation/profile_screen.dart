import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(
                'https://avatars.githubusercontent.com/u/58941847?v=4',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Md. Asad Chowdhury Dipu',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'c.dipu0@polygontech.xyz',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Divider(), // Horizontal line
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+880 1234567890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Mohammadpur,Dhaka-1207'),
            ),
            ListTile(
              leading: Icon(Icons.work),
              title: Text('Software Engineer'),
            ),
          ],
        ),
      ),
    );
  }
}
