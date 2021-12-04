import 'package:flutter/material.dart';

import 'api/entities/bill.dart';
import 'api/entities/dio_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final DioService dioService = DioService();
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.blueGrey),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: dioService.getBilling(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var bills = snapshot.data as List<Bill>;
                  var w = <TableRow>[
                    TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Date'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('customerId'),
                        ),
                      ],
                    )
                  ];
                  for (var i in bills) {
                    w.add(TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${i.billingDate.toString()}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('${i.customerID}'),
                        ),
                      ],
                    ));
                  }

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                      children: w,
                      border: TableBorder.all(
                          borderRadius: BorderRadius.all(Radius.circular(2))),
                    ),
                  );
                } else {
                  return const Text('LOADING...');
                }
                return Container();
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
