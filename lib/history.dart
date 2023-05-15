import 'package:flutter/material.dart';
import 'log.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  build(BuildContext context) {
    List<Log> reverse = logList.reversed.toList();
    return Center(
      child: ListView.builder(
          itemCount: reverse.length,
          itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text('Time ${reverse[index].gettime}'),
                  subtitle: Text('${reverse[index].getValue}'),
                ),
              )),
    );
  }
}
