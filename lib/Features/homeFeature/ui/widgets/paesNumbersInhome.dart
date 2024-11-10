import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/Features/homeFeature/logic/News_cubit/news_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/logic/PageCubit/page_cubit_cubit.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/next_button.dart';
import 'package:newsapp/Features/homeFeature/ui/widgets/prev_button.dart';

class PaginationWidget extends StatelessWidget {
  final int totalPages = 5;

  const PaginationWidget({super.key}); // يمكنك تغيير هذا الرقم بناءً على عدد الصفحات

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrevButton(),
          Expanded(
            child: BlocBuilder<PaginationCubit, int>(
              builder: (context, currentPage) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: totalPages,
                  itemBuilder: (context, index) {
                    final pageIndex = index + 1;
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          context.read<PaginationCubit>().goToPage(pageIndex);
                          context
                              .read<NewsCubitCubit>()
                              .emitGetAllTopnewssortdbypage(pageIndex);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10), // إضافة الحشوة هنا مباشرة
                          decoration: BoxDecoration(
                            color: (currentPage == pageIndex)
                                ? Colors.blue
                                : Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              '$pageIndex',
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
                    );
                  },
                );
              },
            ),
          ),
          NextButton(totalPages: totalPages),
        ],
      ),
    );
  }
}
