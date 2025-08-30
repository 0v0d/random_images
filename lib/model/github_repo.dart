import 'package:freezed_annotation/freezed_annotation.dart';

part 'github_repo.g.dart';
part 'github_repo.freezed.dart';


// GitHub Search APIのレスポンス用モデルを追加
@freezed
class GithubSearchResponse with _$GithubSearchResponse {
  const factory GithubSearchResponse({
    @JsonKey(name: 'total_count') required int totalCount,
    @JsonKey(name: 'incomplete_results') required bool incompleteResults,
    required List<GithubRepo> items, // リポジトリのリストはitemsの中
  }) = _GithubSearchResponse;

  factory GithubSearchResponse.fromJson(Map<String, Object?> json) =>
      _$GithubSearchResponseFromJson(json);
}

// 既存のGithubRepoモデル（JsonKeyの修正）
@freezed
class GithubRepo with _$GithubRepo {
  const factory GithubRepo({
    required int id,
    @JsonKey(name: 'full_name') required String fullName, // アンダースコアに修正
    String? language, // nullableに変更（言語が設定されていないリポジトリもあるため）
  }) = _GithubRepo;

  factory GithubRepo.fromJson(Map<String, Object?> json) =>
      _$GithubRepoFromJson(json);
}
