import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Component {
  static Widget buildItem(Map itemData, BuildContext context) => Padding(
    padding: const EdgeInsets.all(15.0),
    child: Row(
      children: [
        Container(
          height: 120,
          width: 120,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            itemData['urlToImage']??'https://i.ytimg.com/vi/bRSqxh95nY8/',
            fit: BoxFit.cover,
            errorBuilder: (BuildContext context, Object object, StackTrace? stackTrace) {
              return Image.asset('assets/images/notfound.png', fit: BoxFit.cover,);
            },
          ),
        ),
        const SizedBox(width: 20.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(itemData['title'],
                style: Theme.of(context).textTheme.bodyText1,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                onTap: () {
                  launchUrlString(itemData['url']);
                },
                child: const Text(
                  'Read More',
                  style: TextStyle(
                    fontFamily: 'arialregular',
                    fontWeight: FontWeight.w600,
                    color: Colors.red
                  ),
                ),
              ),
              Text(
                DateFormat.yMMMEd().format(DateTime.parse(itemData['publishedAt'])),
                style:
              const TextStyle(
                  fontFamily: 'arialregular',
                  fontSize: 17,
                  color: Colors.grey
              ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}