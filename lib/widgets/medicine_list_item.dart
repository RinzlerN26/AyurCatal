import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/medicinal_items.dart';


class MedicineListItem extends StatelessWidget {

  const MedicineListItem({super.key,required this.index,required this.medicineItemsFinal});
  

   final int index;
   final List<MedicinalItem> medicineItemsFinal;
 
  @override
  Widget build(BuildContext context) {
   


     return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Details',textScaleFactor: 2.0,style:GoogleFonts.montserrat(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    
  )),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
              child: Text(
              "Medicinal Name: ${medicineItemsFinal[index].medicinalname}",
                     
              textScaleFactor: 2.0,
              style: GoogleFonts.montserrat(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                
              )
               ),
            ),
             Container(
              margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
               child: Text(
                         "Botanical Name: ${medicineItemsFinal[index].botanicalname}",
                        textAlign: TextAlign.center,
                         textScaleFactor: 2.0,
                         style:GoogleFonts.montserrat(
                 fontSize: 10,
                 fontWeight: FontWeight.bold,
                 
               )
               ),
             ),
              Container(
                margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
                child: Text(
                          "Dosage: ${medicineItemsFinal[index].dosage}",
                      
                          textScaleFactor: 2.0,
                          style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  
                )
                           ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
                child: Text(
                          "Parts: ${medicineItemsFinal[index].parts}",
                        
                          textScaleFactor: 2.0,
                          style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  
                )
                           ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
                child: Text(
                          "Plant Name: ${medicineItemsFinal[index].plantname}",
                       
                          textScaleFactor: 2.0,
                          style: GoogleFonts.montserrat(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  
                )
                           ),
              ), 
             Container(
              margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
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
               child: Text(
                         "Therapeutic Uses: ${medicineItemsFinal[index].therapeuticuses.join(", ")}",
                         textAlign: TextAlign.center,
                         textScaleFactor: 2.0,
                         style: GoogleFonts.montserrat(
                 fontSize: 10,
                 fontWeight: FontWeight.bold,
                 
               )
               ),
             )
],
        )
      )
      
    );
  }
}