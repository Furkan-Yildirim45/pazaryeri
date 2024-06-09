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
        createProfileController.floatActionOnPressed(context);
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
                  Padding(
                    padding: context.padding.onlyTopMedium,
                    child: marketPlaceTitle(context),
                  ),
                  createProfileText(context),
                  Form(
                    key: createProfileController.getFormKey,
                    child: Column(
                      children: <Widget>[
                        customTextFormField(context, text: 'Adınız', controller: createProfileController.nameController, onSaved: createProfileController.updateName, validator: createProfileController.nameValidator,),
                        customTextFormField(context, text: 'Soyadınız', controller: createProfileController.lastnameController, onSaved: createProfileController.updateLastname,validator: createProfileController.lastNameValidator),
                        dateSelector(),
                        CustomPopupMenuButton(
                          controller: genderController,
                          items: const [
                            PopupMenuItem(
                            value: "Erkek",
                            child: Text("Erkek"),
                          ),
                          PopupMenuItem(
                            value: "Kadın",
                            child: Text("Kadın"),
                          ),
                          PopupMenuItem(
                            value: "Diğer",
                            child: Text("Diğer"),
                          ),
                           ],
                          text: "Cinsiyet",
                        ),
                        customTextFormField(
                          validator: createProfileController.emailValidator,
                          context,
                          text: 'Email Adresi ',
                          controller: createProfileController.emailController,
                          onSaved: createProfileController.updateHobbies,
                        ),
                        CustomPopupMenuButton(
                          controller: educationController,
                          items: const [
                          PopupMenuItem(
                            value: "İlkokul",
                            child: Text("İlkokul"),
                          ),
                          PopupMenuItem(
                            value: "Ortaokul",
                            child: Text("Ortaokul"),
                          ),
                          PopupMenuItem(
                            value: "Lise",
                            child: Text("Lise"),
                          ),
                          PopupMenuItem(
                            value: "Üniversite",
                            child: Text("Üniversite"),
                          ),
                          PopupMenuItem(
                            value: "Yüksek Lisans",
                            child: Text("Yüksek Lisans"),
                          ),
                          PopupMenuItem(
                            value: "Doktora",
                            child: Text("Doktora"),
                          ),
                          PopupMenuItem(
                            value: "Diğer",
                            child: Text("Diğer"),
                          ),
                        ],
                          text: "Eğitim Durumunuz",
                        ),
                        CustomPopupMenuButton(
                          controller: hobbiesController,
                           items: const [
                          PopupMenuItem(
                            value: "Yüzme",
                            child: Text("Yüzme"),
                          ),
                          PopupMenuItem(
                            value: "Koşu",
                            child: Text("Koşu"),
                          ),
                          PopupMenuItem(
                            value: "Okuma",
                            child: Text("Okuma"),
                          ),
                          PopupMenuItem(
                            value: "Seyahat",
                            child: Text("Seyahat"),
                          ),
                          PopupMenuItem(
                            value: "Diğer",
                            child: Text("Diğer"),
                          ),
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
