import 'package:ayurcatal/models/category.dart';
import 'package:ayurcatal/models/medicinal_items.dart';
import 'package:ayurcatal/data/categories.dart';

final medicinalItems = [
      MedicinalItem(
      category:categories[Categories.medicine]!,  
      id:'1',  
      medicinalname:"amukkara",
      botanicalname : "Withania somnifera",
      dosage: "Powder 3-6 g",
      noofuses: 7,
      parts : "Root",
      plantname: "amukkara",
      therapeuticuses: [ "pain", "fever", "eczema", "anemia", "general debility", "rheumatic ailments", "oligozoospermia" ]
      ),
    MedicinalItem(
      category:categories[Categories.medicine]!,  
      id:'2',  
      medicinalname:"athi",
      botanicalname : "Ficus racemosa",
      dosage: "Decoction 30-50 ml twice daily,powder 3-6g",
      noofuses: 4,
      parts : "bark",
      plantname: "athi",
      therapeuticuses: [ "dysentery", "piles", "bleeding disorder", "leucorrhea" ]
      ),
     MedicinalItem(
      category:categories[Categories.medicine]!,  
      id:'3',  
      medicinalname:"athimathuram",
      botanicalname : "Glycyrrhiza glabra",
      dosage: "powder 2-4g",
      noofuses: 8,
      parts : "stolon and root",
      plantname: "athimathuram",
      therapeuticuses: [ "burning micturition", "bone disorders", "cough", "jaundice", "eye diseases", "polydypsia", "peptic ulcer", "vitiligo" ]
      ),
      MedicinalItem(
      category:categories[Categories.medicine]!,  
      id:'4',  
      medicinalname:"vilvam",
      botanicalname : "Aegle marmelo",
      dosage: "Decoction 30-50 ml twice daily",
      noofuses: 3,
      parts : "Root",
      plantname: "vilvam",
      therapeuticuses: [ "fainting", "fever", "body pain" ]
      )
];