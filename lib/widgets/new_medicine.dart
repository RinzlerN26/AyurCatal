import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ayurcatal/data/categories.dart';
import '../models/category.dart';
// import '../models/medicinal_items.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {

  final _formKey = GlobalKey<FormState>();
  var _enteredmedicinalname = '';
  var _enterednoofouses = 1;
  var _selectedCategory = categories[Categories.medicine]!;
  var _enteredbotanicalname = '';
  var _entereddosage = '';
  var _enteredplantname = '';
  var _enteredparts = '';
  var _isSending = false;
  final List<String> _enteredtherapeuticuses=[];

  void _saveItem() {
  
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _isSending = true;
      });
     final url = Uri.https(
          'flutter-firebase-67b34-default-rtdb.firebaseio.com', 'medicine-list.json');
      http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            'medicinalname': _enteredmedicinalname,
            'botanicalname': _enteredbotanicalname,
            'dosage': _entereddosage,
            'parts': _enteredparts,
            'plantname': _enteredplantname,
            'noofuses': _enterednoofouses,
            'category': _selectedCategory.title,
            'therapeuticuses':_enteredtherapeuticuses
          },
        ),
      );
       if (!context.mounted) {
        return;
      }


      Navigator.of(context).pop(
        // MedicinalItem(
        //   id:"",
        //   medicinalname: _enteredmedicinalname,
        //   noofuses: _enterednoofouses,
        //   category: _selectedCategory,
        //   botanicalname:_enteredbotanicalname,
        //   dosage:_entereddosage,
        //   plantname:_enteredplantname,
        //   parts:_enteredparts ,
        //   therapeuticuses:_enteredtherapeuticuses
        // ),
         
      );
      
    }
   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add A New Medicine',textScaleFactor: 2.0,
        style: GoogleFonts.montserrat(
           fontSize: 10,
           fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration:InputDecoration(
                    hintText:'Medicinal Name' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Medicinal Name',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                    onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _enteredmedicinalname = value!;
                  }
                ),
                TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration: InputDecoration(
                    hintText:'Botanical Name' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Botanical Name',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _enteredbotanicalname = value!;
                  }
                ),TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration: InputDecoration(
                    hintText:'Dosage' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Dosage',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _entereddosage = value!;
                  }
                ),
                TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration: InputDecoration(
                    hintText:'Parts' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Parts',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _enteredparts = value!;
                  }
                ),
                TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration: InputDecoration(
                    hintText:'Plant Name' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Plant Name',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _enteredplantname = value!;
                  }
                ),
                TextFormField(
                  maxLength: 50,
                  style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                  decoration: InputDecoration(
                    hintText:'Therapeutic Uses' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //             label: Text('Therapeutic Uses',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                  ),
                  validator:  (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 50 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // if (value == null) {
                    //   return;
                    // }
                    _enteredtherapeuticuses.add(value!);
                  }
                ),
                // instead of TextField()
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextFormField(
                        style:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
                        decoration: InputDecoration(
                          hintText:'Number Of Uses' ,
                          hintStyle:GoogleFonts.montserrat(
           fontSize: 20,
           fontWeight: FontWeight.bold,
        ) ,
        //                   label: Text('Number Of Uses',textScaleFactor: 2.0,
        // style: GoogleFonts.montserrat(
        //    fontSize: 10,
        //    fontWeight: FontWeight.bold,
        // ),),
                        ),
                        initialValue: '',
                         validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              int.tryParse(value) == null ||
                              int.tryParse(value)! <= 0) {
                            return 'Must be a valid, positive number.';
                          }
                          return null;
                        },
                      onSaved: (value) {
                          _enterednoofouses = int.parse(value!);
                        },
        
                      ),
                    
                    ),
                   
                    const SizedBox(width: 8),
                    Expanded(
                      child: DropdownButtonFormField(
                        items: [
                          for (final category in categories.entries)
                            DropdownMenuItem(
                              value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    color: category.value.color,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(category.value.title,textScaleFactor: 2.0,
        style: GoogleFonts.montserrat(
           fontSize: 10,
           fontWeight: FontWeight.bold,
        ),),
                                ],
                              ),
                            ),
                        ],
                       onChanged: (value) {
                          setState(() {
                            _selectedCategory = value!;
                          });
                       },  
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                       onPressed: _isSending
                        ? null
                        : () {
                            _formKey.currentState!.reset();
                          },
                      child: Text('Reset',textScaleFactor: 2.0,
        style: GoogleFonts.montserrat(
           fontSize: 10,
           fontWeight: FontWeight.bold,
        ),),
                    ),
                    ElevatedButton(
                      onPressed: _isSending ? null : _saveItem,
                      child: _isSending
                        ? const SizedBox(
                            height: 16,
                            width: 16,
                            child: CircularProgressIndicator(),
                          )
                        : Text('Add Item',textScaleFactor: 2.0,
        style: GoogleFonts.montserrat(
           fontSize: 10,
           fontWeight: FontWeight.bold,
        ),),
                    )
                  ],
                ),
        
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}