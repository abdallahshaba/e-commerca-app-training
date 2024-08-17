import 'package:e_commerce_training/widgets/text_styles.dart';
import 'package:flutter/material.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key, this.data});
  final data;

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
   int currentIndex = 0 ;

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
      endDrawer: DrawerButton(),
      appBar: AppBar(
       backgroundColor: Colors.grey[200],
       title: Text("Items Details" , style: Styles.boldtextStyle20,),
       centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            color: Colors.grey[200],
            height: 300,
            width: 200,
            child: Image.asset(widget.data['image'])),
            const SizedBox(height: 10,),
            Text(widget.data['itemName'] , style: Styles.boldtextStyle24, textAlign: TextAlign.center,),
            const SizedBox(height: 5,),
            Text(widget.data['subTitle'] , style: Styles.regulartextStyle20, textAlign: TextAlign.center,),
            const SizedBox(height: 5,),
            Text(widget.data['price'] , style: Styles.boldtextStyle24.copyWith(color: Colors.orange), textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 
                Text("Color :       " , style: Styles.regulartextStyle18, textAlign: TextAlign.center,),
                Container(height: 22 , width: 22 ,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orange , width: 1.5),
                  color: Colors.grey , borderRadius: BorderRadius.circular(100)),
                ),
                 Text(" Grey" , style: Styles.regulartextStyle18, textAlign: TextAlign.center,),
                 const SizedBox(width: 20,),
                Container(height: 22 , width: 22 ,
                decoration: BoxDecoration(color: Colors.black , borderRadius: BorderRadius.circular(100)),
                ),
                 Text(" Black" , style: Styles.regulartextStyle18, textAlign: TextAlign.center,),
                 
                ],),
                const SizedBox(height: 150,),
                 Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                   child: MaterialButton(
                    color: Colors.orange,
                    onPressed: (){} , child: Text("Add To Card" , style: Styles.boldtextStyle20.copyWith(color: Colors.white),),),
                 )
        ],
      ),
    );
  }
}