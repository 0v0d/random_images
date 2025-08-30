import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/github_repo.dart';
import 'api_client.dart';

part 'github_repo_date_source.g.dart';

final githubRepoDataSourceProvider =
Provider((ref) => GithubRepoDataSource(ref));

@RestApi()
abstract class GithubRepoDataSource {
  factory GithubRepoDataSource(Ref ref) =>
      _GithubRepoDataSource(ref.read(dioProvider));

  @GET('search/repositories')
  Future<GithubSearchResponse> getRepos(@Query('q') String query);
}
