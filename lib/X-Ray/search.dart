import 'package:flutter/material.dart';
import 'package:flutter_application_1/X-Ray/apiservices.dart';

import 'package:url_launcher/url_launcher.dart';
import 'rayModel.dart';

class Search extends SearchDelegate {
  FetchXrayList _xrayList = FetchXrayList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  late Future<RayModel?> rays;

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<RayModel?>(
      future: _xrayList.getSomeRays(query: query),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data?.rays?.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                  image: NetworkImage(snapshot
                                      .data!.rays![index].photo
                                      .toString())),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 3,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      snapshot.data!.rays![index].name
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(children: [
                                    Text(
                                      'Governement:',
                                      style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 76, 159, 228),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(
                                        snapshot.data!.rays![index].government
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ]),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        'City:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data!.rays![index].city
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_on_outlined),
                                      Text(
                                        'Location:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data!.rays![index].location
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                      Text(
                                        'Phone:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data!.rays![index].phone
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.calendar_month),
                                      Text(
                                        'Appoinement:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text(
                                          snapshot.data!.rays![index].appoinment
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.web_asset),
                                      Text(
                                        'Website:',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 76, 159, 228),
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: InkWell(
                                            child: Text(
                                              snapshot
                                                  .data!.rays![index].website
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                            onTap: () => launch(snapshot
                                                .data!.rays![index].url
                                                .toString())),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: FlatButton(
                                          onPressed: () => launch(snapshot
                                              .data!.rays![index].url
                                              .toString()),
                                          child: Text(
                                            'Follow location',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15),
                                          ),
                                          color:
                                              Color.fromARGB(255, 76, 159, 228),
                                        ),
                                      ),
                                    ],
                                  ),
                                ]))
                      ],
                    ),
                  ),
                );
              });
        } else {
          return Center(child: const CircularProgressIndicator());
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('Search X-Ray'),
    );
  }
}
