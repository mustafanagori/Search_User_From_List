import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List<Map<String, dynamic>> users = [
    {"id": 1, "name": " anus", "age": 29},
    {"id": 2, "name": " ali", "age": 34},
    {"id": 3, "name": " raza", "age": 67},
    {"id": 4, "name": " Nasir", "age": 56},
    {"id": 5, "name": " yasir", "age": 35},
    {"id": 6, "name": " azhar", "age": 76},
    {"id": 7, "name": " ismail", "age": 23},
    {"id": 8, "name": " usman", "age": 16},
    {"id": 9, "name": " aslam", "age": 35},
    {"id": 10, "name": " azhar", "age": 76},
    {"id": 11, "name": " Hamza", "age": 23},
    {"id": 12, "name": " Saad", "age": 16},
  ];

  List<Map<String, dynamic>> search = [];

  @override
  void initState() {
    search = users; // Use the assignment operator
    super.initState();
  }

  void searcFun(String query) {
    List<Map<String, dynamic>> results = [];
    if (query.isEmpty) {
      results = users;
    } else {
      results = users
          .where((user) =>
              user["name"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    setState(() {
      search = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          centerTitle: true,
          title: const Text(
            "Search From List",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  onChanged: (value) => searcFun(value),
                  decoration: InputDecoration(
                    hintText: "Search the user",
                    focusColor: Colors.black38,
                    prefixIcon: const Icon(Icons.search),
                    contentPadding: const EdgeInsets.all(20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.black38,
                          width: 2.0), // Set border color when focused
                      borderRadius: BorderRadius.circular(40),
                    ),
                    // Apply text color when entered
                  ),
                  cursorWidth: 1.0,
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.black38, // Color of the cursor
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: search.length,
                itemBuilder: (context, index) {
                  return Card(
                    key: ValueKey(search[index]["id"]),
                    color: Colors.black12,
                    elevation: 2,
                    child: ListTile(
                      leading: Text(
                        search[index]["id"].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      title: Text(
                        search[index]["name"].toString(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      subtitle: Text(
                        "${search[index]["age"].toString()} year Old",
                        style: const TextStyle(
                            color: Colors.black54, fontSize: 16),
                      ),
                      trailing: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ));
  }
}
