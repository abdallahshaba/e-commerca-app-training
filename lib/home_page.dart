import 'package:e_commerce_training/items_page.dart';
import 'package:e_commerce_training/widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key,});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0 ;
  List categories = [
    {"itemName": "Laptop", "itemIcon": Icons.laptop},
    {"itemName": "Mobile", "itemIcon": Icons.phone_android},
    {"itemName": "Biks", "itemIcon": Icons.electric_bike},
    {"itemName": "Cars", "itemIcon": Icons.card_travel_sharp},
    {"itemName": "Gifts", "itemIcon": Icons.heart_broken},
  ];

   List items = [
    {"itemName": "Watch", "image": "assets/images/3f485b6be3f2fb87c5dafbf64220ab5b.png" , "price" : "300\$" , "subTitle" : "watch very good"},
    {"itemName": "Laptop", "image": "assets/images/laptop.png" , "price" : "340\$" , "subTitle" : "laptop very good"},
    {"itemName": "Hard", "image": "assets/images/hard.png" , "price" : "380\$" , "subTitle" : "Hard very good"},
    {"itemName": "Laptop-mac", "image": "assets/images/macpc.png" , "price" : "1000\$" , "subTitle" : "laptop-mac very good"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {
            
          });
        },
        currentIndex: currentIndex ,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        items: const [
         BottomNavigationBarItem(icon: Icon(Icons.home_outlined , size: 40,) , label: "Home" ),
         BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined, size: 40) , label: "Cart"),
         BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined, size: 40) , label: "Profile"),
      ]),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          FontAwesomeIcons.search,
                          color: Colors.blue,
                          size: 20,
                        ),
                        hintText: "Search",
                        hintStyle: Styles.boldtextStyle14,
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // تعديل هذا الرقم حسب الحاجة
                          borderSide:
                              BorderSide.none, // إزالة الحدود الافتراضية
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const FaIcon(FontAwesomeIcons.barsStaggered))
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Categories",
              style: Styles.boldtextStyle20,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
                height: 100,
                child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(100),
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Icon(
                              categories[index]["itemIcon"],
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            "${categories[index]["itemName"]}",
                            style: Styles.boldtextStyle14,
                          )
                        ],
                      ),
                    );
                  },
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Best Selling",
              style: Styles.boldtextStyle20,
            ),
            const SizedBox(height: 10,),
            GridView.builder(
              itemCount: items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: 280,
                ),
                itemBuilder: (context, index) {
                  return  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => ItemsPage(data: items[index],),));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.grey[200],
                            width: 500,
                            padding: const EdgeInsets.all(20),
                            child: Image.asset(items[index]["image"] , height: 130 , fit: BoxFit.fill,) ,
                          ),
                          SizedBox(height: 5,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Text("${items[index]["itemName"]}" , style: Styles.boldtextStyle14,),
                          ),
                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 9),
                             child: Text("${items[index]["subTitle"]}" , style: Styles.regulartextStyle14,),
                           ),
                           SizedBox(height: 5,),
                            Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 9),
                             child: Text("${items[index]["price"]}" , style: TextStyle(fontFamily: "Poppins" , color: Colors.orange , fontWeight: FontWeight.bold , fontSize: 18,),)
                           ),
                        ],
                      ),
                    ),
                  );
                },
                ),
          ],
        ),
      ),
    );
  }
}
