import 'package:flutter/material.dart';
import 'package:stud/db/model/db_model.dart';
import 'package:stud/screen/liststudent.dart';

class StudentSearch extends SearchDelegate<String> {
  final List<studentModel> studentlist;
  final Function(String) onSearch;

  StudentSearch(this.studentlist ,this.onSearch);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>listStudent()),
        );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: studentlist.length,
      itemBuilder: (context, index) {
        final  student = studentlist[index];
        return ListTile(
          title: Text(student.name),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<studentModel> suggestionList = studentlist.where((student) {
      final nameLower = student.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final student = suggestionList[index];
        return ListTile(
          title: Text(student.name),
          onTap: () {
            onSearch(student.name);
            close(context, student.name);
          },
        );
      },
    );
  }
}