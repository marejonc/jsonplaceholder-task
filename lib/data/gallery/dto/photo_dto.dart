import 'package:json_annotation/json_annotation.dart';
import 'package:tcb_recru_task/data/mocks.dart';
import 'package:tcb_recru_task/domain/feature/gallery/model/photo.dart';

part 'photo_dto.g.dart';

@JsonSerializable(createToJson: false)
class PhotoDto {
  const PhotoDto(
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  );

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo toDomain() {
    // placeholder.com seems to be down as per this reddit thread
    // https://www.reddit.com/r/web_design/comments/10lqgja/placeholdercom_is_no_more/
    // Hence I decided to fallback to randomized graphics
    final (thumbnail, original) = Mocks.randomPhoto;

    return Photo(
      albumId: albumId,
      id: id,
      title: title,
      url: original,
      thumbnailUrl: thumbnail,
    );
  }
}
