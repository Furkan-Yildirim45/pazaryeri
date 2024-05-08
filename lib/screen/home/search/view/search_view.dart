

import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';

void main() {
  runApp(Arama());
}

class Arama extends StatefulWidget {
  @override
  _AramaState createState() => _AramaState();
}

class _AramaState extends State<Arama> {
  List<String> arananKelimeler = [];
  TextEditingController aramaController = TextEditingController();

  void _aramaYap(String kelime) {
    setState(() {
      // Aranan kelime listesine ekle
      arananKelimeler.add(kelime);
      // Arama kutusunu temizle
      aramaController.clear();
    });
  }

  void _sil(int index) {
    setState(() {
      // Belirli bir indeksteki kelimeyi sil
      arananKelimeler.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            extendBody: true,
            appBar: CustomAppBar(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Icon(
                                    Icons.arrow_back_outlined,
                                    color: Color(0xFFF2A663),
                                  ),
                                ),
                                SizedBox(width: 15),
                                Expanded(
                                  child: TextField(
                                    controller: aramaController,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Arama",
                                      hintStyle: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    onSubmitted: (kelime) {
                                      _aramaYap(kelime);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      constraints: BoxConstraints(maxHeight: 300),
                      child: ListView.builder(
                        itemCount: arananKelimeler.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.clear),
                                    onPressed: () {
                                      _sil(index);
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    arananKelimeler[index],
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
           ),
        );
    }
}