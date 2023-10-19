import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;

import 'dropdown_single_form_builder.dart';

class ThinkFormModel {
  final String name;
  final FieldType type;
  final bool? required;
  final String? errorText;
  final String? hintText;
  TextEditingController? textEditingController;
  List? dropDownListString;
  final bool? dropDownSearchable;
  void  Function(Object? value)? onChanged;
  InputDecoration? inputDecoration;
  final String? attributeName;
  final String? datePickerFormat;

  ThinkFormModel({
    required this.name,
    required this.type,
    this.required,
    this.errorText,
    this.textEditingController,
    this.hintText,
    this.dropDownListString,
    this.dropDownSearchable,
    this.onChanged,
    this.inputDecoration,
    this.attributeName,
    this.datePickerFormat,
  });
}
enum FieldType{
  email,
  password,
  normalText,
  dropdownSingleSelection,
  egyptianNationalID,
  datePicker,
  textNumberOnly,
  checkBox
}

List<Widget> convertToWidgets(List<ThinkFormModel> items) {
  List<Widget> widgets = [];
  for (var element in items) {
    element.textEditingController ??= TextEditingController();
    if (element.type == FieldType.email) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? true)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderTextField(

            name: element.attributeName ?? element.name,
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ?? InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? true) FormBuilderValidators.required(errorText: element.errorText),
              FormBuilderValidators.email(errorText: element.errorText),
            ]),
          ),
        ],
      ));
    }
    else if (element.type == FieldType.password) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? true)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderTextField(

            name: element.attributeName ?? element.name,
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ??InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            obscureText: true,
            validator: FormBuilderValidators.compose([
              if(element.required ?? true) FormBuilderValidators.required(),
            ]),
          ),
        ],
      ));
    }
    else if (element.type == FieldType.normalText) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? false)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderTextField(

            name: element.attributeName ?? element.name,
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ??InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
            ]),
          ),
        ],
      ));
    }
    else if (element.type == FieldType.dropdownSingleSelection) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? false)const Text('*'),
                const Text(':'),
              ],
            ),
          ),

          FormBuilderDropdownSingleSelect<String>(
            isDense: true,
            name: element.attributeName ?? element.name,
            searchable: element.dropDownSearchable,
            // onChanged: element.onChanged,
            // restorationId: element.name,
            decoration: element.inputDecoration ??InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
            ]),
            items: element.dropDownListString?.map((e) => DropdownMenuItem<String>(value: e, child: Text(e),)).toList() ?? [],
          ),
        ],
      ));
    }
    else if (element.type == FieldType.egyptianNationalID) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? true)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderTextField(
            name: element.attributeName ?? element.name,
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ?? InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? true) FormBuilderValidators.required(errorText: element.errorText),
              FormBuilderValidators.match(r'^(2|3)[0-9][0-9][0-1][0-9][0-3][0-9](01|02|03|04|11|12|13|14|15|16|17|18|19|21|22|23|24|25|26|27|28|29|31|32|33|34|35|88)\d\d\d\d\d',errorText: element.errorText),
            ]),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(14),
            ],
          ),
        ],
      ));
    }
    else if (element.type == FieldType.datePicker) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? true)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderDateTimePicker(
            name: element.attributeName ?? element.name,
            initialEntryMode: DatePickerEntryMode.calendarOnly,
            inputType: InputType.date,
            format: intl.DateFormat(element.datePickerFormat ?? 'dd-MM-yyyy'),
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ?? InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? true) FormBuilderValidators.required(errorText: element.errorText),
            ]),
          ),
        ],
      ));
    }
    else if (element.type == FieldType.textNumberOnly) {
      widgets.add(Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 8, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(element.name),
                if(element.required ?? false)const Text('*'),
                const Text(':'),
              ],
            ),
          ),
          FormBuilderTextField(

            name: element.attributeName ?? element.name,
            // restorationId: element.name,
            controller: element.textEditingController,
            decoration: element.inputDecoration ??InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(10),
              errorText: null,
              prefixIconConstraints:
              const BoxConstraints(),
              hintStyle: const TextStyle(
                  color: Color(0x30171725)),
              filled: true,
              isDense: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              enabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
              disabledBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                  borderSide: const BorderSide(
                      style: BorderStyle.none)),
            ),
            validator: FormBuilderValidators.compose([
              if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
            ]),
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
        ],
      ));
    }
    else if (element.type == FieldType.checkBox) {
      widgets.add(Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //       left: 8.0, right: 8, bottom: 8),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Text(element.name),
          //       if(element.required ?? false)const Text('*'),
          //       const Text(':'),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0,bottom: 14.0),
            child: FormBuilderCheckbox(
              name: element.attributeName ?? element.name,
              // restorationId: element.name,
              decoration: element.inputDecoration ??InputDecoration(
                floatingLabelAlignment:
                FloatingLabelAlignment.start,
                hintText: element.hintText ?? element.name,
                contentPadding:
                const EdgeInsets.all(10),
                errorText: null,
                prefixIconConstraints:
                const BoxConstraints(),
                hintStyle: const TextStyle(
                    color: Color(0x30171725)),
                filled: true,
                isDense: true,
                fillColor: Colors.grey.shade200,
                border: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        style: BorderStyle.none)),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        style: BorderStyle.none)),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        style: BorderStyle.none)),
                disabledBorder: OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        style: BorderStyle.none)),
              ),
              validator: FormBuilderValidators.compose([
                if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
              ]),
              title:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(element.name),
                ],
              ),
            ),
          ),
        ],
      ));
    }
  }
  return widgets;
}