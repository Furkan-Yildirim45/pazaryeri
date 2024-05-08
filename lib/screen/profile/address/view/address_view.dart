import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';

void main() {
  runApp(Adreslerim());
}

class Adreslerim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavigationBar(),
        body: Adresler(),
      ),
    );
  }
}


class Adresler extends StatefulWidget {
  @override
  _AdreslerState createState() => _AdreslerState();
}

class _AdreslerState extends State<Adresler> {
  List<Widget> _adresKartlari = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ElevatedButton.icon(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: AdresEkleFormu(
                      onAdresSaved: (String baslik, String adres, String ilce,
                          String il) {
                        setState(() {
                          _adresKartlari.add(
                            _buildAddressCard(baslik, adres, ilce, il),
                          );
                        });
                      },
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.add_location,
              color: Color(0xFFF2BC8D),
            ),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Text(
                'Yeni Adres Ekle',
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _adresKartlari.length,
            itemBuilder: (context, index) {
              return _adresKartlari[index];
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddressCard(
      String baslik, String adres, String ilce, String il) {
    return Card(
      key: Key(baslik),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Color(0xFFF2BC8D),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    baslik,
                    style:
                    TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.blueGrey,
                  ),
                  onPressed: () {
                    _editAddress(baslik, adres, ilce, il);
                  },
                ),
              ],
            ),
            Text(adres),
            Text("$ilce / $il"),
          ],
        ),
      ),
    );
  }

  void _editAddress(String baslik, String adres, String ilce, String il) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AdresEkleFormu(
            baslik: baslik,
            adres: adres,
            ilce: ilce,
            il: il,
            onAdresSaved:
                (String baslik, String adres, String ilce, String il) {
              setState(() {
                // Güncellenen kart bilgisini bul ve güncelle
                for (int i = 0; i < _adresKartlari.length; i++) {
                  Widget kart = _adresKartlari[i];
                  if (kart is Card && kart.key == Key(baslik)) {
                    _adresKartlari[i] =
                        _buildAddressCard(baslik, adres, ilce, il);
                    break; // Kart bulundu, döngüden çık
                  }
                }
              });
              Navigator.pop(context); // Formu kapat
            },
          ),
        );
      },
    );
  }
}

class AdresEkleFormu extends StatefulWidget {
  final Function(String, String, String, String) onAdresSaved;
  final String? baslik;
  final String? adres;
  final String? ilce;
  final String? il;

  const AdresEkleFormu({
    Key? key,
    required this.onAdresSaved,
    this.baslik,
    this.adres,
    this.ilce,
    this.il,
  }) : super(key: key);

  @override
  _AdresEkleFormuState createState() => _AdresEkleFormuState();
}

class _AdresEkleFormuState extends State<AdresEkleFormu> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _baslikController;
  late TextEditingController _adresController;
  late TextEditingController _ilceController;
  late TextEditingController _ilController;

  @override
  void initState() {
    super.initState();
    _baslikController = TextEditingController(text: widget.baslik);
    _adresController = TextEditingController(text: widget.adres);
    _ilceController = TextEditingController(text: widget.ilce);
    _ilController = TextEditingController(text: widget.il);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize:
                MainAxisSize.min, // Formun boyutu içeriği kadar olacak
                children: [
                  TextFormField(
                    controller: _baslikController,
                    decoration: InputDecoration(labelText: 'Başlık'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir başlık girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _adresController,
                    decoration: InputDecoration(labelText: 'Adres'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir adres girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ilceController,
                    decoration: InputDecoration(labelText: 'İlçe'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir ilçe girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _ilController,
                    decoration: InputDecoration(labelText: 'İl'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir il girin';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onAdresSaved(
                          _baslikController.text,
                          _adresController.text,
                          _ilceController.text,
                          _ilController.text,
                        );
                        // Navigator.pop(context); // Formu kapat
                      }
                    },
                    child: Text('Kaydet'),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}