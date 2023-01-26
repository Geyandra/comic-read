import 'package:flutter/material.dart';

class ShowImageNetwork extends StatelessWidget {
  const ShowImageNetwork({
    Key? key, 
    required this.urlimage,
  }) : super(key: key);

  final String urlimage;

  @override
  Widget build(BuildContext context) {
    return Image(
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Center(child: Text("Invalid image data"),);
      },
        image: NetworkImage(
            urlimage));
  }
}