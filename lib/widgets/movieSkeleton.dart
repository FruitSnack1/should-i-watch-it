import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MovieSkeleton extends StatelessWidget {
  const MovieSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Skeleton();
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i) {
          return Skeleton();
        });
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Theme.of(context).accentColor,
            highlightColor: Color.fromARGB(255, 80, 80, 80),
            child: Container(
              width: 60,
              height: 60,
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
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Shimmer.fromColors(
                  baseColor: Theme.of(context).accentColor,
                  highlightColor: Color.fromARGB(255, 80, 80, 80),
                  child: Container(
                    width: 40,
                    height: 12,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
