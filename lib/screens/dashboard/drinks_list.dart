import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:watery/data/sample_data.dart';
import 'package:watery/utils/images.dart';

class DrinksList extends StatelessWidget {
  const DrinksList({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return ListView.builder(
      itemCount: sampleDrinksList.length,
      itemBuilder: (BuildContext ctx ,int index){
        var qty = sampleDrinksList[index].qty!;
        return Dismissible(
          key: Key(index.toString()),
          child:   Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset( qty >499? bottleIcon :qty >149 ?bigGlassIcon :smalllassIcon,width:qty >499? w*0.07 :qty >149 ?w*0.058 :w*0.05,),
                      SizedBox(width: 10,),
                      Text('$qty ${sampleDrinksList[index].type}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                    ],
                  ),
                  Text('${sampleDrinksList[index].time}',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18),),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(color: Colors.white10,),
              )
            ],
          ),
        );
      },);
  }
}
