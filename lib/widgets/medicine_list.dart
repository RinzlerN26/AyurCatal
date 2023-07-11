import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// import 'package:ayurcatal/data/medicine_items.dart';
import 'dart:convert';
import '../data/categories.dart';
import '../models/medicinal_items.dart';
import 'medicine_list_item.dart';
import 'new_medicine.dart';

class MedicinalList extends StatefulWidget {


  const MedicinalList({super.key});

  @override
  State<MedicinalList> createState() => _MedicinalListState();
}

class _MedicinalListState extends State<MedicinalList> {
  // List<MedicinalItem> _medicineItemsFinal=medicinalItems;
  List<MedicinalItem> _medicineItemsFinal=[];
  List<MedicinalItem> _medicineItemsFinal1=[];
  var _isLoading = true;
  String? _error;
  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
        'flutter-firebase-67b34-default-rtdb.firebaseio.com', 'medicine-list.json');

    try {
      final response = await http.get(url);
      if (response.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
  
      
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category']).value;
       _medicineItemsFinal.add(
          MedicinalItem(
            botanicalname:item.value['botanicalname'],
            category: category,
            dosage:item.value['dosage'] ,
            id: item.key,
            medicinalname: item.value['medicinalname'],
            noofuses: item.value['noofuses'],
            parts:item.value['parts'],
            plantname:item.value['plantname'],
            therapeuticuses: List.from(item.value['therapeuticuses'])  
          ),
        );
      }
     
       setState(() {
        _isLoading = false;
        _medicineItemsFinal1=_medicineItemsFinal;
      });
   
      
    } catch (error) {
      
      setState(() {
        _error = 'Something went wrong! Please try again later.';
        
      });
    }
  }
  

  void _addItem() async {
     await Navigator.of(context).push<MedicinalItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
       
    );

       setState(() {
        
        _medicineItemsFinal=[];
        _medicineItemsFinal1=[];
         _loadItems(); 
         
      });
    
  }
   void _removeItem(MedicinalItem item) async{
     final index = _medicineItemsFinal.indexOf(item);
    
     final url = Uri.https('flutter-firebase-67b34-default-rtdb.firebaseio.com', 'medicine-list/${item.id}.json');
   
    final response = await http.delete(url);
    print(item.id);
    print(response.statusCode);
   
    if (response.statusCode >= 400) {
  
      setState(() {
        _medicineItemsFinal.insert(index, item);
      });
    }
   setState(() {
      _medicineItemsFinal=[];
      _medicineItemsFinal1=[];
       _loadItems();
    });
   
  }
  void _runFilter(String enteredKeyword) {
    
    List<MedicinalItem> results = [];
     if(enteredKeyword.isEmpty){
         results= _medicineItemsFinal1;
      
      }else{
      results = _medicineItemsFinal
          .where((mn) =>
          mn.medicinalname.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      }    
    setState(() {
     
      _medicineItemsFinal=results;
       
      
    });
  
  }

  

  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: Text('No items added yet.',
    style: GoogleFonts.montserrat(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                    ),
    ));
    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }
   
    if (_medicineItemsFinal.isNotEmpty) {
      content = ListView.builder(
        // scrollDirection: Axis.horizontal,
        itemCount: _medicineItemsFinal.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) {
            _removeItem(_medicineItemsFinal[index]);
          },
          key: ValueKey(_medicineItemsFinal[index].id),
          child: ListTile(
            onTap: ()=>{ 
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MedicineListItem(medicineItemsFinal:_medicineItemsFinal,index:index),
                ),
              )
            },
            title: Text(_medicineItemsFinal[index].medicinalname,textScaleFactor: 1.5,style:GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    
  )),
            subtitle:Text(_medicineItemsFinal[index].botanicalname,textScaleFactor: 1.5,style:GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    
  )),
            isThreeLine: true,
            leading: Container(
              width: 24,
              height: 24,
              color: _medicineItemsFinal[index].category.color,
            ),
            trailing: Text(
               'Number Of Uses: ${ _medicineItemsFinal[index].noofuses}',textScaleFactor: 1.5,style:GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    
  )
            ),
          ),
        ),
      );
    }
    if (_error != null) {
      content = Center(child: Text(_error!));
    }


    return Scaffold(
      appBar: AppBar(
        title:Text('Your Medicines',textScaleFactor: 2.0,style:GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    
  )),
          actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
         
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
          //   IconButton(
          //   onPressed: (){},
          //   icon: const Icon(Icons.search),
          // ),
            Container(
              margin: const EdgeInsets.all(0),
      padding: const EdgeInsets.all(0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 3, 11, 59),
        border: Border.all(
            color: Colors.white, 
            width: 3.0),   
        borderRadius: const BorderRadius.all(
            Radius.circular(10.0)), 
        boxShadow: const [BoxShadow(blurRadius: 10,color: Colors.black,offset: Offset(1,3))] // Make rounded corner of border
      ),
              child: TextField(
                        style:GoogleFonts.montserrat(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                    ) ,
                        onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                               border: InputBorder.none,
                               prefixIcon: const Icon(Icons.search),
                               contentPadding: const EdgeInsets.only(top:12),
                               hintText:'Search By Medicinal Name' ,
                               hintStyle:GoogleFonts.montserrat(
                       fontSize: 20,
                       fontWeight: FontWeight.bold,
                    )
                          ),
                          
                          
                          ),
            ),
             const SizedBox(
              height: 20,
            ),            
            Expanded(child: content),
          ],
        ),
      )
      
    );
  }
}