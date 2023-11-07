library thinkform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:think_form/resources/adaptive.dart';

import 'form_model.dart';

// class ThinkForm extends StatefulWidget {
//
//   final List<ThinkFormModel> items;
//   final TextDirection? textDirection;
//   final String? submitButtonText;
//   final Widget? submitButtonTextWidget;
//   final Function (Map<String,dynamic>,bool) callBack;
//   final Map<String, dynamic>? initialValue;
//   final int? crossAxisCount;
//   const ThinkForm({
//     Key? key,
//     required this.items,
//     this.textDirection,
//     this.submitButtonText,
//     this.submitButtonTextWidget,
//     required this.callBack,
//     this.crossAxisCount,
//     this.initialValue})
//       : super(key: key);
//
//   @override
//   State<ThinkForm> createState() => _ThinkFormState();
// }
//
// class _ThinkFormState extends State<ThinkForm> {
//   final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
//   late List<Widget> formWidgets;
//
//
//   @override
//   Widget build(BuildContext context) {
//     print(widget.initialValue.toString());
//     if(widget.initialValue?.isNotEmpty ?? false){
//       _formKey.currentState?.patchValue(widget.initialValue ??{});
//     }
//
//     return Scaffold(
//       body: FutureBuilder(
//         future: null,
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           print("create form");
//
//           return SingleChildScrollView(
//             child: Directionality(
//               textDirection: widget.textDirection ?? TextDirection.ltr,
//               child: FormBuilder(
//                 key: _formKey,
//                 // initialValue: widget.initialValue??(_formKey.currentState?.initialValue ?? {}),
//                 child: Column(
//                   children: [
//                     AlignedGridView.count(
//                       padding: EdgeInsets.zero,
//                       crossAxisCount: (kIsWeb && isDisplayDesktop(context)) ? (widget.crossAxisCount ?? 2) : 1,
//                       // crossAxisCount: 2,
//                       mainAxisSpacing: 0,
//                       crossAxisSpacing: 50,
//                       itemCount: widget.items.length,
//                       shrinkWrap: true,
//                       // addRepaintBoundaries: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       // addAutomaticKeepAlives: true,
//                       itemBuilder: (context, index) {
//                         // if(!(_formKey.currentState?.fields.containsKey(widget.items[index].name) ?? true)){
//                           return formWidgets[index];
//                         // }
//                         // return null;
//
//                       },
//                     ),
//                     //     GridView.custom(
//                     //       gridDelegate:AlignedGridView.count(
//                     //         crossAxisCount: 2,
//                     //         mainAxisSpacing: 8,
//                     //         crossAxisSpacing: 8,
//                     //         itemBuilder: (BuildContext context, int index) {
//                     //
//                     //
//                     //       },
//                     // //         pattern: [
//                     // //   WovenGridTile(1),
//                     // //   WovenGridTile(1),
//                     // // ],
//                     // //         tileBottomSpace: 10,
//                     // ),
//                     // shrinkWrap: true,
//                     // physics: const NeverScrollableScrollPhysics(),
//                     // // addAutomaticKeepAlives: true,
//                     // // childrenDelegate: null,
//                     // children: convertToWidgets(items),
//                     //         // pattern: [
//                     //         //   WovenGridTile(1),
//                     //         //   WovenGridTile(
//                     //         //     5 / 7,
//                     //         //     crossAxisRatio: 0.9,
//                     //         //     alignment: AlignmentDirectional.centerEnd,
//                     //         //   ),
//                     //         // ],
//                     //       ),
//                     // StaggeredGridView.count(
//                     //     crossAxisCount:
//                     //     (kIsWeb && isDisplayDesktop(context))
//                     //         ? 2
//                     //         : 1,
//                     //     crossAxisSpacing: 50,
//                     //     // mainAxisSpacing: (_formKey.currentState?.isDirty ??false)? 20: 0,
//                     //     mainAxisExtent:
//                     //     (kIsWeb && isDisplayDesktop(context))
//                     //         ? null
//                     //         : 100,
//                     //     mainAxisSpacing: 20,
//                     //     // childAspectRatio: 4,
//                     //     // childAspectRatio: (1 / .4),
//                     // ),
//
//                     // MediaQuery
//                     //     .of(context)
//                     //     .size
//                     //     .width /
//                     //     (MediaQuery
//                     //         .of(context)
//                     //         .size
//                     //         .height /
//                     //         5)),
//
//
//                     // [
//                     //   Wrap(
//                     //     children: [
//                     //       const Padding(
//                     //         padding: EdgeInsets.only(
//                     //             left: 8.0, right: 8, bottom: 8),
//                     //         child: Text('Email* :'),
//                     //       ),
//                     //       FormBuilderTextField(
//                     //         // key: _emailFieldKey,
//                     //         name: 'Email',
//                     //         decoration: InputDecoration(
//                     //           floatingLabelAlignment:
//                     //           FloatingLabelAlignment.start,
//                     //           hintText: "Email",
//                     //           contentPadding:
//                     //           const EdgeInsets.all(10),
//                     //           errorText: null,
//                     //           prefixIconConstraints:
//                     //           const BoxConstraints(),
//                     //           hintStyle: const TextStyle(
//                     //               color: Color(0x30171725)),
//                     //           filled: true,
//                     //           isDense: true,
//                     //           fillColor: Colors.grey.shade200,
//                     //           border: OutlineInputBorder(
//                     //               borderRadius:
//                     //               BorderRadius.circular(15),
//                     //               borderSide: const BorderSide(
//                     //                   style: BorderStyle.none)),
//                     //           enabledBorder: OutlineInputBorder(
//                     //               borderRadius:
//                     //               BorderRadius.circular(15),
//                     //               borderSide: const BorderSide(
//                     //                   style: BorderStyle.none)),
//                     //           focusedBorder: OutlineInputBorder(
//                     //               borderRadius:
//                     //               BorderRadius.circular(15),
//                     //               borderSide: const BorderSide(
//                     //                   style: BorderStyle.none)),
//                     //           disabledBorder: OutlineInputBorder(
//                     //               borderRadius:
//                     //               BorderRadius.circular(15),
//                     //               borderSide: const BorderSide(
//                     //                   style: BorderStyle.none)),
//                     //         ),
//                     //         validator: FormBuilderValidators.compose([
//                     //           FormBuilderValidators.required(),
//                     //           FormBuilderValidators.email(),
//                     //         ]),
//                     //       ),
//                     //     ],
//                     //   ),
//                     //
//                     //   FormBuilderTextField(
//                     //     name: 'password',
//                     //     decoration: const InputDecoration(labelText: 'Password'),
//                     //     obscureText: true,
//                     //     validator: FormBuilderValidators.compose([
//                     //       FormBuilderValidators.required(),
//                     //     ]),
//                     //   ),
//                     //
//                     // ],
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 20, horizontal: 10),
//                           child: SizedBox(
//                             width: isDisplayDesktop(context)
//                                 ? MediaQuery.of(context).size.width *
//                                 0.25
//                                 : MediaQuery.of(context).size.width *
//                                 0.80,
//                             height: 40,
//                             child: ElevatedButton(
//                               key: const Key(
//                                   'loginForm_continue_raisedButton'),
//                               style: ElevatedButton.styleFrom(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius:
//                                   BorderRadius.circular(15),
//                                 ),
//                                 backgroundColor:
//                                 const Color(0xff1c1c1a),
//                               ),
//                               onPressed: () {
//                                 // Validate and save the form values
//                                 // _formKey.currentState?.saveAndValidate();
//                                 // debugPrint(_formKey.currentState?.value.toString());
//
//                                 _formKey.currentState?.validate();
//                                 // debugPrint(_formKey.currentState?.instantValue.toString());
//                                 widget.callBack(_formKey.currentState?.instantValue ?? {},_formKey.currentState?.isValid ?? false);
//                               },
//                               child: widget.submitButtonTextWidget ?? Text(widget.submitButtonText ?? 'Submit',
//                                   style:
//                                   const TextStyle(color: Colors.white)),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // MaterialButton(
//                     //   color: Theme
//                     //       .of(context)
//                     //       .colorScheme
//                     //       .secondary,
//                     //   onPressed: () {
//                     //     // Validate and save the form values
//                     //     // _formKey.currentState?.saveAndValidate();
//                     //     // debugPrint(_formKey.currentState?.value.toString());
//                     //
//                     //     // On another side, can access all field values without saving form with instantValues
//                     //     _formKey.currentState?.validate();
//                     //     debugPrint(_formKey.currentState?.instantValue.toString());
//                     //   },
//                     //   child: const Text('Login'),
//                     // ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//
//         },
//       ),
//     );
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//
//   }
// }
class ThinkForm extends StatelessWidget {
  final List<ThinkFormBox> itemsBox;
  final TextDirection? textDirection;
  final String? submitButtonText;
  final Widget? submitButtonTextWidget;
  final Color? buttonColor;
  final Function (Map<String,dynamic>,bool) callBack;
  final Map<String, dynamic>? initialValue;
   ThinkForm({
    Key? key,
    required this.itemsBox,
    this.textDirection,
    this.submitButtonText,
    this.submitButtonTextWidget,
    required this.callBack,
    this.initialValue,
    this.buttonColor})
      : super(key: key);

