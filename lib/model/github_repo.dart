import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.g.dart';
part 'github_repo.freezed.dart';

@freezed
class GithubRepo with _$GithubRepo {
  const factory GithubRepo({
    required int id,
    @JsonKey(name: 'full_name') required String fullName,
    required String language,
  }) = _GithubRepo;

  factory GithubRepo.fromJson(Map<String, Object?> json) =>
      _$GithubRepoFromJson(json);
}
