import 'package:car_shop_app/components/gallery/views/gallery.photo.dart';
import 'package:car_shop_app/components/gallery/views/gallery.thumbnail.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:car_shop_app/repositories/favorities.repository.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleItem extends StatefulWidget {
  final Car car;
  final VoidCallback openDetailScreen;
  VoidCallback? shouldReloadScreen;

  VehicleItem({
    required this.car,
    required this.openDetailScreen,
    this.shouldReloadScreen,
  });

  @override
  State<StatefulWidget> createState() {
    return _VehicleItemState();
  }
}

class _VehicleItemState extends State<VehicleItem> {
  int _currentImage = 0;
  CarouselController _carouselController = CarouselController();

  void _openGallery(BuildContext context, final int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryImage(
          images: widget.car.images ?? [],
          backgroundDecoration: const BoxDecoration(
            color: Colors.black,
          ),
          startIndex: index,
          scrollDirection: Axis.horizontal,
        ),
      ),
    );

    setState(() {
      _currentImage = result;
      _carouselController.jumpToPage(_currentImage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14,
          top: 12,
          right: 14,
          bottom: 10,
        ),
        child: GestureDetector(
          onTap: widget.openDetailScreen,
          child: Container(
            height: 404,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 6,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildCaroulser(_openGallery, context),
                buildMainInfo(),
                twoSpecsLine(
                  {'Câmbio': widget.car.gearbox},
                  {'Combustível': widget.car.fuel},
                ),
                twoSpecsLine(
                  {'Ano': widget.car.year},
                  {'Hôdometro': '${widget.car.odometer} Km'},
                ),
                buildDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 12,
      ),
      child: Text(
        widget.car.description,
        textAlign: TextAlign.left,
        maxLines: 3,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Padding buildMainInfo() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 12,
        left: 14,
        right: 14,
        bottom: 10,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.car.brand,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 5),
          Text(
            widget.car.model,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Text(
            'R\$ ${widget.car.value}',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Column buildCaroulser(
    void _openGallery(BuildContext context, int index),
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          child: widget.car.images == null
              ? Container()
              : Stack(
                  children: <Widget>[
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: widget.car.images!
                          .map(
                            (item) => Container(
                              height: 250,
                              child: GalleryThumbnail(
                                model: item,
                                onTap: () =>
                                    _openGallery(context, _currentImage),
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentImage = index;
                          });
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        padding: EdgeInsets.all(4),
                        child: IconButton(
                          icon: Icon(
                            widget.car.isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_outline_rounded,
                          ),
                          color: Colors.white,
                          iconSize: 30,
                          onPressed: () {
                            if (widget.car.isFavorite) {
                              context
                                  .read<FavoritiesRepository>()
                                  .remove(widget.car.id)
                                  .then((value) => {
                                        setState(() {
                                          if (widget.shouldReloadScreen !=
                                              null) {
                                            widget.shouldReloadScreen!();
                                          }
                                          widget.car.isFavorite = false;
                                        })
                                      });
                            } else {
                              context
                                  .read<FavoritiesRepository>()
                                  .save(widget.car.id)
                                  .then((value) => {
                                        setState(() {
                                          if (widget.shouldReloadScreen !=
                                              null) {
                                            widget.shouldReloadScreen!();
                                          }
                                          widget.car.isFavorite = true;
                                        })
                                      });
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.car.images!.map((item) {
            return Container(
              width: 15.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 2.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentImage == widget.car.images!.indexOf(item)
                    ? Color.fromRGBO(0, 0, 0, 1)
                    : Color.fromRGBO(0, 0, 0, 0.4),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Padding twoSpecsLine(
    Map<String, String> firstSpec,
    Map<String, String> secondSpec,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14,
        right: 14,
        bottom: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            firstSpec.keys.first,
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 5),
          Text(
            firstSpec.values.first,
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Spacer(),
          Text(
            secondSpec.keys.first,
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(width: 5),
          Text(
            secondSpec.values.first,
            textAlign: TextAlign.left,
            maxLines: 1,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
