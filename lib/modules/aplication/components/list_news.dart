import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/models/news_model.dart';

class ListNews extends StatefulWidget {
  ListNews(this.data, {super.key});
  NewsData data;

  @override
  _ListNewsState createState() => _ListNewsState();
}

class _ListNewsState extends State<ListNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20.0),
      padding: const EdgeInsets.all(12.0),
      height: 130,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(26.0),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              height: 100.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.data.img!
                  ),
                  fit: BoxFit.fitHeight
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Text(
                  widget.data.title!, 
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Text(
                  widget.data.img!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}