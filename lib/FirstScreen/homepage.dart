import 'package:flutter/material.dart';
import 'package:task/FirstScreen/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
   const HomeWidget(),
    Text(
      options[1].name,
      style: optionStyle,
    ),
    Text(
      options[2].name,
      style: optionStyle,
    ),
    Text(
      options[3].name,
      style: optionStyle,
    ),
    Text(
      options[4].name,
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Interior design"),),
     body : ListView(
        children: [
          Center(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
         backgroundColor: Colors.black,
         unselectedItemColor: Colors.white,
        items:options.map((e){
          return BottomNavigationBarItem(
                  label: e.name,
                  icon: Icon(e.icon),
                );
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.yellow[200],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            physics:const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TextButton(style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.orange)), onPressed: (){}, child:const Text("Design of children's rooms",style: TextStyle(color: Colors.white),)),
                TextButton(onPressed: (){}, child:const Text("Living room design",style: TextStyle(color: Colors.grey))),
                TextButton(onPressed: (){}, child:const Text("Living room design",style: TextStyle(color: Colors.grey))),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Container(
          margin:const EdgeInsets.symmetric(horizontal: 15),
          child: Column(children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:const [
                Text("Different services",style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                Text("See all",style:TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.bold) ,)
              ],),
            ),
            Container(
              margin:const EdgeInsets.symmetric(vertical: 10),
              height:350 ,
              child:ListView(
                children: gallery.map((e) {
                    return GalleryCard(title: e.title,subtitle: e.subtitle,details: e.details,image: e.image,price: e.price,rate: e.rate,);
                  }).toList(),

              )
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:const [
                     Text("Offers & packeges"),
                    Text("See all")
                  ],
                ),
                const SizedBox(height: 10,),
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(image: AssetImage(gallery[0].image),fit: BoxFit.cover)
                  ),
                ),

              ],
            )
          ],),
        )
      ],
    );
  }
}

