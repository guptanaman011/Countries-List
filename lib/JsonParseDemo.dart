import 'package:flutter/material.dart';
import 'services.dart';
import 'CountryModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class JsonParseDemo extends StatefulWidget {
  const JsonParseDemo({Key? key}) : super(key: key);

  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  late Future<List<Country>?> user;

  @override
  void initState() {
    super.initState();
    user = Services.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countries List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Countries List'),
        ),
        body: Container(
          child: FutureBuilder<List<Country>?>(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int length = snapshot.data?.length ?? 0;
                var countryList = snapshot.data!.toList();
                return ListView(children: countryList.map((e) {
                  ListTile(
                    title: Text(
                      e.countryName,
                      style: TextStyle(fontSize: 20.0),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('Code : ${e.countryCode.toString()}',
                            style: TextStyle(fontSize: 18.0)),
                        SvgPicture.network(
                          e.countryflag,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ],
                    ),
                  );
                }));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
