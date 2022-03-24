import 'package:flutter/material.dart';

class InfiniteLoader extends StatelessWidget {
  const InfiniteLoader({Key? key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return const Center(
			child: CircularProgressIndicator(),
		);
	}
}