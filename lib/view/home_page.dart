import 'package:crsqube/view/widgets/home_app_bar.dart';
import 'package:crsqube/view/widgets/subject_data_table.dart';
import 'package:crsqube/view/widgets/table_pagination.dart';
import 'package:crsqube/view/widgets/view_mode_switch.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: HomeAppBar(
          title: const Text('Subject'),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chevron_left_rounded,
              size: 40,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              constraints: const BoxConstraints.expand(width: 60),
              icon: const Icon(
                Icons.menu_rounded,
                size: 30,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.indigo,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.contact_page_outlined,
                    color: Colors.white,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 6),
                    child: const Text(
                      'DDC_SAMPLE_STUDY_01',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 40,
                vertical: 15,
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 15),
                    child: const Text(
                      'List view',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(
                    '+6',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  const ViewModeSwitch(),
                ],
              ),
            ),
            const Expanded(
              child: SubjectDataTable(),
            ),
            const TablePagination(),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
