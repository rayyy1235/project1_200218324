import 'package:flutter/material.dart';
import 'package:note_app/note_model/note.dart';

class NoteWidget extends StatefulWidget {
  
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteWidget(
      {Key? key,
      required this.note,
      required this.onTap,
      required this.onLongPress})
      : super(key: key);

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  Color selectedColor = Color.fromARGB(255, 73, 187, 240);

  void onColorSelected(Color cucolor) {
    setState(() {
      selectedColor = cucolor;
    });
  }

 @override
Widget build(BuildContext context) {
  return GestureDetector(
    onLongPress: widget.onLongPress,
    onTap: widget.onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: selectedColor,
                boxShadow: [
                  BoxShadow(
                    color: selectedColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      thickness: 1.3,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.note.description,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: selectedColor,
                boxShadow: [
                  BoxShadow(
                    color: selectedColor.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note.title,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      thickness: 1.3,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.note.description,
                      style: const TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}


}