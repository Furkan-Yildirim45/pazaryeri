
import 'package:Pazaryeri/product/controller/product_widget_controller/custom_dropdown_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import '../../../../screen/basic/create_profile/controller/create_profile_controller.dart';
import '../../../../screen/basic/create_profile/view/create_profile_view.dart';

mixin CreateProfileUtility on State<CreateProfileView>{
  final CreateProfileController createProfileController = Get.put(CreateProfileController());
  final DropdownController<String> genderController = DropdownController<String>();
  final DropdownController<String> educationController = DropdownController<String>();
  final DropdownController<String> hobbiesController = DropdownController<String>();

  Column dateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.padding.onlyTopNormal,
          child: Text('Dogum Tarihiniz',style: context.general
              .textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500,color: Colors.grey),),
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() => _buildDropDown(widget: buildDayDropdown())),
              Obx(() => _buildDropDown(widget: buildMonthDropdown())),
              Obx(() => _buildDropDown(widget: buildYearDropdown())),
            ],
          ),
        ),
      ],
    );
  }

  Container buildDayDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: DropdownButton<int>(
        menuMaxHeight: context.height * 0.5,
        isExpanded: true,
        icon: const SizedBox.shrink(),
        value: createProfileController.selectedDay.value,
        onChanged: (value) {
          createProfileController.updateSelectedDay(value!);
        },
        underline: const SizedBox.shrink(),
        items: List.generate(
          31,
              (index) => DropdownMenuItem<int>(
            value: index + 1,
            child: Center(child: Text('${index + 1}')),
          ),
        ),
      ),
    );
  }

  Container buildMonthDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: DropdownButton<int>(
                menuMaxHeight: context.height * 0.5,
        isExpanded: true,
        icon: const SizedBox.shrink(),
        value: createProfileController.selectedMonth.value,
        underline: const SizedBox.shrink(),
        onChanged: (value) {
          createProfileController.updateSelectedMonth(value!);
        },
        items: List.generate(
          12,
              (index) => DropdownMenuItem<int>(
            value: index + 1,
            child: Center(child: Text('${index + 1}')),
          ),
        ),
      ),
    );
  }

  Container buildYearDropdown() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.border.normalBorderRadius,
      ),
      child: DropdownButton<int>(
        menuMaxHeight: context.height * 0.5,
        isExpanded: true,
        icon: const SizedBox.shrink(),
        underline: const SizedBox.shrink(),
        value: createProfileController.selectedYear.value,
        onChanged: (value) {
          createProfileController.updateSelectedYear(value!);
        },
        items: List.generate(
          100,
              (index) => DropdownMenuItem<int>(
            value: DateTime.now().year - index,
            child: Center(child: Text('${DateTime.now().year - index}')),
          ),
        ),
      ),
    );
  }
  

  
Padding customTextFormField(
  BuildContext context, {
  required String text,
  required String? Function(String?) validator,
  required void Function(String?)? onSaved,
  required TextEditingController controller,
}) {
  return Padding(
      padding: context.padding.onlyTopNormal,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(text,style: context.general.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w500,color: Colors.grey
          ),),
        Container(
            margin: context.padding.onlyTopLow,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F1F1),
              borderRadius: context.border.normalBorderRadius, // Border radius
          ),
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                contentPadding: context.padding.onlyLeftNormal,
              border: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue, width: 2),
                  borderRadius: context.border.normalBorderRadius, // Border radius
              ),
              errorStyle: const TextStyle(height: 0),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ],
    ),
  );
}

  Padding createProfileText(BuildContext context) {
    return Padding(
      padding: context.padding.onlyTopMedium,
      child: Text(
        'Profilini Oluştur.',
        style: context.general.textTheme.titleMedium,
      ),
    );
  }

  Container _buildDropDown({required Widget widget}) {
    return Container(
        width: context.sized.dynamicWidth(0.24),
        height: context.height * 0.07,
        decoration: BoxDecoration(
          color: const Color(0xFFF1F1F1),
          borderRadius: context.border.normalBorderRadius,
        ),
        child: Center(child: widget)
    );
  }

}