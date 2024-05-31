// import 'package:flutter/material.dart';
// // import 'package:flutter_ucc_welfare_project/utils/constants/colors.dart';
// import 'package:flutter_ucc_welfare_project/utils/services/firebase_event.dart';
// import 'package:flutter_ucc_welfare_project/utils/services/firestore.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:flutter_ucc_welfare_project/modules/activities/screens/widgets/event_form.dart';
// // import 'firestore_service.dart';
// // import 'event.dart';

// class CalendarActivity extends StatefulWidget {
//   const CalendarActivity({super.key});

//   @override
//   State<CalendarActivity> createState() => _CalendarActivityState();
// }

// class _CalendarActivityState extends State<CalendarActivity> {
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;

//   late final ValueNotifier<List<Event>> _selectedEvents;
//   final FirestoreService _firestoreService = FirestoreService();

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier([]);
//     _loadEventsFromFirestore();
//   }

//   void _loadEventsFromFirestore() {
//     _firestoreService.getEvents().listen((events) {
//       setState(() {
//         _selectedEvents.value = events.where((event) => isSameDay(event.date, _selectedDay)).toList();
//       });
//     });
//   }

//   @override
//   void dispose() {
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _selectedEvents.value = _getEventsForDay(selectedDay);
//       });
//     }
//   }

//   List<Event> _getEventsForDay(DateTime day) {
//     return _selectedEvents.value.where((event) => isSameDay(event.date, day)).toList();
//   }

