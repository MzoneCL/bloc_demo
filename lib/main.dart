import 'package:flutter/material.dart';

import 'bloc_provider.dart';
import 'bloc.dart';
import 'page2.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        home: MyWidget(),
        theme: ThemeData.dark(),
      ),
    );
  }
}

bu() {
  return Stack(
    children: <Widget>[
      Positioned(
        child: Align(
          child: Text('哈哈哈哈'),
          alignment: Alignment.center,
        ),
        bottom: 0,
        left: 0,
        right: 0,
      ),
    ],
  );
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BLoC bLoC = BlocProvider.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Page2();
          }));
        },
        child: Icon(Icons.navigate_next,size: 40,color: Colors.white,),
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
                return Text('点击了 ' + snapshot.data.toString() + ' 下',style: TextStyle(fontSize: 30),);
              },
              initialData: bLoC.count,
              stream: bLoC.streamCount,
            ),
            RaisedButton(
              onPressed: () {
                bLoC.increment();
              },
              child: Text('点击'),
            )
          ],
        ),
      ),
    );
  }
}
