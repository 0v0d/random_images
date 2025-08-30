import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:random_images/viewmodel/github_repo_view_model.dart';

class GithubRepoPage extends HookConsumerWidget {
  const GithubRepoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repoNames = ref.watch(githubRepoViewModelProvider); // 状態を監視
    final viewModel = ref.read(githubRepoViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GitHub Repositories'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: repoNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(repoNames[index].fullName), // fullNameを表示
                  leading: const Icon(Icons.folder),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.fetchRepoNames("kotlin"); // テスト用のボタン
        },
        child: const Icon(Icons.search),
      ),
    );
  }
}
