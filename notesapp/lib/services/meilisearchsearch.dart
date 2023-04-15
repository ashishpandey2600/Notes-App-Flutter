import 'package:meilisearch/meilisearch.dart';
import 'dart:io';
import 'dart:convert';

var client = MeiliSearchClient('http://localhost:7700', 'masterKey');

class Search {
  String searchValue;
  Search({required this.searchValue});

  addsearch() async {
    final jsonFile = await File('movies.json').readAsString();
    final movies = jsonDecode(jsonFile);
    await client.index('movies').addDocuments(movies);
  }

  checksearch(serachValue) async {
    await client.index('movies').search(searchValue);
  }
}
