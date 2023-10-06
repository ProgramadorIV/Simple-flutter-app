import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  static const name = 'progress_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text('Circular Progress Indicator'),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            height: 25,
          ),
          Text('Controlled progress indicator'),
          SizedBox(
            height: 20,
          ),
          _ControllerProgressIndicator(),
        ],
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream:
          Stream.periodic(const Duration(milliseconds: 300), (computedValue) {
        return (computedValue * 2) / 100;
      }).takeWhile((element) => element < 100),
      builder: (context, snapshot) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                strokeWidth: 2,
                backgroundColor: Colors.amber,
                value: 0.5, //Espacio rellenado en el indicator
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: 0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
