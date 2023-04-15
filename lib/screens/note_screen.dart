import 'package:flutter/material.dart';
import 'package:note_app/note_model/note.dart';
import 'package:note_app/database/db_helper.dart';

List<Color> colors = [
  const Color(0xFFFFFFFF),
  const Color(0xffF28B83),
  const Color(0xFFFCBC05),
  const Color(0xFFFFF476),
  const Color(0xFFCBFF90),
  const Color(0xFFA7FEEA),
  const Color(0xFFE6C9A9),
  const Color(0xFFE8EAEE),
  const Color(0xFFA7FEEA),
  const Color(0xFFCAF0F8)
];

class PriorityPicker extends StatefulWidget {
  final Function(int) onTap;
  final int selectedIndex;
  const PriorityPicker({Key? key, required this.onTap, this.selectedIndex = 0}) : super(key: key);
  @override
  _PriorityPickerState createState() => _PriorityPickerState();
}

class _PriorityPickerState extends State<PriorityPicker> {
  int selectedIndex = 0;
  List<String> priorityText = ['Low', 'High', 'Very High'];
  List<Color> priorityColor = [Colors.green, Colors.lightGreen, Colors.red];
  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onTap(index);
            },
            child: Container(
              padding: const EdgeInsets.all(8.0),
              width: width / 3,
              height: 70,
              child: Container(
                child: Center(
                  child: Text(priorityText[index],
                      style: TextStyle(
                          color: selectedIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? priorityColor[index]
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(8.0),
                    border: selectedIndex == index
                        ? Border.all(width: 2, color: Colors.black)
                        : Border.all(width: 0,color: Colors.transparent)),
              ),
            ),
          );
        },
      ),
    );
  }
}


class NoteScreen extends StatefulWidget {
  final Note? note;
  final Function(Color) cucolor;
  final Function(Color) onColorSelected;
  const NoteScreen(
      {Key? key,
      this.note,
      required this.onColorSelected,
      required this.cucolor})
      : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    if (widget.note != null) {
      titleController.text = widget.note!.title;
      descriptionController.text = widget.note!.description;
    }

   return Scaffold(
  backgroundColor: Colors.grey[200],
  appBar: AppBar(
    title: Text(widget.note == null ? 'Create a note' : 'Edit Note',
      style: TextStyle(
        fontFamily: 'Open Sans',
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: Colors.blue.shade900,
  ),
  body: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: TextFormField(
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily: 'Open Sans',
            ),
            controller: titleController,
            maxLines: 1,
            decoration: const InputDecoration(
              hintText: 'Title',
              border: InputBorder.none,
              hintStyle: TextStyle(
                fontFamily: 'Open Sans',
                color: Colors.black38,
              ),
            ),
          ),
        ),
        const Divider(
          height: 2,
          color: Colors.black26,
          thickness: 2,
        ),
        const SizedBox(
          height: 20.0,
        ),
        TextFormField(
          style: const TextStyle(
            fontSize: 20.0,
            color: Colors.black,
            fontFamily: 'Open Sans',
          ),
          controller: descriptionController,
          decoration: const InputDecoration(
            hintText: 'Speak Your Heart Out',
            border: InputBorder.none,
            hintStyle: TextStyle(
              fontFamily: 'Open Sans',
              color: Colors.black38,
            ),
          ),
          keyboardType: TextInputType.multiline,
          onChanged: (str) {},
          maxLines: 5,
        ),
        const Spacer(),
         Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "red",
      child: Icon(Icons.circle),
      backgroundColor: Colors.red,
    ),
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "deepPurple",
      child: Icon(Icons.circle),
      backgroundColor: Colors.deepPurple,
    ),
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "blue",
      child: Icon(Icons.circle),
      backgroundColor: Colors.blue,
    ),
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "green",
      child: Icon(Icons.circle),
      backgroundColor: Colors.green,
    ),
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "yellow",
      child: Icon(Icons.circle),
      backgroundColor: Colors.yellow,
    ),
    FloatingActionButton(
      onPressed: () {
        setState(() {
          // Add your code to change the color
        });
      },
      heroTag: "orange",
      child: Icon(Icons.circle),
      backgroundColor: Colors.orange,
    ),
  ],
),


            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final title = titleController.value.text;
                      final description = descriptionController.value.text;

                      if (title.isEmpty || description.isEmpty) {
                        return;
                      }

                      final Note model = Note(
                          title: title,
                          description: description,
                          id: widget.note?.id);
                      if (widget.note == null) {
                        await DatabaseHelper.addNote(model);
                      } else {
                        await DatabaseHelper.updateNote(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Colors.orange.shade500,
                        ),
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.orange,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text(
                      widget.note == null ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
