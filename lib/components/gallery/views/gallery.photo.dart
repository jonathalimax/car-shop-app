import 'package:cached_network_image/cached_network_image.dart';
import 'package:car_shop_app/components/gallery/model/gallery.item.model.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class GalleryImage extends StatefulWidget {
  final LoadingBuilder loadingBuilder;
  final Decoration backgroundDecoration;
  final dynamic minScale;
  final dynamic maxScale;
  final int startIndex;
  final PageController pageController;
  final List<GalleryItemModel> images;
  final Axis scrollDirection;

  GalleryImage({
    Key key,
    this.loadingBuilder,
    this.backgroundDecoration,
    this.minScale,
    this.maxScale,
    this.startIndex,
    this.images,
    this.scrollDirection,
  }) : pageController = PageController(initialPage: startIndex);

  @override
  _GalleryImageState createState() => _GalleryImageState();
}

class _GalleryImageState extends State<GalleryImage> {
  int _currentIndex;

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

  void onDragDown(DragStartDetails dragDownDetails) {
    Navigator.pop(context, _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragStart: onDragDown,
        child: Container(
          decoration: widget.backgroundDecoration,
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
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
              SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    widget.images[_currentIndex].description,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final GalleryItemModel item = widget.images[index];
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
