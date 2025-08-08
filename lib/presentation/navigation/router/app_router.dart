import 'package:go_router/go_router.dart';
import 'package:tcb_recru_task/presentation/navigation/nav_bar.dart';
import 'package:tcb_recru_task/presentation/navigation/router/app_route.dart';
import 'package:tcb_recru_task/presentation/page/comments/comments_page.dart';
import 'package:tcb_recru_task/presentation/page/gallery/gallery_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoute.gallery.path,
    routes: [
      StatefulShellRoute.indexedStack(
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.gallery.path,
                name: AppRoute.gallery.name,
                builder: (context, state) => const GalleryPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.comments.path,
                name: AppRoute.comments.name,
                builder: (context, state) => const CommentsPage(),
              ),
            ],
          ),
        ],
        builder: (context, state, child) => NavBarPage(shell: child),
      ),
    ],
  );
}
