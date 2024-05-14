import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


class BuildShimmerItem extends StatelessWidget {
  const BuildShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(.5,),
        highlightColor: Colors.white,
        child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100.0,
                height: 100.0,
                color: Colors.grey,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 15.0,
                    width: MediaQuery.of(context).size.width - 150.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 15.0,
                    width: MediaQuery.of(context).size.width - 150.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Container(
                    height: 15.0,
                    width: MediaQuery.of(context).size.width - 250.0,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      itemCount: 20,
    );
  }
}
