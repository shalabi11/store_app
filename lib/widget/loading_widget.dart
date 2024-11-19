import 'package:flutter/material.dart';
// import 'package:skeletonizer/skeletonizer.dart';

class LoadingIndecator extends StatelessWidget {
  const LoadingIndecator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        // shrinkWrap: true,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.5,
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 100),
        itemCount: 6,
        itemBuilder: (context, index) {
          return const Card(
            elevation: 10,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' tModel.title',
                    maxLines: 1,
                    style: TextStyle(color: Colors.grey),
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${'wid.price'}\$'),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
