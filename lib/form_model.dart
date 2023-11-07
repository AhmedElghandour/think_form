import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;
import 'package:think_form/resources/adaptive.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'dropdown_multi_form_builder.dart';
import 'dropdown_single_form_builder.dart';
class ThinkFormBox{
  final List<ThinkFormModel>? items;
  final String? title;
  final int? crossAxisCount;
  final Widget? titleWidget;
  bool addTitle;
  ThinkFormBox({this.items,this.title,this.crossAxisCount,this.titleWidget,this.addTitle = true});
}

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
  final  Function? onUploadImage;
  final bool? enabled;
  final List<ThinkFormModel>? items;

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
    this.onUploadImage,
    this.enabled,
    this.items,
  });
}
enum FieldType{
  email,
  password,
  normalText,
  dropdownSingleSelection,
  dropdownMultiSelection,
  egyptianNationalID,
  datePicker,
  textNumberOnly,
  checkBox,
  uploadImage,
  uploadMultiImage,
  phone,
  empty,
  multiFields
}

List<Widget> convertBoxToWidgets(List<ThinkFormBox> items,Map<String,dynamic> initializeValue,BuildContext context) {
  List<Widget> widgets = [];
  for(ThinkFormBox element in items){
    if(element.addTitle) {
      widgets.add(
        element.titleWidget ?? Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(10),
            margin:
                const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFFF1F1F5)),
            child:  Text(
              element.title??'فقرة',
              style: const TextStyle(
                  color: Color(0xFF171725),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )),);
    }
    widgets.add(
      AlignedGridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: (kIsWeb && isDisplayDesktop(context)) ? (element.crossAxisCount ?? 2) : 1,
        // crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 50,
        itemCount: element.items?.length,
        shrinkWrap: true,
        // addRepaintBoundaries: true,
        physics: const NeverScrollableScrollPhysics(),
        // addAutomaticKeepAlives: true,
        itemBuilder: (context, index) {
          // if(!(_formKey.currentState?.fields.containsKey(widget.items[index].name) ?? true)){
          return convertWidgetItem(element.items![index], initializeValue);
          // }
          // return null;

        },
      ),
    );
  }
  return widgets;
}
Widget convertWidgetItem(ThinkFormModel element,Map<String,dynamic> initializeValue,) {
  element.textEditingController ??= TextEditingController();
  if (element.type == FieldType.email) {
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          enabled: element.enabled ?? true,
          // restorationId: element.name,
          onChanged: element.onChanged,
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
            if(element.required ?? true) FormBuilderValidators.required(
                errorText: element.errorText),
            FormBuilderValidators.email(errorText: element.errorText),
          ]),
        ),
      ],
    ));
  }
  else if (element.type == FieldType.password) {
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          enabled: element.enabled ?? true,
          onChanged: element.onChanged,
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
          obscureText: true,
          validator: FormBuilderValidators.compose([
            if(element.required ?? true) FormBuilderValidators.required(),
          ]),
        ),
      ],
    ));
  }
  else if (element.type == FieldType.normalText) {
    // element.textEditingController?.text =
    //     initializeValue[element.attributeName ?? element.name] ?? "";
    // print(formKey.currentState?.value[element.attributeName ?? element.name]);
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    // element.textEditingController?.text =
    //     initializeValue[element.attributeName ?? element.name] ??  "" ;
    return (Wrap(
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
          // initialValue: "Ahmed",
          enabled: element.enabled ?? true,
          onChanged: element.onChanged,
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
            if(element.required ?? false) FormBuilderValidators.required(
                errorText: element.errorText),
          ]),
        ),
      ],
    ));
  }
  else if (element.type == FieldType.dropdownSingleSelection) {

    return (Wrap(
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
          initialValue: initializeValue[element.attributeName ?? element.name] ?? "",
          isDense: true,
          name: element.attributeName ?? element.name,
          searchable: element.dropDownSearchable,
          onChanged: element.onChanged,
          enabled: element.enabled ?? true,
          // restorationId: element.name,
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
            if(element.required ?? false) FormBuilderValidators.required(
                errorText: element.errorText),
          ]),
          items: element.dropDownListString?.map((e) =>
              DropdownMenuItem<String>(value: e, child: Text(e),)).toList() ??
              [],
        ),
      ],
    ));
  }
  else if (element.type == FieldType.dropdownMultiSelection) {

    return (Wrap(
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

        FormBuilderDropdownMultiSelect<String>(
          initialValue: initializeValue[element.attributeName ?? element.name] ?? "",
          isDense: true,
          name: element.attributeName ?? element.name,
          searchable: element.dropDownSearchable,
          onChanged: element.onChanged,
          enabled: element.enabled ?? true,
          // restorationId: element.name,
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
            if(element.required ?? false) FormBuilderValidators.required(
                errorText: element.errorText),
          ]),
          items: element.dropDownListString?.map((e) =>
              DropdownMenuItem<String>(value: e, child: Text(e),)).toList() ??
              [],
        ),
      ],
    ));
  }
  else if (element.type == FieldType.egyptianNationalID) {
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          onChanged: element.onChanged,
          controller: element.textEditingController,
          enabled: element.enabled ?? true,
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
            if(element.required ?? true) FormBuilderValidators.required(
                errorText: element.errorText),
            FormBuilderValidators.match(
                r'^(2|3)[0-9][0-9][0-1][0-9][0-3][0-9](01|02|03|04|11|12|13|14|15|16|17|18|19|21|22|23|24|25|26|27|28|29|31|32|33|34|35|88)\d\d\d\d\d',
                errorText: element.errorText),
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
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          enabled: element.enabled ?? true,
          format: intl.DateFormat(element.datePickerFormat ?? 'dd-MM-yyyy'),
          onChanged: element.onChanged,
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
            if(element.required ?? true) FormBuilderValidators.required(
                errorText: element.errorText),
          ]),
        ),
      ],
    ));
  }
  else if (element.type == FieldType.textNumberOnly) {
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          onChanged: element.onChanged,
          controller: element.textEditingController,
          enabled: element.enabled ?? true,
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
            if(element.required ?? false) FormBuilderValidators.required(
                errorText: element.errorText),
          ]),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
      ],
    ));
  }
  else if (element.type == FieldType.checkBox) {
    return (Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8, bottom: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(""),
              // if(element.required ?? false)const Text('*'),
              // const Text(':'),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0.0, bottom: 0.0),
          child: FormBuilderCheckbox(
            name: element.attributeName ?? element.name,
            onChanged: element.onChanged,
            // restorationId: element.name,
            initialValue: initializeValue[element.attributeName ?? element.name] ?? false,
            enabled: element.enabled ?? true,
            decoration: element.inputDecoration ?? InputDecoration(
              floatingLabelAlignment:
              FloatingLabelAlignment.start,
              hintText: element.hintText ?? element.name,
              contentPadding:
              const EdgeInsets.all(4),
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
              if(element.required ?? false) FormBuilderValidators.required(
                  errorText: element.errorText),
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
  else if (element.type == FieldType.uploadImage) {
    return (Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
      child: FormBuilderField<String>(
        name: element.attributeName ?? element.name,
        initialValue: initializeValue[element.attributeName ?? element.name] ?? "",
        // restorationId: element.name,
        // validator: FormBuilderValidators.compose([
        //   if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
        // ]),
        builder: (FormFieldState<String> field) {
          return InputDecorator(
            decoration: InputDecoration(
              border: InputBorder.none,
              // labelText: 'Terms',
              errorText: field.errorText,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: (!(element.enabled ?? true)) ? null : (!field.value
                      .emptyValidator())
                      ? null
                      : () async {
                    var onUploadFunction = element.onUploadImage ??
                            () async {
                          await Future.delayed(Duration(seconds: 3));
                          return "no data";
                        };
                    // field.didUpdateWidget(CircularProgressIndicator());
                    field.didChange("uploading");
                    String uploadLink = await onUploadFunction();
                    field.didChange(uploadLink);
                    // FilePicker.platform
                    //     .pickFiles(type: FileType.image)
                    //     .then((image) async {
                    //   if (image != null) {
                    //     String myId =
                    //         "${nationalIdController.text}.${"backIdImage"}";
                    //     Reference storageReference = FirebaseStorage
                    //         .instance
                    //         .ref()
                    //         .child('user_media/idImages/$myId');
                    //     await storageReference.putData(
                    //         image.files.single.bytes ?? Uint8List(0));
                    //
                    //     photoLinkBack =
                    //     await storageReference.getDownloadURL();
                    //     setState(() {});
                    //   }
                    // });
                  },
                  icon: getButtonValidationIcon(field.value),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: (!field.value.emptyValidator() &&
                        !field.value.toString().contains("uploading"))
                        ? Colors.green.shade200
                        : Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    disabledBackgroundColor: (!field.value
                        .emptyValidator() &&
                        !field.value.toString().contains("uploading"))
                        ? Colors.green.shade200
                        : Colors.grey.shade200,),
                  label: Text(
                    element.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                getValidationLink(field),

              ],
            ),
          );
        },
        validator: (value) {
          if ((value?.isEmpty ?? true) && (element.required ?? false)) {
            return element.errorText ?? 'This field is required.';
          }
          return null;
        },
      ),
    ));
  }
  else if (element.type == FieldType.uploadMultiImage) {
    List<String> initialize = (List<String>.unmodifiable(initializeValue[element.attributeName ?? element.name]?? []));
    return (Padding(
      padding: const EdgeInsets.only(top: 14.0, bottom: 14.0),
      child: FormBuilderField<List<String>>(
        name: element.attributeName ?? element.name,
        initialValue: initialize,
        // restorationId: element.name,
        // validator: FormBuilderValidators.compose([
        //   if(element.required ?? false) FormBuilderValidators.required(errorText: element.errorText),
        // ]),
        builder: (FormFieldState<List<String>> field) {
          return InputDecorator(
            decoration: InputDecoration(
              border: InputBorder.none,
              // labelText: 'Terms',
              errorText: field.errorText,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: (!(element.enabled ?? true)) ? null : (!field.value
                      .emptyValidator())
                      ? null
                      : () async {
                    var onUploadFunction = element.onUploadImage ??
                            () async {
                          await Future.delayed(Duration(seconds: 3));
                          return [];
                        };
                    // field.didUpdateWidget(CircularProgressIndicator());
                    field.didChange(["uploading"]);
                    List<String> uploadLink = await onUploadFunction();
                    field.didChange(uploadLink);
                    // FilePicker.platform
                    //     .pickFiles(type: FileType.image)
                    //     .then((image) async {
                    //   if (image != null) {
                    //     String myId =
                    //         "${nationalIdController.text}.${"backIdImage"}";
                    //     Reference storageReference = FirebaseStorage
                    //         .instance
                    //         .ref()
                    //         .child('user_media/idImages/$myId');
                    //     await storageReference.putData(
                    //         image.files.single.bytes ?? Uint8List(0));
                    //
                    //     photoLinkBack =
                    //     await storageReference.getDownloadURL();
                    //     setState(() {});
                    //   }
                    // });
                  },
                  icon: getButtonValidationListIcon(field.value),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(10),
                    backgroundColor: (!field.value.emptyValidator() &&
                        !field.value!.contains("uploading"))
                        ? Colors.green.shade200
                        : Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    disabledBackgroundColor: (!field.value
                        .emptyValidator() &&
                        !field.value!.contains("uploading"))
                        ? Colors.green.shade200
                        : Colors.grey.shade200,),
                  label: Text(
                    element.name,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                getValidationMultiLink(field),

              ],
            ),
          );
        },
        validator: (value) {
          if ((value?.isEmpty ?? true) && (element.required ?? false)) {
            return element.errorText ?? 'This field is required.';
          }
          return null;
        },
      ),
    ));
  }
  else if (element.type == FieldType.phone) {
    // element.onChanged!(element.textEditingController?.text ?? "");
    if(initializeValue[element.attributeName ?? element.name] != null){
      element.textEditingController?.text = initializeValue[element.attributeName ?? element.name];
    }
    return (Wrap(
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
          onChanged: element.onChanged,
          enabled: element.enabled ?? true,
          controller: element.textEditingController,
          decoration: element.inputDecoration ?? InputDecoration(
            // prefixText: "+20",
            suffixIcon: const Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text("+20"),
              ),
            ),
            suffixStyle: const TextStyle(color: Colors.black),
            suffixIconConstraints: const BoxConstraints(),
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
            if(element.required ?? true) FormBuilderValidators.required(
                errorText: element.errorText),
            FormBuilderValidators.match(
                r'^(1)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]',
                errorText: element.errorText)
            // FormBuilderValidators.p(errorText: element.errorText),
          ]),
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
        ),
      ],
    ));
  }
  else if (element.type == FieldType.empty) {
    // element.onChanged!(element.textEditingController?.text ?? "");
    return (Container());
  }
  else if (element.type == FieldType.multiFields) {
    List<Widget> multiItems = [];
    for(ThinkFormModel item in element.items??[]){
      multiItems.add(convertWidgetItem(item, initializeValue));
    }
    return (Wrap(
      children: multiItems,
    ));
  }
  return Container();
}
Widget getButtonValidationIcon(String? value){
  if(value.emptyValidator()){
    return const Icon(Icons.upload);
  }else if(value.toString().contains("uploading")){
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2.0),
      child: const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }else{
    return const Icon(Icons.done);
  }
}
Widget getButtonValidationListIcon(List<String>? value){
  if(value.emptyValidator()){
    return const Icon(Icons.upload);
  }else if(value.toString().contains("uploading")){
    return Container(
      width: 24,
      height: 24,
      padding: const EdgeInsets.all(2.0),
      child: const CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 3,
      ),
    );
  }else{
    return const Icon(Icons.done);
  }
}
Widget getValidationLink(FormFieldState<String> field) {
  if (field.value.emptyValidator()) {
    return Container();
  } else if (field.value.toString().contains("uploading")) {
    return const Text("Uploading", style: TextStyle(color: Colors.black),
    );
  } else {
    return Row(
        children: [
          IconButton(onPressed: () {
            field.didChange("");
          }, icon: const Icon(Icons.close, color: Colors.red,)),
          TextButton(onPressed: () {
            launchUrlString(field.value.toString());
          }, child: Text("Uploaded Link",
            style: TextStyle(color: Colors.green.shade200),
          )),
        ]);
  }
}

Widget getValidationMultiLink(FormFieldState<List<String>> field) {
  if (field.value.emptyValidator()) {
    return Container();
  } else if (field.value?.contains("uploading") ?? false) {
    return const Text("Uploading", style: TextStyle(color: Colors.black),
    );
  } else {
    return Column(
      children: List.generate(field.value?.length ?? 0, (index) =>
          Row(
              children: [
                IconButton(onPressed: () {
                  List<String>? values = List.from(field.value ?? [])
                    ..removeAt(index);
                  // if(values != null){
                  //   values.removeAt(index);
                  // }
                  field.didChange(values);
                }, icon: const Icon(Icons.close, color: Colors.red,)),
                TextButton(onPressed: () {
                  launchUrlString(field.value?[index].toString() ?? "");
                }, child: Text("Uploaded Link ${index + 1}",
                  style: TextStyle(color: Colors.green.shade200),
                )),
              ])),
    );
  }
}