   final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    // print(initialValue.toString());
    // if(initialValue?.isNotEmpty ?? false){
    //   _formKey.currentState?.patchValue(initialValue ??{});
    // }
    // print(initialValue.toString());
    return Scaffold(
      body: FutureBuilder(
        future: null,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          // print("create form");
          final List<Widget> formWidgets = convertBoxToWidgets(itemsBox,initialValue ?? {},context);
          if(initialValue?.isNotEmpty ?? false){
            formKey?.currentState?.patchValue(initialValue ??{});
          }
          return SingleChildScrollView(
            child: Directionality(
              textDirection: textDirection ?? TextDirection.ltr,
              child: FormBuilder(
                key: formKey,
                // initialValue: initialValue?? {},
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: formWidgets..add(Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 10),
                        child: SizedBox(
                          width: isDisplayDesktop(context)
                              ? MediaQuery.of(context).size.width *
                              0.25
                              : MediaQuery.of(context).size.width *
                              0.80,
                          height: 40,
                          child: ElevatedButton(
                            key: const Key(
                                'loginForm_continue_raisedButton'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              backgroundColor:buttonColor ??
                              const Color(0xff1c1c1a),
                            ),
                            onPressed: () {
                              // Validate and save the form values
                              // _formKey.currentState?.saveAndValidate();
                              // debugPrint(_formKey.currentState?.value.toString());


                              formKey.currentState?.validate();
                              // debugPrint(_formKey.currentState?.instantValue.toString());
                              callBack(formKey.currentState?.instantValue ?? {},formKey.currentState?.isValid ?? false);
                            },
                            child: submitButtonTextWidget ?? Text(submitButtonText ?? 'Submit',
                                style:
                                const TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),),
                  // [
                  //   // itemsBox.()(element) {
                  //   //   return Container();
                  //   // });
                  //
                  //   AlignedGridView.count(
                  //     padding: EdgeInsets.zero,
                  //     crossAxisCount: (kIsWeb && isDisplayDesktop(context)) ? (crossAxisCount ?? 2) : 1,
                  //     // crossAxisCount: 2,
                  //     mainAxisSpacing: 0,
                  //     crossAxisSpacing: 50,
                  //     itemCount: items.length,
                  //     shrinkWrap: true,
                  //     // addRepaintBoundaries: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     // addAutomaticKeepAlives: true,
                  //     itemBuilder: (context, index) {
                  //       // if(!(_formKey.currentState?.fields.containsKey(widget.items[index].name) ?? true)){
                  //       return formWidgets[index];
                  //       // }
                  //       // return null;
                  //
                  //     },
                  //   ),
                  //   //     GridView.custom(
                  //   //       gridDelegate:AlignedGridView.count(
                  //   //         crossAxisCount: 2,
                  //   //         mainAxisSpacing: 8,
                  //   //         crossAxisSpacing: 8,
                  //   //         itemBuilder: (BuildContext context, int index) {
                  //   //
                  //   //
                  //   //       },
                  //   // //         pattern: [
                  //   // //   WovenGridTile(1),
                  //   // //   WovenGridTile(1),
                  //   // // ],
                  //   // //         tileBottomSpace: 10,
                  //   // ),
                  //   // shrinkWrap: true,
                  //   // physics: const NeverScrollableScrollPhysics(),
                  //   // // addAutomaticKeepAlives: true,
                  //   // // childrenDelegate: null,
                  //   // children: convertToWidgets(items),
                  //   //         // pattern: [
                  //   //         //   WovenGridTile(1),
                  //   //         //   WovenGridTile(
                  //   //         //     5 / 7,
                  //   //         //     crossAxisRatio: 0.9,
                  //   //         //     alignment: AlignmentDirectional.centerEnd,
                  //   //         //   ),
                  //   //         // ],
                  //   //       ),
                  //   // StaggeredGridView.count(
                  //   //     crossAxisCount:
                  //   //     (kIsWeb && isDisplayDesktop(context))
                  //   //         ? 2
                  //   //         : 1,
                  //   //     crossAxisSpacing: 50,
                  //   //     // mainAxisSpacing: (_formKey.currentState?.isDirty ??false)? 20: 0,
                  //   //     mainAxisExtent:
                  //   //     (kIsWeb && isDisplayDesktop(context))
                  //   //         ? null
                  //   //         : 100,
                  //   //     mainAxisSpacing: 20,
                  //   //     // childAspectRatio: 4,
                  //   //     // childAspectRatio: (1 / .4),
                  //   // ),
                  //
                  //   // MediaQuery
                  //   //     .of(context)
                  //   //     .size
                  //   //     .width /
                  //   //     (MediaQuery
                  //   //         .of(context)
                  //   //         .size
                  //   //         .height /
                  //   //         5)),
                  //
                  //
                  //   // [
                  //   //   Wrap(
                  //   //     children: [
                  //   //       const Padding(
                  //   //         padding: EdgeInsets.only(
                  //   //             left: 8.0, right: 8, bottom: 8),
                  //   //         child: Text('Email* :'),
                  //   //       ),
                  //   //       FormBuilderTextField(
                  //   //         // key: _emailFieldKey,
                  //   //         name: 'Email',
                  //   //         decoration: InputDecoration(
                  //   //           floatingLabelAlignment:
                  //   //           FloatingLabelAlignment.start,
                  //   //           hintText: "Email",
                  //   //           contentPadding:
                  //   //           const EdgeInsets.all(10),
                  //   //           errorText: null,
                  //   //           prefixIconConstraints:
                  //   //           const BoxConstraints(),
                  //   //           hintStyle: const TextStyle(
                  //   //               color: Color(0x30171725)),
                  //   //           filled: true,
                  //   //           isDense: true,
                  //   //           fillColor: Colors.grey.shade200,
                  //   //           border: OutlineInputBorder(
                  //   //               borderRadius:
                  //   //               BorderRadius.circular(15),
                  //   //               borderSide: const BorderSide(
                  //   //                   style: BorderStyle.none)),
                  //   //           enabledBorder: OutlineInputBorder(
                  //   //               borderRadius:
                  //   //               BorderRadius.circular(15),
                  //   //               borderSide: const BorderSide(
                  //   //                   style: BorderStyle.none)),
                  //   //           focusedBorder: OutlineInputBorder(
                  //   //               borderRadius:
                  //   //               BorderRadius.circular(15),
                  //   //               borderSide: const BorderSide(
                  //   //                   style: BorderStyle.none)),
                  //   //           disabledBorder: OutlineInputBorder(
                  //   //               borderRadius:
                  //   //               BorderRadius.circular(15),
                  //   //               borderSide: const BorderSide(
                  //   //                   style: BorderStyle.none)),
                  //   //         ),
                  //   //         validator: FormBuilderValidators.compose([
                  //   //           FormBuilderValidators.required(),
                  //   //           FormBuilderValidators.email(),
                  //   //         ]),
                  //   //       ),
                  //   //     ],
                  //   //   ),
                  //   //
                  //   //   FormBuilderTextField(
                  //   //     name: 'password',
                  //   //     decoration: const InputDecoration(labelText: 'Password'),
                  //   //     obscureText: true,
                  //   //     validator: FormBuilderValidators.compose([
                  //   //       FormBuilderValidators.required(),
                  //   //     ]),
                  //   //   ),
                  //   //
                  //   // ],
                  //   Row(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             vertical: 20, horizontal: 10),
                  //         child: SizedBox(
                  //           width: isDisplayDesktop(context)
                  //               ? MediaQuery.of(context).size.width *
                  //               0.25
                  //               : MediaQuery.of(context).size.width *
                  //               0.80,
                  //           height: 40,
                  //           child: ElevatedButton(
                  //             key: const Key(
                  //                 'loginForm_continue_raisedButton'),
                  //             style: ElevatedButton.styleFrom(
                  //               shape: RoundedRectangleBorder(
                  //                 borderRadius:
                  //                 BorderRadius.circular(15),
                  //               ),
                  //               backgroundColor:
                  //               const Color(0xff1c1c1a),
                  //             ),
                  //             onPressed: () {
                  //               // Validate and save the form values
                  //               // _formKey.currentState?.saveAndValidate();
                  //               // debugPrint(_formKey.currentState?.value.toString());
                  //
                  //               _formKey.currentState?.validate();
                  //               // debugPrint(_formKey.currentState?.instantValue.toString());
                  //               callBack(_formKey.currentState?.instantValue ?? {},_formKey.currentState?.isValid ?? false);
                  //             },
                  //             child: submitButtonTextWidget ?? Text(submitButtonText ?? 'Submit',
                  //                 style:
                  //                 const TextStyle(color: Colors.white)),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  //   // MaterialButton(
                  //   //   color: Theme
                  //   //       .of(context)
                  //   //       .colorScheme
                  //   //       .secondary,
                  //   //   onPressed: () {
                  //   //     // Validate and save the form values
                  //   //     // _formKey.currentState?.saveAndValidate();
                  //   //     // debugPrint(_formKey.currentState?.value.toString());
                  //   //
                  //   //     // On another side, can access all field values without saving form with instantValues
                  //   //     _formKey.currentState?.validate();
                  //   //     debugPrint(_formKey.currentState?.instantValue.toString());
                  //   //   },
                  //   //   child: const Text('Login'),
                  //   // ),
                  // ],
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
