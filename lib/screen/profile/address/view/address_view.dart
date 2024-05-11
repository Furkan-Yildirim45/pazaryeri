import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/widget/custom_elevated_button.dart';
import 'package:untitled/screen/profile/address/model/address_model.dart';

import '../../../../product/color/project_color.dart';
import '../../../../product/widget/general_app_bar.dart';

class AddressesView extends StatefulWidget {
  const AddressesView({super.key});

  @override
  State<AddressesView> createState() => _AddressesViewState();
}

class _AddressesViewState extends State<AddressesView> {
  final List<AddressModel> _addressItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GeneralAppBar(
          textColor: ProjectColor.apricot.getColor(),
          isLeadingActive: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: context.padding.horizontalNormal,
            child: ListView(
              children: [
                CustomElevatedButton(
                  padding: context.padding.horizontalNormal,
                    width: context.sized.width,
                    height: context.sized.dynamicHeight(0.085),
                    shape: RoundedRectangleBorder(borderRadius: context.border.normalBorderRadius),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: context.padding.onlyRightLow,
                          child: Icon(
                            Icons.location_on_outlined,
                            color: ProjectColor.apricot.getColor(),
                          ),
                        ),
                        Text('Yeni Adress Ekle',style: context.general.textTheme.titleSmall,),
                      ],
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ListView(
                            children: const [
                              AddAddressForm()
                            ],
                          );
                        },
                      );
                    },
                ),
                Container(
                  color: Colors.red,
                  height: context.sized.dynamicHeight(0.32),
                  width: double.infinity,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return _buildAddressCard(
                          context: context,
                          model: AddressModel(
                              addressTitle: "Ev",
                              address: "Örnektepe Mahallesi, 123. Sokak, No: 5, Daire: 3",
                              province: "Balıkesir",
                              district: "AltıEylül",
                          ));
                    },
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
 //todo: burda kaldın temizliceksin en son fonksiyonellikler eklenicek!
  Card _buildAddressCard({required BuildContext context,required AddressModel model}){
    return Card(
      key: Key(model.addressTitle),
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
                    model.addressTitle,
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
                    // _editAddress(model: );
                  },
                ),
              ],
            ),
            Text(model.address),
            Text("${model.province} / ${model.district}"),
          ],
        ),
      ),
    );
  }

/*
  void _editAddress({required AddressModel model}) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AddAddressForm(model: model,
            onAddressSaved: (model) {
              setState(() {
                // Güncellenen kart bilgisini bul ve güncelle
                for (int i = 0; i < _addressItems.length; i++) {
                  Widget kart = _addressItems[i];
                  if (kart is Card && kart.key == Key(model.addressTitle)) {
                    _addressItems[i] = _buildAddressCard(model: model,context: context);
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
*/
}

class AddAddressForm extends StatefulWidget {

  const AddAddressForm({super.key});

  @override
  _AddAddressFormState createState() => _AddAddressFormState();
}

class _AddAddressFormState extends State<AddAddressForm> {
  final _formKey = GlobalKey<FormState>();
/*  late TextEditingController _baslikController;
  late TextEditingController _adresController;
  late TextEditingController _ilceController;
  late TextEditingController _ilController;

  @override
  void initState() {
    super.initState();
    _baslikController = TextEditingController(text: widget.model.addressTitle);
    _adresController = TextEditingController(text: widget.model.address);
    _ilceController = TextEditingController(text: widget.model.province);
    _ilController = TextEditingController(text: widget.model.district);
  }*/

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
                    // controller: _baslikController,
                    decoration: InputDecoration(labelText: 'Başlık'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir başlık girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _adresController,
                    decoration: InputDecoration(labelText: 'Adres'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir adres girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _ilceController,
                    decoration: InputDecoration(labelText: 'İlçe'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Lütfen bir ilçe girin';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    // controller: _ilController,
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
                      /*if (_formKey.currentState!.validate()) {
                        widget.onAddressSaved(
                          _baslikController.text,
                          _adresController.text,
                          _ilceController.text,
                          _ilController.text,
                        );
                        // Navigator.pop(context); // Formu kapat
                      }*/
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