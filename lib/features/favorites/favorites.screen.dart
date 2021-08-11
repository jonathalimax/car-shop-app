import 'package:car_shop_app/components/loader/loader.dart';
import 'package:car_shop_app/features/feed/vehicle.tabbar.screen.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.item.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:car_shop_app/models/favorite.model.dart';
import 'package:car_shop_app/repositories/favorities.repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatefulWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  void _openDetailScreen(Car car) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleTabBarScreen(car: car),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meus Favoritos',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: context.read<FavoritiesRepository>().getAll(),
        builder: (BuildContext context,
            AsyncSnapshot<List<FavoriteModel>> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Loader();
            case ConnectionState.done:
              return buildFavorites(snapshot.data ?? []);
            default:
              return Container();
          }
        },
      ),
    );
  }

  ListView buildFavorites(List<FavoriteModel> favorites) {
    return ListView.builder(
      itemCount: favorites.length,
      itemBuilder: (context, index) {
        return VehicleItem(
          car: favorites[index].car,
          openDetailScreen: () => _openDetailScreen(favorites[index].car),
          shouldReloadScreen: () => setState(() {}),
        );
      },
    );
  }
}
