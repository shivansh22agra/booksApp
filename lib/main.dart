import 'package:booksapp/models/leadModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Lead> leads = [];
  List<Lead> filteredLeads = [];
  String filter = "";

  @override
  void initState() {
    super.initState();
    fetchLeads();
  }

  bool isLoading = false;
  Future<void> fetchLeads() async {
    isLoading = true;
    setState(() {});
    final response = await http.post(
      Uri.parse('https://api.thenotary.app/lead/getLeads'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({"notaryId": "6668baaed6a4670012a6e406"}),
    );
    print('__fneufner0 ${response.statusCode}');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print('__fneufner1 $data');

      for (int i = 0; i < data['leads'].length; i++) {
        leads.add(Lead.fromJson(data['leads'][i]));
        filteredLeads.add(Lead.fromJson(data['leads'][i]));
      }
      isLoading = false;
      setState(() {});
      print('__fneufner2 ${leads.length}');
    } else {
      throw Exception('Failed to load leads');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tutorial'),
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CupertinoSearchTextField(
                      onChanged: (value) {
                        filteredLeads = leads
                            .where((lead) => '${lead.firstName}'
                                .toLowerCase()
                                .contains(value.toLowerCase()))
                            .toList();
                        setState(() {});
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredLeads.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                filteredLeads[index].imageUrl.toString()),
                          ),
                          title: Text('${filteredLeads[index].firstName} '),
                          subtitle: Text(filteredLeads[index].email.toString()),
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
