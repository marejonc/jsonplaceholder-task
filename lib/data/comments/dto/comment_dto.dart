import 'package:json_annotation/json_annotation.dart';
import 'package:tcb_recru_task/domain/feature/comments/model/comment.dart';

part 'comment_dto.g.dart';

@JsonSerializable(createToJson: false)
class CommentDto {
  const CommentDto(this.postId, this.id, this.name, this.email, this.body);

  factory CommentDto.fromJson(Map<String, dynamic> json) =>
      _$CommentDtoFromJson(json);

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  Comment toDomain() {
    return Comment(
      postId: postId,
      id: id,
      name: name,
      email: email,
      body: body,
    );
  }
}
