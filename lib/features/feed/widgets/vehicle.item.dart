import 'package:car_shop_app/components/gallery/views/gallery.photo.dart';
import 'package:car_shop_app/components/gallery/views/gallery.thumbnail.dart';
import 'package:car_shop_app/components/gallery/model/gallery.item.model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class VehicleItem extends StatefulWidget {
  final Function openDetailScreen;

  VehicleItem({
    Key key,
    this.openDetailScreen,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _VehicleItemState();
  }
}

class _VehicleItemState extends State<VehicleItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List<GalleryItemModel> images = [
      GalleryItemModel(
        id: 1,
        url:
            'https://www.blogauto.com.br/wp-content/2014/06/2D8A0835bc-643x429.jpg',
        description: 'Frontal',
      ),
      GalleryItemModel(
        id: 2,
        url:
            'https://www.blogauto.com.br/wp-content/2014/06/2D8A7987-390x260.jpg',
        description: 'Lateral',
      ),
      GalleryItemModel(
        id: 3,
        url:
            'https://www.blogauto.com.br/wp-content/2014/06/2D8A8876b-643x429.jpg',
        description: 'Interior',
      ),
      GalleryItemModel(
        id: 4,
        url:
            'https://www.blogauto.com.br/wp-content/2014/06/2D8A0713bC-390x260.jpg',
        description: 'Motor',
      ),
    ];

    void _openGallery(BuildContext context, final int index) async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GalleryImage(
            images: images,
            backgroundDecoration: const BoxDecoration(
              color: Colors.black,
            ),
            startIndex: index,
            scrollDirection: Axis.horizontal,
          ),
        ),
      );

      setState(() {
        _current = result;
      });
    }

    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
      child: GestureDetector(
        onTap: widget.openDetailScreen,
        child: Container(
          height: 400,
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
              Column(
                children: [
                  Container(
                    child: CarouselSlider(
                      items: images
                          .map(
                            (item) => Container(
                              height: 250,
                              child: GalleryThumbnail(
                                model: item,
                                onTap: () {
                                  _openGallery(context, _current);
                                },
                              ),
                            ),
                          )
                          .toList(),
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: images.map((item) {
                      return Container(
                        width: 15.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 2.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _current == images.indexOf(item)
                              ? Color.fromRGBO(0, 0, 0, 1)
                              : Color.fromRGBO(0, 0, 0, 0.4),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Marca',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Modelo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'R\$100.000,00',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                  bottom: 14,
                ),
                child: Text(
                  'Título completo do anúncio gerado auto',
                  textAlign: TextAlign.left,
                  maxLines: 1,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 14,
                  right: 14,
                  bottom: 14,
                ),
                child: Row(
                  children: [
                    Text(
                      '2012/2013',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '-',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '105.000 km',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '-',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Preto',
                      textAlign: TextAlign.left,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
