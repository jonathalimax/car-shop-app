import 'package:car_shop_app/features/feed/vehicle.tabbar.screen.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.item.dart';
import 'package:car_shop_app/models/vehicle.dart';
import 'package:car_shop_app/models/vehicles.model.dart';
import 'package:car_shop_app/repositories/favorities.repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: Icon(
          Icons.clear_rounded,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final model = Provider.of<VehiclesModel>(context);
    final vehicles = model.vehicles
        .where((vehicle) => vehicle.searchableString
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: vehicles.length,
      itemBuilder: (context, index) {
        return VehicleItem(
          car: vehicles[index],
          openDetailScreen: () => _openDetailScreen(context, vehicles[index]),
          shouldReloadScreen: () async {
            final favorites = await FavoritiesRepository().getAll();
            model.needsUpdate(favorites);
          },
          origin: 'search',
        );
      },
    );
  }

  void _openDetailScreen(BuildContext context, Vehicle vehicle) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleTabBarScreen(car: vehicle),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final vehiclesModel = Provider.of<VehiclesModel>(context, listen: false);
    final vehicles = vehiclesModel.vehicles
        .map((element) => element.searchableString)
        .toList();

    final suggestions = query.isEmpty
        ? vehicles
        : vehicles
            .where((vehicle) =>
                vehicle.toLowerCase().contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            query = suggestions[index];
            showResults(context);
          },
          title: RichText(
            text: TextSpan(
              text: suggestions[index].substring(0, query.length),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
              children: [
                TextSpan(
                  text: suggestions[index].substring(query.length),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
