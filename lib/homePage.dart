import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/constant/postJson.dart';
import 'package:instagram/constant/storyJson.dart';

import 'storyItem.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 5, bottom: 5),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 65,
                          height: 65,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(profile),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: 19,
                                  height: 19,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 19,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                          width: 70,
                          child: Text(
                            name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: List.generate(stories.length, (index) {
                      return StoryItem(
                        image: stories[index]['img'],
                        name: stories[index]['name'],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.3),
            ),
            Column(
              children: List.generate(post.length, (index){
                return PostItem(
                  postImg: post[index]["postImg"],
                  profileImg: post[index]["profileImg"],
                  name: post[index]["name"],
                  viewCount: post[index]["commentCount"],
                  isLoved: post[index]["isLoved"],
                  likedBy: post[index]["likedBy"],
                  timeAgo: post[index]["timeAgo"],
                  caption: post[index]["caption"],
                );
              })
            )
          ],
        ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String profileImg;
  final String name;
  final String postImg;
  final isLoved;
  final String likedBy;
  final String viewCount;
  final String timeAgo;
  final String caption;
  const PostItem({
    Key key, this.profileImg, this.name, this.postImg, this.isLoved, this.likedBy, this.viewCount, this.timeAgo, this.caption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(profileImg),
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Icon(
                Icons.analytics_rounded,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(
          height: 400,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: NetworkImage(postImg),
            fit: BoxFit.cover,
          )),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: <Widget>[
                  isLoved ? SvgPicture.asset(
                    "assets/images/home_active.svg",
                    width: 27,
                  ) : Container(),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/images/home_active.svg",
                    width: 27,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  SvgPicture.asset(
                    "assets/images/home_active.svg",
                    width: 27,
                  ),
                ],
              ),
              SvgPicture.asset(
                "assets/images/home_active.svg",
                width: 27,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "liked by",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "$likedBy",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: "and",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextSpan(
                text: "Other",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12,),
        Padding(padding: EdgeInsets.only(left: 10,right: 10),
          child:RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "$name",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextSpan(
                  text: "$caption",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(padding: EdgeInsets.only(left: 10 , right: 10 ),
        child: Text("View $viewCount comments" , style: TextStyle(
          fontSize: 10 ,
          fontWeight: FontWeight.w500,
          color: Colors.white.withOpacity(0.5)
        ),),),
        SizedBox(height: 12,),
        Padding(padding: EdgeInsets.only(left: 10 , right: 10 ),
          child: Row(
            children: <Widget> [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: NetworkImage(post[0]["profileImg"]), fit: BoxFit.cover),
                ),
              ),
              SizedBox(width: 15,),
              Text("Add a comment ...." , style: TextStyle(
                  fontSize: 10 ,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.5)
              ),),
            ],
          ),),
        SizedBox(height: 15,),
        Padding(padding: EdgeInsets.only(left: 15 , right: 15),
        child:Text("1 day ago" , style: TextStyle(
            fontSize: 10 ,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(0.5)
        ),) ,)
      ],
    );
  }
}