//   void _showAddEventForm() {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (context) {
//         return Padding(
//           padding: MediaQuery.of(context).viewInsets,
//           child: EventForm(
//             selectedDate: _selectedDay ?? DateTime.now(),
//             onCreate: (name, description, date, startTime, endTime, category) async {
//               await _firestoreService.createEvent(name, description, date, startTime, endTime, category);
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text('Create Activity'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _showAddEventForm,
//         child: const Icon(Icons.add),
//       ),
//       body: Column(
//         children: [
//           // Text("Selected Day = ${_focusedDay.toString().split(" ")[0]}"),
//           TableCalendar<Event>(
//             firstDay: DateTime.utc(2010, 10, 16),
//             lastDay: DateTime.utc(2030, 3, 14),
//             focusedDay: _focusedDay,
//             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//             calendarFormat: _calendarFormat,
//             startingDayOfWeek: StartingDayOfWeek.monday,
//             onDaySelected: _onDaySelected,
//             eventLoader: _getEventsForDay,
//             calendarStyle: const CalendarStyle(
//               outsideDaysVisible: false,
//             ),
//             onFormatChanged: (format) {
//               if (_calendarFormat != format) {
//                 setState(() {
//                   _calendarFormat = format;
//                 });
//               }
//             },
//             onPageChanged: (focusedDay) {
//               _focusedDay = focusedDay;
//             },
//           ),
//           const SizedBox(height: 8.0,),
//           Expanded(


//             child: RefreshIndicator(
//           onRefresh: () async {
//             await getAllCollection(nameCollection: 'events');
//             setState(() {});
//           },
//           child: FutureBuilder(
//             future: getAllCollection(nameCollection: 'events'),
//             builder: (BuildContext context, snapshot) {
//               if (snapshot.hasData) {
//                 final data = snapshot.data;

//                 return ListView.builder(
//                 itemCount: data?.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final event = data?[index];
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                     decoration: BoxDecoration(
//                       border: Border.all(),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: ListTile(
//                       title: Text(event['name']),
//                       subtitle: Text(
//                         '${event['description']}\n'
//                         'Start: ${event['startTime']} - '
//                         'End: ${event['endTime']}'
//                       ),
//                     ),
//                   );
//                 },
//               );
//               } else {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//             }
//           ),
//         ),


//             // child: ValueListenableBuilder<List<Event>>(
//             //   valueListenable: _selectedEvents,
//             //   builder: (context, value, _) {
//             //     if (value.isEmpty) {
//             //       return Center(child: Text('No events for this day.'));
//             //     }
//             //     return ListView.builder(
//             //       itemCount: value.length,
//             //       itemBuilder: (context, index) {
//             //         final event = value[index];
//             //         return Container(
//             //           margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//             //           decoration: BoxDecoration(
//             //             border: Border.all(),
//             //             borderRadius: BorderRadius.circular(12),
//             //           ),
//             //           child: ListTile(
//             //             title: Text(event.title),
//             //             subtitle: Text(
//             //               '${event.description}\n'
//             //               'Start: ${event.startTime.format(context)} - '
//             //               'End: ${event.endTime.format(context)}\n'
//             //               // 'Category: ${event.category}',
//             //             ),
//             //           ),
//             //         );
//             //       },
//             //     );
//             //   },
//             // ),
//           ),
//         ],
//       ),
//     );
//   }
// }



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_ucc_welfare_project/modules/activities/screens/widgets/event_form.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firebase_event.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firestore.dart';
import 'package:qr_flutter/qr_flutter.dart';

class CalendarActivity extends StatefulWidget {
  const CalendarActivity({Key? key}) : super(key: key);

  @override
  State<CalendarActivity> createState() => _CalendarActivityState();
}

class _CalendarActivityState extends State<CalendarActivity> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  late final ValueNotifier<List<Event>> _selectedEvents;
  final FirestoreService _firestoreService = FirestoreService();

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier([]);
    _loadEventsFromFirestore();
  }

  void _loadEventsFromFirestore() {
    _firestoreService.getEvents().listen((events) {
      setState(() {
        _selectedEvents.value = events.where((event) => isSameDay(event.date, _selectedDay)).toList();
      });
    });
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(selectedDay);
      });
    }
  }

  List<Event> _getEventsForDay(DateTime day) {
    return _selectedEvents.value.where((event) => isSameDay(event.date, day)).toList();
  }

  void _showAddEventForm() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: EventForm(
            selectedDate: _selectedDay ?? DateTime.now(),
            onCreate: (name, description, hours, date, startTime, endTime, category) async {
              await _firestoreService.createEvent(name, description, hours, date, startTime, endTime, category);
            },
          ),
        );
      },
    );
  }

  void _showEventQR(String eventName, Timestamp eventDate, String eventDescription, String eventHours, String eventStartTime, String eventEndTime) {

    DateTime date = eventDate.toDate();
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    // String formatHours = eventHours.toString();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Event: '+eventName, style: TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                QrImageView(
                  data: 'Event: $eventName\nDate: $formattedDate\nDescription: $eventDescription\nHours: $eventHours\nStart Time: $eventStartTime\nEnd Time: $eventEndTime',
                  version: QrVersions.auto,
                  size: 150.0,
                  gapless: false,
                ),
                const SizedBox(height: 8.0),
                const Text('Description: ', style: TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold)),
                Text(eventDescription),
                Row(
                  children: [
                    const Text('Hour start: ', style: TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold)),
                    Text(eventStartTime),
                  ],
                ),
                               
                Row(
                  children: [
                    Text('Hour finish: ', style: TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold)),
                    Text(eventEndTime),
                  ],
                ),
                
                // ignore: prefer_interpolation_to_compose_strings
                Row(
                  children: [
                    Text(
                      'Date: ',
                      style: const TextStyle(
                        fontSize: 16.0, // Reemplaza AppSizes.md con un valor numérico apropiado
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(formattedDate),
                  ],
                ),
                Row(
                  children: [
                    const Text('Hours: ', style: TextStyle(fontSize: AppSizes.md, fontWeight: FontWeight.bold)),
                    Text(eventHours),
                  ],
                ),
                // QrImageView(
                //   data: 'Event: $eventName\nDescription: $eventDescription\nStart Time: $eventStartTime\nEnd Time: $eventEndTime',
                //   version: QrVersions.auto,
                //   size: 200.0,
                // ),
                // const SizedBox(height: 8.0),
                // Text('Scan this QR code for event details.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppText.homeClose),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Event>(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          onDaySelected: _onDaySelected,
          eventLoader: _getEventsForDay,
          calendarStyle: const CalendarStyle(
            outsideDaysVisible: false,
          ),
          onFormatChanged: (format) {
            if (_calendarFormat != format) {
              setState(() {
                _calendarFormat = format;
              });
            }
          },
          onPageChanged: (focusedDay) {
            _focusedDay = focusedDay;
          },
        ),
        const SizedBox(height: 8.0,),
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              await getAllCollection(nameCollection: 'events');
              setState(() {});
            },
            child: FutureBuilder(
              future: getAllCollection(nameCollection: 'events'),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data;

                  return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      final event = data?[index];
                      return InkWell(
                        onTap: () {
                          _showEventQR(
                            event['name'],
                            event['date'],
                            event['description'],
                            event['hours'].toString(),
                            event['startTime'],
                            event['endTime'],
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(event['name']),
                            subtitle: Text(
                              '${event['description']}\n'
                              'Start: ${event['startTime']} - '
                              'End: ${event['endTime']}'
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
        FloatingActionButton(
          backgroundColor: Colors.grey,
          onPressed: _showAddEventForm,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
