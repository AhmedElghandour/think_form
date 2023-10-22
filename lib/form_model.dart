import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart' as intl;
import 'package:url_launcher/url_launcher_string.dart';

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
  final  Function? onUploadImage;

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
  checkBox,
  uploadImage,
  phone
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
    else if (element.type == FieldType.uploadImage) {
      widgets.add(Padding(
        padding: const EdgeInsets.only(top: 14.0,bottom: 14.0),
        child: FormBuilderField<String>(
          name: element.attributeName ?? element.name,
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
                    onPressed: (!field.value.emptyValidator())
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
    else if (element.type == FieldType.phone) {
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
              // prefixText: "+20",
              suffixIcon: const Directionality(
                textDirection: TextDirection.ltr,
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text("+20"),
                  ),
              ),
              suffixStyle: TextStyle(color: Colors.black),
              suffixIconConstraints: BoxConstraints(),
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
              FormBuilderValidators.match(r'^(1)[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]',errorText: element.errorText)
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
  }
  return widgets;
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