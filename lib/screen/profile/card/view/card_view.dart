import 'package:flutter/material.dart';

import '../../../../product/widget/common_widget.dart';

void main() {
  runApp(Kartlarim());
}

class Kartlarim extends StatelessWidget {
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
                    child: KartEkleFormu(
                      onAdresSaved: (String baslik, String kartNumarasi,
                          String kartTipi) {
                        setState(() {
                          _adresKartlari.add(
                            _buildAddressCard(baslik, kartNumarasi, kartTipi),
                          );
                        });
                      },
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.add,
              color: Color(0xFFF2BC8D),
            ),
            label: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Text(
                'Yeni Kart Ekle',
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
      String baslik, String kartNumarasi, String kartTipi) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Image.asset(
                    kartTipi == "Visa"
                        ? 'assets/visa.png'
                        : 'assets/mastercard.png',
                    width: 75,
                    height: 75,
                  ),
                  SizedBox(width: 15.0),
                  Expanded(
                    child: Text(
                      baslik,
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: KartEkleFormu(
                              onAdresSaved: (String baslik, String kartNumarasi,
                                  String kartTipi) {
                                setState(() {
                                  // Güncelleme yapılacak
                                });
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Text(
                kartNumarasi.replaceAllMapped(
                    RegExp(r".{3}"), (match) => "${match.group(0)}-"),
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KartEkleFormu extends StatefulWidget {
  final Function(String, String, String) onAdresSaved;

  const KartEkleFormu({Key? key, required this.onAdresSaved}) : super(key: key);

  @override
  _KartEkleFormuState createState() => _KartEkleFormuState();
}

class _KartEkleFormuState extends State<KartEkleFormu> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _baslikController;
  late TextEditingController _kartNumarasiController;
  String _selectedKartTipi = 'Visa';

  @override
  void initState() {
    super.initState();
    _baslikController = TextEditingController();
    _kartNumarasiController = TextEditingController();
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
                    controller: _kartNumarasiController,
                    decoration: InputDecoration(labelText: 'Kart Numarası'),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length != 16) {
                        return 'Lütfen geçerli bir kart numarası girin';
                      }
                      return null;
                    },
                  ),
                  DropdownButtonFormField<String>(
                    value: _selectedKartTipi,
                    decoration: InputDecoration(labelText: 'Kart Tipi'),
                    items: <String>['Visa', 'MasterCard'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _selectedKartTipi = value!;
                      });
                    },
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.onAdresSaved(
                          _baslikController.text,
                          _kartNumarasiController.text,
                          _selectedKartTipi,
                        );
                        Navigator.pop(context); // Formu kapat
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