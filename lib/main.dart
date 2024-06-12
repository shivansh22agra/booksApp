import 'package:booksapp/models/leadModel.dart';
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

  Future<void> fetchLeads() async {
    final response = await http.post(
      Uri.parse('https://api.thenotary.app/lead/getLeads'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'notaryId': '6668baaed6a4670012a6e406',
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      setState(() {
        leads = jsonResponse.map((lead) => Lead.fromJson(lead)).toList();
        filteredLeads = leads;
      });
    } else {
      throw Exception('Failed to load leads');
    }
  }

  void filterLeads(String query) {
    filter = query;
    filteredLeads = leads
        .where((lead) => '${lead.firstName} ${lead.lastName}'
            .toLowerCase()
            .contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Tutorial'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  labelText: 'List view search',
                ),
                onChanged: filterLeads,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredLeads.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${filteredLeads[index].firstName} ${filteredLeads[index].lastName}'),
                    subtitle: Text(filteredLeads[index].email),
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
