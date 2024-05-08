
import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';

void main() {
  runApp(AramaSonucu());
}

class AramaSonucu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                                Icons.search,
                                color: Color(0xFFF2A663),
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText:
                                  "İstediğiniz ürünü ve kategoriyi aratabilirsiniz",
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Ters yön butonuna basıldığında yapılacak işlemler
                          },
                          icon: Icon(
                            Icons.swap_vert,
                            color: Color(0xFFF2A663),
                          ),
                          label: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Sırala',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Menü butonuna basıldığında yapılacak işlemler
                          },
                          icon: Icon(
                            Icons.menu,
                            color: Color(0xFFF2A663),
                          ),
                          label: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Filtrele',
                              style: TextStyle(color: Colors.blueGrey),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                          context,
                          AssetImage('assets/9.png'),
                          'XXX Erkek Parfümü',
                          '\$19.99'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildProductCard(
                          context,
                          AssetImage('assets/9.png'),
                          'YYY Kadın Parfüm',
                          '\$29.99'),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildProductCard(
                          context,
                          AssetImage('assets/9.png'),
                          'ZZZ Erkek Parfümü',
                          '\$39.99'),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildProductCard(
                          context,
                          AssetImage('assets/9.png'),
                          'TTT Kadın Parfüm',
                          '\$49.99'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, ImageProvider image, String title, String price) {
    return Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Resim
              SizedBox(
                height: 150, // Card boyutunu küçültüyoruz
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Yazı
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ürün adı
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 12, // Yazı boyutunu küçültüyoruz
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    // Ürün fiyatı
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              // Buton
              Padding(
                padding: const EdgeInsets.only(right: 0, left: 40),
                child: ElevatedButton(
                  onPressed: () {
                    // Ürün detaylarına gitme işlemleri
                  },
                  child: Text(
                    'İncele',
                    style: TextStyle(color: Colors.blueGrey, fontSize: 11),
                  ),
                ),
              ),
            ],
          ),
        );
    }
}