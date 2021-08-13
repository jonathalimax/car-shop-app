import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_shop_app/components/loader/loader.dart';
import 'package:car_shop_app/features/favorites/favorites.screen.dart';
import 'package:car_shop_app/features/login/login.screen.dart';
import 'package:car_shop_app/models/vehicle.dart';
import 'package:car_shop_app/models/vehicles.model.dart';
import 'package:car_shop_app/services/authentication.service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<AuthenticationService>().authStateChanges,
      builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Loader();

        if (snapshot.hasData) {
          return profileScreen(context, snapshot.data!);
        } else {
          return LoginScreen();
        }
      },
    );
  }

  Scaffold profileScreen(BuildContext context, User loggedUser) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthenticationService>().signOut();
              Provider.of<VehiclesModel>(context, listen: false)
                  .removeFavorites();
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header(context, loggedUser),
            profileItems(context),
          ],
        ),
      ),
    );
  }

  Expanded profileItems(BuildContext context) {
    return Expanded(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text(
              'Lista de desejos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Stack header(BuildContext context, User user) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          color: Theme.of(context).primaryColor,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 22,
            top: 0,
            right: 22,
            bottom: 14,
          ),
          child: Row(
            children: <Widget>[
              user.photoURL == null
                  ? ClipOval(
                      child: Container(
                        color: Colors.blueGrey,
                      ),
                    )
                  : ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: user.photoURL!,
                        width: 56,
                        height: 56,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Center(
                          child: Loader(),
                        ),
                      ),
                    ),
              SizedBox(width: 14),
              Flexible(
                child: Text(
                  user.displayName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
