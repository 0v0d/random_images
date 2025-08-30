import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/remote/github_repo_date_source.dart';
import '../model/github_repo.dart';

abstract class GithubRepoRepository {
  Future<List<GithubRepo>> getRepos(String query);
}

final githubRepoRepositoryProvider =
    Provider((ref) => GithubRepoRepositoryImpl(ref));

class GithubRepoRepositoryImpl implements GithubRepoRepository {
  GithubRepoRepositoryImpl(this._ref);

  final Ref _ref;

  late final GithubRepoDataSource githubRepoDataSource =
      _ref.read(githubRepoDataSourceProvider);

  Future<List<GithubRepo>> getRepos(String query) async {
    final response = await githubRepoDataSource.getRepos(query);
    return response.items; // itemsフィールドからリポジトリリストを取得
  }
}
