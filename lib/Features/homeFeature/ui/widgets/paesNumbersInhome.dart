import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';

class PaginationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BlocBuilder<PaginationCubit, int>(
            builder: (context, currentPage) {
              return ElevatedButton(
                onPressed: currentPage > 1 // Enabled only if not on the first page
                    ? () {
                        context.read<PaginationCubit>().prevPage();
                        int updatedPage = context.read<PaginationCubit>().state;
                        context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(updatedPage);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Prev',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              );
            },
          ),
          Expanded(
            child: BlocBuilder<PaginationCubit, int>(
              builder: (context, currentPage) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5, // Adjust to your total page count if needed
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<PaginationCubit>().goToPage(index + 1);
                          context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(index + 1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: (currentPage == index + 1)
                                ? Colors.blue
                                : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          BlocBuilder<PaginationCubit, int>(
            builder: (context, currentPage) {
              return ElevatedButton(
                onPressed: currentPage < 5 // Set the actual total page count here if known
                    ? () {
                        context.read<PaginationCubit>().nextPage();
                        int updatedPage = context.read<PaginationCubit>().state;
                        context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(updatedPage);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: const StadiumBorder(),
                ),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
