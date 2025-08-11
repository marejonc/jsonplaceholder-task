import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooked_bloc/hooked_bloc.dart';
import 'package:tcb_recru_task/domain/app_error.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';
import 'package:tcb_recru_task/l10n/intl_util.dart';
import 'package:tcb_recru_task/presentation/page/gallery/cubit/gallery_page_cubit.dart';
import 'package:tcb_recru_task/presentation/page/gallery/cubit/gallery_page_state.dart';
import 'package:tcb_recru_task/presentation/widget/common/app_error_view.dart';
import 'package:tcb_recru_task/presentation/widget/common/app_page_wrapper.dart';
import 'package:tcb_recru_task/presentation/widget/gallery/gallery_photo.dart';

const _gridViewCrossAxisCount = 2;

class GalleryPage extends HookWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = useBloc<GalleryPageCubit>();
    final state = useBlocBuilder(cubit);

    final tr = context.l10n;

    useEffect(() {
      cubit.init();

      return null;
    }, [cubit]);

    return AppPageWrapper(
      title: tr.gallery,
      body: switch (state) {
        GalleryPageStateLoading() => const Center(
          child: CircularProgressIndicator(),
        ),
        GalleryPageStateIdle(:final photos) => _IdleContent(photos),
        GalleryPageStateError(:final error) => _ErrorContent(
          error: error,
          onRetry: cubit.init,
        ),
      },
    );
  }
}

class _IdleContent extends StatelessWidget {
  const _IdleContent(this.photos);

  final List<Photo> photos;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      crossAxisCount: _gridViewCrossAxisCount,
      children: [for (final photo in photos) GalleryPhoto(photo)],
    );
  }
}

class _ErrorContent extends StatelessWidget {
  const _ErrorContent({required this.error, required this.onRetry});

  final AppError error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final tr = context.l10n;

    final errorMessage = switch (error) {
      AppErrorNetwork() => tr.network_error,
      final _ => tr.gallery_error,
    };

    return AppErrorView(errorMessage: errorMessage, onRetry: onRetry);
  }
}
