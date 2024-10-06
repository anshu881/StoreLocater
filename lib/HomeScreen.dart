import 'package:flutter/material.dart';
import 'package:store_loacter_app/storDetailScreen.dart';
import 'package:store_loacter_app/store_model.dart';
import 'package:store_loacter_app/store_service.dart';
import 'package:location/location.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Store> _stores = [];
  String _searchText = '';
  LocationData? _userLocation;

  @override
  void initState() {
    super.initState();
    _loadStores();
    _getUserLocation();
  }

  _getUserLocation() async {
    Location location = Location();
    _userLocation = await location.getLocation();
    setState(() {});
  }

  _loadStores() async {
    _stores = await StoreService.getStores();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nearby Stores")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by store name...',
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _stores.length,
              itemBuilder: (context, index) {
                final store = _stores[index];
                return ListTile(
                  title: Text(store.name),
                  subtitle: Text(store.address),
                  trailing: _userLocation != null
                      ? Text(
                    "${store.getDistance(_userLocation!).toStringAsFixed(2)} km",
                  )
                      : null,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoreDetailScreen(store: store),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
