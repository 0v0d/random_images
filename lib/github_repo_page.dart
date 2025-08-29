import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RandomImagePage extends HookConsumerWidget {
  const RandomImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Image')),
      body: Center(
        child: Image.network('https://picsum.photos/200/300'),
      ),
    );
  }
}
