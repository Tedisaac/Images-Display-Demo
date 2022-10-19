import 'package:mvvm_architecture_demo/model/picsum_model.dart';
import 'package:mvvm_architecture_demo/services/services.dart';

class ListPictureViewModel{
  List<PictureViewModel>? pictures;

  Future<void> fetchPictures() async{
    final apiResult = await Service().fetchPicturesAPI();
    this.pictures = apiResult.map((e) => PictureViewModel(e)).toList();
  }

}

class PictureViewModel{
  final PicSumModel? picSumModel;

  PictureViewModel(this.picSumModel);
}