
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../screen/basic/create_profile/view/create_profile_view.dart';
import '../../color/project_color.dart';

mixin CreateProfileUtility on State<CreateProfileView>{
  final formKey = GlobalKey<FormState>();
  late String name, lastname, hobbies;
  int selectedDay = 1;
  int selectedMonth = 1;
  int selectedYear = 2000;
  List<int> daysInMonth = [];

  Column dateSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: context.padding.onlyTopNormal,
          child: Text('Dogum Tarihiniz',style: context.general
              .textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),),
        ),
        Padding(
          padding: context.padding.onlyTopLow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildDropDown(widget: buildDayDropdown()),
              _buildDropDown(widget: buildMonthDropdown()),
              _buildDropDown(widget: buildYearDropdown()),
            ],
          ),
        ),
      ],
    );
  }

  Container _buildDropDown({required Widget widget}) {
    return Container(
            width: context.sized.dynamicWidth(0.24),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F1F1),
                borderRadius: context.border.normalBorderRadius,
              ),
              child: Center(child: widget)
          );
  }

  DropdownButton<int> buildDayDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      value: 1,
      onChanged: (value) {
        setState(() {
          selectedDay = value!;
        });
      },
      underline: const SizedBox.shrink(),
      items: List.generate(
        31,
            (index) => DropdownMenuItem<int>(
          value: index + 1,
          child: Text('${index + 1}'),
        ),
      ),
    );
  }

  DropdownButton<int> buildMonthDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      value: 1,
      underline: const SizedBox.shrink(),
      onChanged: (value) {
        setState(() {
          selectedMonth = value!;
          updateDaysInMonth(selectedMonth);
          if (selectedDay > daysInMonth.length) {
            selectedDay = 1;
          }
        });
      },
      items: List.generate(
        12,
            (index) => DropdownMenuItem<int>(
          value: index + 1,
          child: Text('${index + 1}'),
        ),
      ),
    );
  }

  DropdownButton<int> buildYearDropdown() {
    return DropdownButton<int>(
      iconEnabledColor: ProjectColor.apricot.getColor(),
      underline: const SizedBox.shrink(),
      value: DateTime.now().year,
      onChanged: (value) {
        setState(() {
          selectedYear = value!;
        });
      },
      items: List.generate(
        100,
            (index) => DropdownMenuItem<int>(
          value: DateTime.now().year - index,
          child: Text('${DateTime.now().year - index}'),
        ),
      ),
    );
  }

  void updateDaysInMonth(int month) {
    int days = DateTime(selectedYear, month + 1, 0).day;
    setState(() {
      daysInMonth = List.generate(days, (index) => index + 1);
    });
  }

  Container customTextFormField(
      BuildContext context, {
        required String labelText,
        required String? Function(String?) validator,
        required void Function(String?)? onSaved,
        required TextEditingController controller,
      }) {
    return Container(
      margin: context.padding.onlyTopNormal,
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: context.border.normalBorderRadius, // Border radius
      ),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          contentPadding: context.padding.onlyLeftNormal,
          labelText: labelText,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.blue, width: 2),
            borderRadius: context.border.normalBorderRadius, // Border radius
          ),
        ),
        validator: validator,
        onSaved: onSaved,
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
}



//todo: Dropdownlarda getx ile state yönetimi yapılıcak! (bug var değişmiyor) ama gender değşişiyor