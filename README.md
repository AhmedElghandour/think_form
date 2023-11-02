<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

TODO: Include short and useful examples for package users. Add longer examples
to `/example` folder.

```dart

ThinkForm(
initialValue: {
  "MMM": "Ahmed",
  "CCCEEE":true,
  "CCC":"ahmed",
  "nationalID": "no data"
},
textDirection: TextDirection.rtl,

callBack: (value, isValid) {
if (isValid) {
AddVolunteerCubit.get(context).submitRequest(value);
}
// print(isValid.toString());
print(value.toString());
}, itemsBox: [
ThinkFormBox(
addTitle: false,
// title: "Ahmed",
crossAxisCount: 3,
items: [
ThinkFormModel(name: "الرقم القومي",
type: FieldType.egyptianNationalID,
errorText: "ليس صحيح",
attributeName: "nationalId",
enabled: true,
required: true),
ThinkFormModel(name: "الأسم",
type: FieldType.normalText,
errorText: "ليس صحيح",
attributeName: "name",
enabled: true,
required: true),
ThinkFormModel(name: "الحالة الإجتماعية",
type: FieldType.dropdownSingleSelection,
dropDownListString: ["اعزب", "متزوج", "أرمل"],
errorText: "ليس صحيح",
attributeName: "maritalSًtatus",
enabled: true,
required: true),
ThinkFormModel(name: "المحافظة",
type: FieldType.dropdownSingleSelection,
dropDownListString: governorate.values.toList(),
errorText: "ليس صحيح",
attributeName: "governorates",
enabled: true,
required: true),
ThinkFormModel(name: "الوظيفة",
type: FieldType.normalText,
errorText: "ليس صحيح",
attributeName: "job",
enabled: true,
required: true),
ThinkFormModel(name: "العنوان",
type: FieldType.normalText,
errorText: "ليس صحيح",
attributeName: "address",
enabled: true,
required: true),
ThinkFormModel(name: "البريد الإلكتروني",
type: FieldType.email,
errorText: "ليس صحيح",
attributeName: "email",
enabled: true,
required: true),
// ThinkFormModel(name: "جهة العمل",
//     type: FieldType.normalText,
//     errorText: "ليس صحيح",
//     attributeName: "work",
//     enabled: true,
//     required: true),
ThinkFormModel(name: "الديانة",
type: FieldType.dropdownSingleSelection,
errorText: "ليس صحيح",
dropDownListString: religion,
attributeName: "religion",
enabled: true,
required: true),
ThinkFormModel(name: "رقم الهاتف",
type: FieldType.phone,
errorText: "ليس صحيح",
enabled: true,
required: true,
attributeName: "phoneNumber"),
ThinkFormModel(name: "موقف التجنيد",
type: FieldType.dropdownSingleSelection,
dropDownListString: [
"إعفاء",
"انهاء الخدمة العسكرية",
"مؤجل",
"لا ينطبق"
],
errorText: "ليس صحيح",
enabled: true,
required: true,
attributeName: "militaryStatus"),
ThinkFormModel(name: "الدوام",
type: FieldType.dropdownSingleSelection,
dropDownListString: ["جزئي", "كلي"],
errorText: "ليس صحيح",
enabled: true,
required: true,
attributeName: "typeOfWork"),
]),
ThinkFormBox(
addTitle: false,
crossAxisCount: 4,
items: [
ThinkFormModel(name: "صورة الشخصية",
type: FieldType.uploadImage,
errorText: "ليس صحيح",
enabled: true,
required: true,
onUploadImage: ()async{
FilePickerResult? result = await FilePicker.platform.pickFiles(
type: FileType.image
);

if (result != null) {
Uint8List? fileBytes = result.files.first.bytes;
// String fileName = result.files.first.name;
String? id  = FirebaseAuth.instance.currentUser?.uid;
if(id != null){
try {
final Reference storageRef =
FirebaseStorage.instance.ref().child('uploads/$id/personalImage');
final UploadTask uploadTask = storageRef.putData(
fileBytes!, SettableMetadata(contentType: result.files.first.extension));
final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
return await storageSnapshot.ref.getDownloadURL();
} catch (error) {
debugPrint('Error uploading image: $error');
}
// await FirebaseStorage.instance.ref('uploads/$id/personalImage').putData(fileBytes!);
}
// Upload file

}
},
attributeName: "personalImage"),
ThinkFormModel(name: "صورة البطاقة وجه",
type: FieldType.uploadImage,
errorText: "ليس صحيح",
enabled: true,
required: true,
onUploadImage: ()async{
FilePickerResult? result = await FilePicker.platform.pickFiles(
type: FileType.image
);

if (result != null) {
Uint8List? fileBytes = result.files.first.bytes;
// String fileName = result.files.first.name;
String? id  = FirebaseAuth.instance.currentUser?.uid;
if(id != null){
try {
final Reference storageRef =
FirebaseStorage.instance.ref().child('uploads/$id/nationalIdImageFace');
final UploadTask uploadTask = storageRef.putData(
fileBytes!, SettableMetadata(contentType: result.files.first.extension));
final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
return await storageSnapshot.ref.getDownloadURL();
} catch (error) {
debugPrint('Error uploading image: $error');
}
// await FirebaseStorage.instance.ref('uploads/$id/personalImage').putData(fileBytes!);
}
// Upload file

}
},
attributeName: "nationalIdImageFace"),
ThinkFormModel(name: "صورة البطاقة خلف",
type: FieldType.uploadImage,
errorText: "ليس صحيح",
enabled: true,
required: true,
onUploadImage: ()async{
FilePickerResult? result = await FilePicker.platform.pickFiles(
type: FileType.image
);

if (result != null) {
Uint8List? fileBytes = result.files.first.bytes;
// String fileName = result.files.first.name;
String? id  = FirebaseAuth.instance.currentUser?.uid;
if(id != null){
try {
final Reference storageRef =
FirebaseStorage.instance.ref().child('uploads/$id/nationalIdImageBack');
final UploadTask uploadTask = storageRef.putData(
fileBytes!, SettableMetadata(contentType: result.files.first.extension));
final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
return await storageSnapshot.ref.getDownloadURL();
} catch (error) {
debugPrint('Error uploading image: $error');
}
// await FirebaseStorage.instance.ref('uploads/$id/personalImage').putData(fileBytes!);
}
// Upload file

}
},
attributeName: "nationalIdImageBack"),
ThinkFormModel(name: "cv",
type: FieldType.uploadImage,
errorText: "ليس صحيح",
enabled: true,
required: true,
onUploadImage: ()async{
FilePickerResult? result = await FilePicker.platform.pickFiles(
type: FileType.custom,
allowedExtensions: ["pdf","docx"],
);

if (result != null) {
Uint8List? fileBytes = result.files.first.bytes;
// String fileName = result.files.first.name;
String? id  = FirebaseAuth.instance.currentUser?.uid;
if(id != null){
try {
final Reference storageRef =
FirebaseStorage.instance.ref().child('uploads/$id/cv');
final UploadTask uploadTask = storageRef.putData(
fileBytes!, SettableMetadata(contentType: result.files.first.extension));
final TaskSnapshot storageSnapshot = await uploadTask.whenComplete(() {});
return await storageSnapshot.ref.getDownloadURL();
} catch (error) {
return "error";
debugPrint('Error uploading image: $error');
}
// await FirebaseStorage.instance.ref('uploads/$id/personalImage').putData(fileBytes!);
}
// Upload file

}
},
attributeName: "cv"),
]),


],
);
```

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
