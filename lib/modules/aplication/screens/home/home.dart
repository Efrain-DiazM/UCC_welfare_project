
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/components/list_news.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/components/news_carousel.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/models/news_model.dart';
// import 'package:flutter_ucc_welfare_project/modules/home/models/news_model.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/sizes.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.carouselNews,
                style: const TextStyle(
                  fontSize: AppSizes.lg,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              const NewsCarousel(),

              // CarouselSlider.builder(
              //   itemCount: NewsData.breakingNewsData.length, 
              //   itemBuilder: (context, index, id) => NewsCarousel(NewsData.breakingNewsData[index]), 
              //   options: CarouselOptions(
              //     aspectRatio: 16 / 9,
              //      enableInfiniteScroll: false,
              //      enlargeCenterPage: true,
              //   )
              // ),
              const SizedBox(height: 40.0,),
              Text(
                AppText.recentNews, 
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
             Column(
                children:
                  NewsData.recentNewsData.map((e) => ListNews(e)).toList()
              )
            ],
          ),
        ),
      );
  }
}