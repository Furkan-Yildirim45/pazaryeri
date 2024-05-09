import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:untitled/product/utility/page_utility/basic/create_profile_utility.dart';
import 'package:untitled/product/utility/page_utility/basic/welcome_utility.dart';
import 'package:untitled/screen/main_page/view/main_page_view.dart';

import '../../../../product/widget/custom_dropdown_button.dart';


class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  _CreateProfileViewState createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView>
    with WelcomeUtility,CreateProfileUtility {

  @override
  void initState() {
    super.initState();
    updateDaysInMonth(selectedMonth);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context, text: "Devam Et", onPressed: () {
        context.route.navigateToPage(const MainPageView());
      }),
      body: SafeArea(
        child: Padding(
          padding: context.padding.horizontalMedium,
          child: ListView(
            children: [
              marketPlaceTitle(context),
              createProfileText(context),
              Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    customTextFormField(context, labelText: 'Adınız', controller: TextEditingController(),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Adınızı giriniz';
                        }
                        return null;
                      }, onSaved: (value) => name = value ?? "",),
                    customTextFormField(context, labelText: 'Soyadınız', controller: TextEditingController(),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Soyadınızı giriniz';
                        }
                        return null;
                      }, onSaved: (value) => lastname = value ?? "",),
                    dateSelector(),
                    const CustomDropDownButton<String>(items: ["Erkek","Kadın","Diğer"],text: "Cinsiyet",),
                    customTextFormField(context, labelText: 'Email Adresi ', controller: TextEditingController(),
                      validator: (value) {
                        if (value?.isEmpty ?? false) {
                          return 'Hobilerinizi giriniz';
                        }
                        return null;
                      }, onSaved: (value) => hobbies = value ?? "",),
                    const CustomDropDownButton(items: [
                      'İlkokul',
                      'Ortaokul',
                      'Lise',
                      'Üniversite',
                      'Yüksek Lisans',
                      'Doktora',
                      'Diğer',
                    ], text: "Eğitim Durumunuz"),
                    const CustomDropDownButton(items: [
                      'Spor',
                      'Yemek Yemek',
                      'Kitap Okumak',
                      'Müzik Dinlemek',
                      'Seyahat Etmek',
                      'Resim Çizmek',
                      'Dans Etmek',
                      'Bahçe İşleri',
                      'Diğer',
                    ], text: "Hobilerinizi Ekleyiniz"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
