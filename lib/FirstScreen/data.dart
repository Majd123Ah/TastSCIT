import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class GalleryCard extends StatelessWidget {
  const GalleryCard({
    required this.title,
    required this.subtitle,
    required this.details,
    required this.image,
    required this.price,
    required this.rate,
    Key? key,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String details;
  final String image;
  final int price;
  final double rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:const EdgeInsets.only(bottom: 15),
      padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 2),
      height: 100,
      width: 400,
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 90,
              width: 130,
              decoration: BoxDecoration(
                  borderRadius:const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover)
              ), ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style:const TextStyle(fontSize: 12),),
                Text(subtitle,style:const TextStyle(fontSize: 10)),
                Text(details,style:const TextStyle(fontSize: 9  )),
              ],),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("$price EG",style:const TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
                RatingBar(rate:rate,),
                ElevatedButton(onPressed: (){}, child:const Text("BOOK"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
class RatingBar extends StatelessWidget {
  const RatingBar({
    required this.rate,
    Key? key,
  }) : super(key: key);
  final double rate;
  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rate,
      itemBuilder: (context, index) =>const Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 4,
      itemSize: 15.0,
      direction: Axis.horizontal,
    );
  }
}
class Option {
  final String name;
  final IconData icon;
  const Option({
    required this.name,
    required this.icon,
  });
}
const List<Option> options = [
  Option(name: "Home", icon: Icons.home),
  Option(name: "Gallery", icon: Icons.image),
  Option(name: "My Services", icon: Icons.home_repair_service_sharp),
  Option(name: "My requests", icon: Icons.shopping_cart),
  Option(name: "Profile", icon: Icons.person),
];
class Gallery {
  final String title;
  final String subtitle;
  final String details;
  final String image;
  final int price;
  final double rate;
  const Gallery({
    required this.title,
    required this.subtitle,
    required this.details,
    required this.image,
    required this.price,
    required this.rate
  });
}
const List<Gallery> gallery = [
  Gallery(title: "Design of children's", subtitle: "room for 2 children",details: "Interior design",image: "assets/images/room1.jpg",price: 156  ,rate: 3 ),
  Gallery(title: "Design of children's", subtitle: "room for 2 children",details: "Interior design",image: "assets/images/room2.jpg",price: 620  ,rate: 3 ),
  Gallery(title: "Design of children's", subtitle: "room for 2 children",details: "Interior design",image: "assets/images/room2.jpg",price: 256  ,rate: 3 ),
];
