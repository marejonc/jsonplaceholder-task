import 'package:go_router/go_router.dart';
import 'package:tcb_recru_task/presentation/navigation/router/app_route.dart';
import 'package:tcb_recru_task/presentation/page/comments_page/comments_page.dart';
import 'package:tcb_recru_task/presentation/page/gallery_page/gallery_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.gallery.path,
    routes: [
      GoRoute(
        path: AppRoute.gallery.path,
        name: AppRoute.gallery.name,
        builder: (context, state) => const GalleryPage(),
      ),
      GoRoute(
        path: AppRoute.comments.path,
        name: AppRoute.comments.name,
        builder: (context, state) => const CommentsPage(),
      ),
    ],
  );
}
