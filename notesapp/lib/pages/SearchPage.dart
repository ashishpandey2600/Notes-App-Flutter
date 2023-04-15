import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:notesapp/services/meilisearchsearch.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EasySearchBar(
          title: const Text('search any notes'),
          onSearch: (value) => setState(() => searchValue = value),

          // suggestions: _suggestions
        ),
        body: Center(child: Text('Value: $searchValue')));
  }
}
