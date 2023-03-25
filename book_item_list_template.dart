import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hexcolor/hexcolor.dart';

Widget bookItemBuilder({
  required BookModel model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => Padding(
  padding: const EdgeInsets.only(
    top: 27.0,
  ),
  child: Container(
    height: 202.0,
    width: double.infinity,
    padding: EdgeInsetsDirectional.all(
      20.0,
    ),
    margin: EdgeInsetsDirectional.symmetric(
      horizontal: margin,
    ),
    decoration: BoxDecoration(
      color: HexColor(
        hexColor,
      ).withOpacity(opacity),
      borderRadius: BorderRadius.circular(
        radius,
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Image.network(
          model.image,
          fit: BoxFit.fill,
          width: 115.6,
        ),
        SizedBox(
          width: 21.4,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: fontWeight,
                  fontSize: titleFontSize,
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.author,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: authorFontSize,
                  ),
                ),
              ),
              SizedBox(
                height: 2.0,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  start: 5.0,
                ),
                child: Text(
                  model.genre,
                  style: TextStyle(
                    color: fontColor,
                    fontWeight: fontWeight,
                    fontSize: bookGenreFontSize,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: RatingBar.builder(
                    itemSize: iconSize,
                    initialRating: initialRating,
                    minRating: minRating,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Icon(
                      icon,
                      color: iconColor,
                    ),
                    onRatingUpdate: (rating)
                    {
                      print(rating);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  ),
);

Widget bookItemListBuilder({
  required List<BookModel> model,
  double margin = 15.0,
  double opacity = 0.5,
  double radius = 15.0,
  double titleFontSize = 25.0,
  double authorFontSize = 20.0,
  double bookGenreFontSize = 20.0,
  double iconSize = 25.0,
  double initialRating = 3,
  double minRating = 1,
  String hexColor = '#045255',
  Color fontColor = Colors.white,
  Color iconColor = Colors.amber,
  FontWeight fontWeight = FontWeight.w300,
  IconData icon = Icons.star,
}) => ListView.builder(
  itemBuilder: (context, index) => MaterialButton(
    padding: EdgeInsetsDirectional.all(
      0.0,
    ),
    onPressed: ()
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GitHubScreen2(model[index]),
        ),
      );
    },
    child: bookItemBuilder(
      model: model[index],
      minRating: minRating,
      titleFontSize: titleFontSize,
      radius: radius,
      opacity: opacity,
      initialRating: initialRating,
      iconColor: iconColor,
      fontColor: fontColor,
      bookGenreFontSize: bookGenreFontSize,
      authorFontSize: authorFontSize,
      icon: icon,
      fontWeight: fontWeight,
      iconSize: iconSize,
      hexColor: hexColor,
      margin: margin,
    ),
  ),
  itemCount: model.length,
);
