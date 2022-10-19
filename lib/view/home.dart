import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mvvm_architecture_demo/viewmodel/list_pictures_viewmodel.dart';
import 'package:transparent_image/transparent_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ListPictureViewModel listPictureViewModel = new ListPictureViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Images'),
      ),
      body: FutureBuilder(
        future: listPictureViewModel.fetchPictures(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          else{
            return GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 6,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: const [
                    QuiltedGridTile(4, 4),
                    QuiltedGridTile(2, 2),
                    QuiltedGridTile(2, 2),

                  ]
                ),
              childrenDelegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  child: FadeInImage.memoryNetwork(
                      placeholder: kTransparentImage,
                      image: '${listPictureViewModel.pictures![index].picSumModel!.downloadUrl}',
                      fit: BoxFit.cover),
                );
              },
                  childCount: listPictureViewModel.pictures?.length
              ),
            );

          }
        },
      ),
    );
  }
}
