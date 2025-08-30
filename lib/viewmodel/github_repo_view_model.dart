import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:random_images/model/github_repo.dart';
import 'package:random_images/repository/github_repo_repository.dart';

final githubRepoViewModelProvider =
    StateNotifierProvider<GithubRepoViewModel, List<GithubRepo>>(
  (ref) => GithubRepoViewModel(ref),
);

class GithubRepoViewModel extends StateNotifier<List<GithubRepo>> {
  GithubRepoViewModel(this._ref) : super([]);

  final Ref _ref;

  late final GithubRepoRepository githubRepoRepository =
      _ref.read(githubRepoRepositoryProvider);

  Future<void> fetchRepoNames(String query) async {
    githubRepoRepository.getRepos("kotlin").then((value) {
      state = [...state, ...value]; // 状態を更新してUIに通知
      print(state);
    });
  }
}
