import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tcb_recru_task/data/networking/api_result.dart';
import 'package:tcb_recru_task/domain/use_case/gallery/get_photos.dart';
import 'package:tcb_recru_task/presentation/page/gallery/cubit/gallery_page_state.dart';

@injectable
class GalleryPageCubit extends Cubit<GalleryPageState> {
  GalleryPageCubit(this._getPhotos) : super(const GalleryPageStateLoading());

  final GetPhotos _getPhotos;

  Future<void> init() async {
    final photosResult = await _getPhotos();

    switch (photosResult) {
      case ApiResultSuccess(:final data):
        emit(GalleryPageStateIdle(data));

      case ApiResultFailure(:final error):
        emit(GalleryPageStateError(error));
    }
  }
}
