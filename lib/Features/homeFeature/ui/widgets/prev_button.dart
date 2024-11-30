import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';

class PrevButton extends StatelessWidget {
  const PrevButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaginationCubit, int>(
      builder: (context, currentPage) {
        return ElevatedButton(
          onPressed: currentPage > 1
              ? () {
                  context.read<PaginationCubit>().prevPage();
                  final updatedPage = context.read<PaginationCubit>().state;
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
    );
  }
}