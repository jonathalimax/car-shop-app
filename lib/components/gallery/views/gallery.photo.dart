import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryImage extends StatefulWidget {
  final LoadingBuilder? loadingBuilder;
  final BoxDecoration backgroundDecoration;
  final int startIndex;
  final PageController pageController;
  final List<GalleryItem> images;
  final Axis scrollDirection;

  GalleryImage({
    this.loadingBuilder,
    required this.backgroundDecoration,
    required this.startIndex,
    required this.images,
    required this.scrollDirection,
  }) : pageController = PageController(initialPage: startIndex);

  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  int _currentIndex = 0;

  @override
  void initState() {
    _currentIndex = widget.startIndex;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Container(
          decoration: widget.backgroundDecoration,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            //alignment: Alignment.,
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: BouncingScrollPhysics(),
                itemCount: widget.images.length,
                builder: _buildItem,
                loadingBuilder: widget.loadingBuilder,
                backgroundDecoration: widget.backgroundDecoration,
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                scrollDirection: widget.scrollDirection,
              ),
              Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () => Navigator.pop(context, _currentIndex),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      widget.images[_currentIndex].name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItem item = widget.images[index];
    return PhotoViewGalleryPageOptions(
      imageProvider: CachedNetworkImageProvider(
        item.url,
        cacheKey: item.id.toString(),
      ),
      initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.covered,
      heroAttributes: PhotoViewHeroAttributes(tag: item.id),
      filterQuality: FilterQuality.high,
    );
  }
}
