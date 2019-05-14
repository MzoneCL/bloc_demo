import 'package:flutter/material.dart';

import 'bloc.dart';
import 'bloc_provider.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BLoC bLoC = BlocProvider.of(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Icon(Icons.arrow_back_ios,color: Colors.white,),
      ),
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              builder: (context, snapshot) {
                return Text('点击了' + snapshot.data.toString() + ' 下',style: TextStyle(fontSize: 30.0),);
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
