import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            header(context),
            profileItems(),
          ],
        ),
      ),
    );
  }

  Expanded profileItems() {
    return Expanded(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          ListTile(
            title: Text(
              'Meus favoritos',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            title: Text(
              'Lista de desejo',
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

  Stack header(BuildContext context) {
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
              ClipOval(
                child: Image.network(
                  'http://www.goodmorningimagesdownload.com/wp-content/uploads/2019/12/Profile-Picture-4.jpg',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14),
              Flexible(
                child: Text(
                  'Jonatha Lima',
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
