// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
// import 'package:flutter_ucc_welfare_project/utils/services/firebase_event.dart';
// import 'package:intl/intl.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:flutter_ucc_welfare_project/services/firestore_service.dart';

// class EventForm extends StatefulWidget {
//   final DateTime selectedDate;
//   final Function(String, String, int, DateTime, TimeOfDay, TimeOfDay, String) onCreate;

//   EventForm({required this.selectedDate, required this.onCreate});

//   @override
//   _EventFormState createState() => _EventFormState();
// }

// class _EventFormState extends State<EventForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _descriptionController = TextEditingController();
//   final TextEditingController _hoursController = TextEditingController();
//   TimeOfDay _startTime = TimeOfDay.now();
//   TimeOfDay _endTime = TimeOfDay.now();
//   String _selectedCategory = 'Sports';
//   List<String> _categories = ['Sports', 'Education', 'Social', 'Others'];
//   final FirestoreService _firestoreService = FirestoreService();

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _descriptionController.dispose();
//     _hoursController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(10.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextFormField(
//               controller: _nameController,
//               decoration: InputDecoration(labelText: 'Event Name'),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter event name';
//                 }
//                 return null;
//               },
//             ),
//             const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
//             TextFormField(
//               controller: _descriptionController,
//               decoration: InputDecoration(labelText: 'Description'),
//             ),
//             const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
//             TextFormField(
//               initialValue: DateFormat('yyyy-MM-dd').format(widget.selectedDate),
//               decoration: InputDecoration(labelText: 'Date'),
//               readOnly: true,
//             ),
//             const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(labelText: 'Start Time'),
//                     readOnly: true,
//                     onTap: () async {
//                       TimeOfDay? picked = await showTimePicker(
//                         context: context,
//                         initialTime: _startTime,
//                       );
//                       if (picked != null && picked != _startTime) {
//                         setState(() {
//                           _startTime = picked;
//                         });
//                       }
//                     },
//                     controller: TextEditingController(
//                       text: _startTime.format(context),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(labelText: 'End Time'),
//                     readOnly: true,
//                     onTap: () async {
//                       TimeOfDay? picked = await showTimePicker(
//                         context: context,
//                         initialTime: _endTime,
//                       );
//                       if (picked != null && picked != _endTime) {
//                         setState(() {
//                           _endTime = picked;
//                         });
//                       }
//                     },
//                     controller: TextEditingController(
//                       text: _endTime.format(context),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
//             Row(
//               children: [
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     value: _selectedCategory,
//                     items: _categories.map((String category) {
//                       return DropdownMenuItem<String>(
//                         value: category,
//                         child: Text(category),
//                       );
//                     }).toList(),
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         _selectedCategory = newValue!;
//                       });
//                     },
//                     decoration: InputDecoration(labelText: 'Category'),
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: TextFormField(
//                     controller: _hoursController,
//                     decoration: InputDecoration(labelText: 'Hours'),
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'Please enter hours event';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () async {
//                   if (_formKey.currentState!.validate()) {
//                     await _firestoreService.createEvent(
//                       _nameController.text,
//                       _descriptionController.text,
//                       _hoursController as int,
//                       widget.selectedDate,
//                       _startTime,
//                       _endTime,
//                       _selectedCategory,
//                     );
//                     widget.onCreate(
//                       _nameController.text,
//                       _descriptionController.text,
//                       _hoursController as int,
//                       widget.selectedDate,
//                       _startTime,
//                       _endTime,
//                       _selectedCategory,
//                     );
//                     Navigator.of(context).pop();
//                   }
//                 },
//                 child: Text('Create Event'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firebase_event.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter_ucc_welfare_project/services/firestore_service.dart';

class EventForm extends StatefulWidget {
  final DateTime selectedDate;
  final Function(String, String, int, DateTime, TimeOfDay, TimeOfDay, String) onCreate;

  EventForm({required this.selectedDate, required this.onCreate});

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  TimeOfDay _startTime = TimeOfDay.now();
  TimeOfDay _endTime = TimeOfDay.now();
  String _selectedCategory = 'Sports';
  List<String> _categories = ['Sports', 'Education', 'Social', 'Others'];
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _hoursController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Event Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter event name';
                }
                return null;
              },
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            TextFormField(
              initialValue: DateFormat('yyyy-MM-dd').format(widget.selectedDate),
              decoration: InputDecoration(labelText: 'Date'),
              readOnly: true,
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'Start Time'),
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: _startTime,
                      );
                      if (picked != null && picked != _startTime) {
                        setState(() {
                          _startTime = picked;
                        });
                      }
                    },
                    controller: TextEditingController(
                      text: _startTime.format(context),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(labelText: 'End Time'),
                    readOnly: true,
                    onTap: () async {
                      TimeOfDay? picked = await showTimePicker(
                        context: context,
                        initialTime: _endTime,
                      );
                      if (picked != null && picked != _endTime) {
                        setState(() {
                          _endTime = picked;
                        });
                      }
                    },
                    controller: TextEditingController(
                      text: _endTime.format(context),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: _selectedCategory,
                    items: _categories.map((String category) {
                      return DropdownMenuItem<String>(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedCategory = newValue!;
                      });
                    },
                    decoration: InputDecoration(labelText: 'Category'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    controller: _hoursController,
                    decoration: InputDecoration(labelText: 'Hours'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter hours event';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBtwInputFields / 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    int hours = int.tryParse(_hoursController.text) ?? 0;
                    await _firestoreService.createEvent(
                      _nameController.text,
                      _descriptionController.text,
                      hours,
                      widget.selectedDate,
                      _startTime,
                      _endTime,
                      _selectedCategory,
                    );
                    widget.onCreate(
                      _nameController.text,
                      _descriptionController.text,
                      hours,
                      widget.selectedDate,
                      _startTime,
                      _endTime,
                      _selectedCategory,
                    );
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Create Event'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
