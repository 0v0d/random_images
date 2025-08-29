import '../data/remote/github_repo_date_source.dart';
import '../model/github_repo.dart';

abstract class GithubRepoRepository {
  Future<List<GithubRepo>> getRepos(String query);
}

class GithubRepoRepositoryImpl implements GithubRepoRepository {
  late final GithubRepoDateSource _dataSource = GithubRepoDateSource(
  );

  GithubRepoRepositoryImpl(this._dataSource);

  @override
  Future<List<GithubRepo>> getRepos(String query) {
    return _dataSource.getRepos(query);
  }
}
