import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/common/styles/spacing_styles.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/colors.dart';
import 'package:flutter_ucc_welfare_project/utils/services/firestore.dart';

class ListActivity extends StatefulWidget {
  const ListActivity({super.key});

  @override
  State<ListActivity> createState() => _ListProductState();
 }

 class _ListProductState extends State<ListActivity> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: TSpacingStyles.paddingWithAppBarHeight,
        child: RefreshIndicator(
          onRefresh: () async {
            await getAllCollection(nameCollection: 'avtivities');
            setState(() {});
          },
          child: FutureBuilder(
            future: getAllCollection(nameCollection: 'activities'),
            builder: (BuildContext context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;

                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 21.0,
                    crossAxisSpacing: 15.0,
                  ),
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 1,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image(
                                fit: BoxFit.cover,
                                image: NetworkImage(data?[index]['img']),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data?[index]['title'],
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              data?[index]['price'].toString() ?? '',
                              style: const TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }
          ),
        ),
      ),
    );
   }
 }