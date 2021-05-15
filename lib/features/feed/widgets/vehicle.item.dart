import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductItemState();
  }
}

class _ProductItemState extends State<ProductItem> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> imgList = [
      'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/01/12_ms431_cruze3.jpg',
      'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/01/12_ms431_cruze1.jpg',
      'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/01/12_ms431_cruze2.jpg',
      'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/01/12_ms431_cruze4.jpg',
      'https://cdn-motorshow-ssl.akamaized.net/wp-content/uploads/sites/2/2020/01/12_ms431_cruze5.jpg',
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 14, right: 14),
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
                  child: Builder(
                    builder: (context) {
                      final double height = 250;
                      return CarouselSlider(
                        options: CarouselOptions(
                            height: height,
                            viewportFraction: 1.0,
                            enlargeCenterPage: false,
                            autoPlay: false,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                        items: imgList
                            .map(
                              (item) => Container(
                                child: Center(
                                  child: CachedNetworkImage(
                                    imageUrl: item,
                                    fit: BoxFit.cover,
                                    height: height,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: imgList.map((url) {
                    return Container(
                      width: 15.0,
                      height: 8.0,
                      margin: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 2.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == imgList.indexOf(url)
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
    );
  }
}
