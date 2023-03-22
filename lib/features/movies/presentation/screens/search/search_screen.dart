import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:watch_it/core/network/end_points.dart';
import 'package:watch_it/core/resources/assets_manager.dart';
import 'package:watch_it/core/resources/color_manager.dart';
import 'package:watch_it/core/resources/values_manager.dart';
import 'package:watch_it/core/service/service_locator.dart';
import 'package:watch_it/core/widgets/my_form_field.dart';
import 'package:watch_it/features/movies/domain/entities/search.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movies_cubit.dart';
import 'package:watch_it/features/movies/presentation/controller/cubit/movise_state.dart';
import 'package:watch_it/features/movies/presentation/screens/show_popular_movies_details_screen/show_popular_details_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<MoviesCubit>(),
      child: BlocConsumer<MoviesCubit, MoviesState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = MoviesCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: InkWell(
                onTap: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ShowPopularDetailsScreen(id: cubit.searchResults[0].id,),));
                },
                child: Column(
                  children: [
                    MyFormField(
                      controller: cubit.searchController,
                      type: TextInputType.text,
                      label: 'search',
                      prefix: Icons.search,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Word';
                        }
                        return null;
                      },
                      onChanged: (query) {
                        cubit.getSearch(query: query);
                      },
                    ),
                    Expanded(
                      child: GridView.count(
                        physics: const BouncingScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 1.8 / 3.6,
                        children: List.generate(
                          cubit.searchResults.length,
                          (index) => buildSearchItem(
                            cubit.searchResults[index],
                            context,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget buildSearchItem(SearchResults model, context) => Padding(
  padding: const EdgeInsets.all(AppPadding.p10),
  child:   Column(

        children: [

          ClipRRect(

            borderRadius: const BorderRadius.all(Radius.circular(8.0)),

            child: CachedNetworkImage(

              width: 550.0,

              imageUrl: imageUrl(model.posterPath.toString()),

              placeholder: (context, url) => Shimmer.fromColors(

                baseColor: Colors.grey[850]!,

                highlightColor: Colors.grey[800]!,

                child: Container(



                    // height: 170.0,



                    // width: 150.0,



                    // decoration: BoxDecoration(



                    //   color: Colors.black,



                    //   borderRadius: BorderRadius.circular(8.0),



                    // ),



                    ),

              ),

              errorWidget: (context, url, error) => const Image(

                width: 550,

                height: 270,

                color: ColorManager.sWhite,

                image: AssetImage(

                  ImageAssets.person,

                ),

              ),

            ),

          ),

          const SizedBox(

            height: AppSize.s10,

          ),

          Text(

            model.originalTitle,

            textAlign: TextAlign.center,

            overflow: TextOverflow.ellipsis,

            maxLines: 2,

            style: Theme.of(context).textTheme.titleMedium!.copyWith(

                color: ColorManager.sWhite, fontWeight: FontWeight.bold),

          ),

        ],

      ),
);
