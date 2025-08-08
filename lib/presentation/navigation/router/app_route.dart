enum AppRoute {
  gallery('/gallery'),
  comments('/comments');

  const AppRoute(this.path);

  final String path;
}
