import 'package:cached_network_image/cached_network_image.dart';
import 'package:covidglobal/app/entity/country.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardCountryWidget extends StatelessWidget {

  Country country;

  CardCountryWidget(this.country);

  @override
  Widget build(BuildContext context) => Container(
      height: 50,
      alignment: Alignment.center ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
              boxShadow:[BoxShadow(
                spreadRadius: 2,
                blurRadius: 5,
                color: Colors.black26,
              )]
            ),
      padding: EdgeInsets.only(left: 30,right: 10),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 25,
              width: 30,
              child:CachedNetworkImage(
              imageUrl: country.countryInfo.flag,
              progressIndicatorBuilder: (context, url, downloadProgress) => 
                  Shimmer.fromColors(child:
                  Container(
                    color: Colors.grey,
                  ) 
                  , baseColor:Colors.black12, highlightColor: Colors.white),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Text(country.country, style: TextStyle(fontSize: 20),),
            )
          ],
        ),
      ),
    );
}
