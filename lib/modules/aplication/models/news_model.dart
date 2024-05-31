class NewsData {
  String? title;
  String? content;
  String? img;

  NewsData(
      this.title,
      this.content,
      this.img,
    );

  static List<NewsData> breakingNewsData = [
    NewsData("Primera", "Este es el contenido de la primera noticia", "https://www.lavanguardia.com/andro4all/hero/2023/04/6d8841b6-9d24-457a-95c5-0d3de1d7bf5f.png?width=1200&aspect_ratio=16:9"),
    NewsData("Segunda", "Este es el contenido de la segunda noticia", "https://ucc.edu.co/actualidad-ucc/noticias/PublishingImages/Noticias/Pasto/Programa%20Enlace.png"),
    NewsData("Tercera", "Este es el contenido de la tercera noticia", "https://s3.amazonaws.com/rtvc-assets-canalinstitucional.tv/s3fs-public/styles/interna_noticias_after_1222x547_/public/2022-11/Funciones-del-Ministerio-del-Deporte%20%281%29.jpg?itok=FbtLre8w"),
  ];

  static List<NewsData> recentNewsData = [
    NewsData("Primera", "Este es el contenido de la primera noticia", "https://ucc.edu.co/actualidad-ucc/noticias/PublishingImages/Noticias/Pasto/visita%20republica%20china.jpg"),
    NewsData("Segunda", "Este es el contenido de la segunda noticia", "https://ucc.edu.co/actualidad-ucc/noticias/PublishingImages/Noticias/Pasto/Programa%20Enlace.png"),
    NewsData("Tercera", "Este es el contenido de la tercera noticia", "https://s3.amazonaws.com/rtvc-assets-canalinstitucional.tv/s3fs-public/styles/interna_noticias_after_1222x547_/public/2022-11/Funciones-del-Ministerio-del-Deporte%20%281%29.jpg?itok=FbtLre8w"),
  ];
}