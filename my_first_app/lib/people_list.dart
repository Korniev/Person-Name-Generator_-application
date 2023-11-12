import 'package:flutter/material.dart';
import 'package:random_name_generator/random_name_generator.dart';
import 'package:google_fonts/google_fonts.dart';


class PeopleList extends StatefulWidget {
  const PeopleList({super.key});

  @override
  State<PeopleList> createState() => _PeopleListState();
}

class _PeopleListState extends State<PeopleList> {
  final _suggestions = <String>[];
  final _randomNames = RandomNames(Zone.us);
  final _selectedNames = <String>{};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();
        final index = i ~/ 2;
        if (index >= _suggestions.length) {
          for (var i = 0; i < 10; i++) {
            _suggestions.add(_randomNames.fullName());
          }
        }
        return ListTile(
          title: Text(
            _suggestions[index],
            style: GoogleFonts.almarai(
            textStyle: const TextStyle(
              color: Colors.tealAccent,
              letterSpacing: .8,
              fontSize: 20.0,
             ),
            ),
          ),
          trailing: _selectedNames.contains(_suggestions[index])
              ? const Icon(Icons.check_box)
              : const Icon(Icons.check_box_outline_blank),
          onTap: () {
            setState(() {
              if (_selectedNames.contains(_suggestions[index])) {
                _selectedNames.remove(_suggestions[index]);
              } else {
                _selectedNames.add(_suggestions[index]);
              }
            });
          },
        );
      },
    );
  }
}
