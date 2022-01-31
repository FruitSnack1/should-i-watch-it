import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ReviewSkeleton extends StatefulWidget {
  const ReviewSkeleton({Key? key}) : super(key: key);

  @override
  _ReviewSkeletonState createState() => _ReviewSkeletonState();
}

class _ReviewSkeletonState extends State<ReviewSkeleton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Shimmer.fromColors(
                baseColor: Theme.of(context).accentColor,
                highlightColor: Color.fromARGB(255, 80, 80, 80),
                child: Container(
                  width: 120,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).accentColor,
                      highlightColor: Color.fromARGB(255, 80, 80, 80),
                      child: Container(
                        width: 200,
                        height: 28,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).accentColor,
                      highlightColor: Color.fromARGB(255, 80, 80, 80),
                      child: Container(
                        width: 40,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
