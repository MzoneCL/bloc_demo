import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'bloc.dart';
import 'page2.dart';

main() => runApp(BlocProvider(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BLoCTheme bLoCTheme = BlocProvider.ofBloCTheme(context);
    return StreamBuilder(
      stream: bLoCTheme.streamThemeData,
      initialData: bLoCTheme.themeData,
      builder: (context, snapshot){
        print(snapshot.data.runtimeType);
        return MaterialApp(
          theme: snapshot.data,
          home: MyWidget(),
        );
      },
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BLoC bLoC = BlocProvider.of(context);
    final BLoCTheme bLoCTheme = BlocProvider.ofBloCTheme(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Page2();
          }));
        },
        child: Icon(
          Icons.navigate_next,
          size: 40,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: Text('BLoC Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              builder: (context, snapshot) {
                return Text(
                  '点击了 ' + snapshot.data.toString() + ' 下',
                  style: TextStyle(fontSize: 30),
                );
              },
              initialData: bLoC.count,
              stream: bLoC.streamCount,
            ),
            RaisedButton(
              onPressed: () {
                bLoC.increment();
              },
              child: Text('点击'),
            ),
            RaisedButton(
              onPressed: () {
                bLoCTheme.changeTheme();
              },
              child: Text('切换主题'),
            )
          ],
        ),
      ),
    );
  }
}
