import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';


void main() {
  runApp(Sepet());
}

class Sepet extends StatelessWidget {
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
                              hintText: "Favorilerde ara",
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
                Card(
                  elevation: 2,
                  margin: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Satıcı: ',
                              style:
                              TextStyle(fontSize: 14, color: Colors.blueGrey),
                            ),
                            Text(
                              'Ege Avcı',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                SizedBox(width: 180),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Background color
                                    borderRadius:
                                    BorderRadius.circular(10), // Oval shape
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    '5.0', // Rating value
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white, // Text color
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 100, // Kart boyutunu küçültüyoruz
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 100,
                                  height:
                                  100, // Resim alanının genişliğini belirliyoruz
                                  child: ClipRRect(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
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
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                          '\$10.99', // Örnek bir fiyat
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
                        ],
                      ),
                    ],
                  ),
                ),
                Spacer(), // Boşluğu en alta itmek için Spacer kullandık
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '\$10.99',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Toplam Tutar',
                              style:
                              TextStyle(fontSize: 14, color: Colors.blueGrey),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Alışverişi tamamla butonuna basıldığında yapılacak işlemler
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all(Color(0xFFF5B97B)),
                          minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        ),
                        child: Text(
                          'Alışverişi Tamamla',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ),
        );
    }
}