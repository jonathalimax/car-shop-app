import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class MapsSheet {
  static show({
    required BuildContext context,
    required Function(AvailableMap map) onMapTap,
  }) async {
    final availableMaps = await MapLauncher.installedMaps;

    showBarModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: (30.0 * availableMaps.length) + 70,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Wrap(
                      children: <Widget>[
                        for (var map in availableMaps)
                          ListTile(
                            onTap: () => onMapTap(map),
                            title: Text(
                              map.mapName,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: SvgPicture.asset(
                                map.icon,
                                height: 30.0,
                                width: 30.0,
                              ),
                            ),
                          ),
                      ],
                    ),
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
