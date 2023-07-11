import 'package:ayurcatal/models/category.dart';

class MedicinalItem {
  const MedicinalItem({
    required this.id,
    required this.medicinalname,
    required this.botanicalname,
    required this.dosage,
    required this.noofuses,
    required this.plantname,
    required this.therapeuticuses,
    required this.parts,
    required this.category,
  });

  final String id;
  final String medicinalname;
  final String botanicalname;
  final String dosage;
  final String plantname;
  final String parts;
  final int noofuses;
  final List<String> therapeuticuses;
  final Category category;
}