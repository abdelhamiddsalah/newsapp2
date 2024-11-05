import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';

class PaginationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<PaginationCubit>().prevPage();
              //int currentPage = context.read<PaginationCubit>().state;
              //  context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(currentPage);
            },
            child: Text(
              'Prev',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: LinearBorder(),
            ),
          ),
          Expanded(
            child: BlocBuilder<PaginationCubit, int>(
              builder: (context, currentPage) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<PaginationCubit>().goToPage(index);
                          //  context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(index + 1);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: currentPage == index
                                ? Colors.blue
                                : Theme.of(context).cardColor,
                          ),
                          child: Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
          ElevatedButton(
            onPressed: () {
              context.read<PaginationCubit>().nextPage();
              //   int currentPage = context.read<PaginationCubit>().state;
              //  context.read<NewsCubitCubit>().emitGetAllTopnewssortdbypage(currentPage);
            },
            child: Text(
              'Next',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              shape: LinearBorder(),
            ),
          ),
        ],
      ),
    );
  }
}
