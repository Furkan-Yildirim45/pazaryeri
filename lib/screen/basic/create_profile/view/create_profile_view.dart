import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../product/utility/page_utility/basic/create_profile_utility.dart';
import '../../../../product/utility/page_utility/basic/welcome_utility.dart';
import '../../../../product/widget/custom_dropdown_button.dart';
import '../controller/create_profile_controller.dart';


class CreateProfileView extends StatefulWidget {
  const CreateProfileView({super.key});

  @override
  State<CreateProfileView> createState() => _CreateProfileViewState();
}

class _CreateProfileViewState extends State<CreateProfileView> with WelcomeUtility,CreateProfileUtility {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatActionButton(context, text: "Devam Et", onPressed: () {
        controller.floatActionOnPressed(context);
      },),
      body: GetBuilder<CreateProfileController>(
        builder: (_) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: context.sized.normalValue,
              right: context.sized.normalValue,
              bottom: context.height * 0.2
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  marketPlaceTitle(context),
                  createProfileText(context),
                  Form(
                    key: controller.getFormKey,
                    child: Column(
                      children: <Widget>[
                        customTextFormField(context, text: 'Adınız', controller: controller.nameController, validator: controller.nameValidator, onSaved: controller.updateName,),
                        customTextFormField(context, text: 'Soyadınız', controller: controller.lastnameController, validator: controller.lastNameValidator, onSaved: controller.updateLastname,),
                        dateSelector(),
                        CustomDropDownButton<String>(
                          items: const ["Erkek", "Kadın", "Diğer"],
                          text: "Cinsiyet",
                        ),
                        customTextFormField(
                          context,
                          text: 'Email Adresi ',
                          controller: controller.emailController,
                          validator: controller.emailValidator,
                          onSaved: controller.updateHobbies,
                        ),
                        CustomDropDownButton(
                          items: const [
                            'İlkokul',
                            'Ortaokul',
                            'Lise',
                            'Üniversite',
                            'Yüksek Lisans',
                            'Doktora',
                            'Diğer',
                          ],
                          text: "Eğitim Durumunuz",
                        ),
                        CustomDropDownButton(
                          items: const [
                            'Sport',
                            'Yemek Yemek',
                            'Kitap Okumak',
                            'Müzik Dinlemek',
                            'Seyahat Etmek',
                            'Resim Çizmek',
                            'Dans Etmek',
                            'Bahçe İşleri',
                            'Diğer',
                          ],
                          text: "Hobilerinizi Ekleyiniz",
                        ),
                      ],
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
