
import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';


void main() {
  runApp(Fovariler());
}

class Fovariler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: CustomAppBar(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
                            Icons.search,
                            color: Color(0xFFF2A663),
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Fovarilerde ara",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                    2, // Toplamda 2 konteynar olacak şekilde belirtiyoruz
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 90, // Kart boyutunu küçültüyoruz
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width:
                                    75, // Resim alanının genişliğini belirliyoruz
                                    child: ClipRRect(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            // Resme tıklandığında yapılacak işlemler
                                          },
                                          child: Image(
                                            width: 75,
                                            height: 75,
                                            image: AssetImage(
                                                'assets/9.png'), // Örnek bir resim
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          // Ürün adı
                                          Text(
                                            'XXX Erkek Parfüm', // Örnek bir ürün adı
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          // Ürün fiyatı
                                          Text(
                                            '\$${(index + 1) * 10}.99', // Örnek bir fiyat
                                            style: TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(height: 5),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Kargo Bedava',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 11),
                                                ),
                                                Text(
                                                  'Hızlı Teslimat',
                                                  style: TextStyle(
                                                      color: Colors.blueGrey,
                                                      fontSize: 11),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Sepete ekle butonuna basıldığında yapılacak işlemler
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all(Color(0xFFF5B97B)),
                                ),
                                child: Text(
                                  'Sepete Ekle',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
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