import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:julyfultterproject/API%20integration/model/productmodel.dart';

class ProductTile extends StatelessWidget{
  final ProductModel product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context){
    return Card(
      child: Column(
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5)
              )
            ),
            child: CachedNetworkImage(imageUrl: product.image!,fit: BoxFit.contain,),
          ),
          const SizedBox(height: 10,),
          Text(product.title!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),maxLines: 2,),
          Text("${product.price!}\s",style: const TextStyle(fontSize: 15),),

        ],
      ),
    );
  }
}