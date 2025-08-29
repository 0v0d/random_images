import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:retrofit/retrofit.dart';

import '../../model/github_repo.dart';
import 'api_client.dart';

part 'github_repo_date_source.g.dart';

final githubRepoDateSourceProvider =
    Provider((ref) => GithubRepoDateSource(ref));

@RestApi()
abstract class GithubRepoDateSource {
  factory GithubRepoDateSource(Ref ref) =>
      _GithubRepoDateSource(ref.read(dioProvider));

  @GET('search/repositories')
  Future<List<GithubRepo>> getRepos(@Query('q') String query);
}
