import 'package:flutter/material.dart';
import 'package:store_loacter_app/store_model.dart';
import 'MapScreen.dart';
// Ensure this import exists for MapScreen

class StoreDetailScreen extends StatelessWidget {
  final Store store;

  StoreDetailScreen({required this.store});

  _callStore() async {
    final url = "tel:${store.contact}";
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not call ${store.contact}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(store.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(store.address, style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text(store.hours, style: TextStyle(fontSize: 16)),
            SizedBox(height: 8),
            Text(store.description, style: TextStyle(fontSize: 14)),
            SizedBox(height: 16),

            // Button to call the store
            ElevatedButton(
              onPressed: _callStore,
              child: Text("Call Store"),
            ),

            // Button to view the store on map
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapScreen(store: store),
                  ),
                );
              },
              child: Text("View on Map"),
            ),
          ],
        ),
      ),
    );
  }

  canLaunchUrl(Uri parse) {}

  launchUrl(Uri parse) {}
}
