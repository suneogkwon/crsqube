import 'dart:developer';
import 'dart:math' as math;

import 'package:crsqube/table_data.dart';
import 'package:flutter/material.dart';

class SubjectDataTable extends StatefulWidget {
  const SubjectDataTable({Key? key}) : super(key: key);

  @override
  State<SubjectDataTable> createState() => _SubjectDataTableState();
}

class _SubjectDataTableState extends State<SubjectDataTable> {
  final List<String> sortKey = [
    'no',
    'subject',
    'status',
    'sync status',
    'sex',
    'age',
  ];

  /// 컬럼 인덱스
  /// * 0: No.
  /// * 1: Subject
  /// * 2: 상태
  /// * 3: Sync Status
  /// * 4: Sex
  /// * 5: Age
  int columnIndex = 0;

  /// 정렬 인덱스
  /// * 0: 정렬 상태 아님
  /// * 1: 내림차순
  /// * 2: 오름차순
  int orderIndex = 0;

  @override
  Widget build(BuildContext context) {
    // [orderIndex]가 0이면 No 내림차순 정렬
    if (orderIndex == 0) {
      tableData.sort(
        (a, b) => b['no']!.compareTo(a['no']!),
      );
    }

    return DataTable(
      headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
      columnSpacing: 20,
      columns: [
        headerColumn(
          index: 0,
          text: 'No.',
          useFilter: false,
        ),
        headerColumn(
          index: 1,
          text: 'Subject',
        ),
        headerColumn(
          index: 2,
          text: '상태',
        ),
        headerColumn(
          index: 3,
          text: 'Sync Status',
        ),
        headerColumn(
          index: 4,
          text: 'Sex',
        ),
        headerColumn(
          index: 5,
          text: 'Age',
        ),
      ],
      rows: tableData
          .map(
            (Map<String, String> e) => DataRow(
              cells: [
                DataCell(Text(e['no'] ?? '-')),
                DataCell(Text(e['subject'] ?? '-')),
                DataCell(Text(e['status'] ?? '-')),
                DataCell(Text(e['sync status'] ?? '-')),
                DataCell(Text(e['sex'] ?? '-')),
                DataCell(Text(e['age'] ?? '-')),
              ],
            ),
          )
          .toList(),
    );
  }

  DataColumn headerColumn({
    required int index,
    required String text,
    bool useFilter = true,
    Function()? onTapFilter,
  }) {
    log('rebuild');
    return DataColumn(
      label: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 5),
          if (useFilter)
            GestureDetector(
              onTap: () => _sort(index),
              child: Transform.rotate(
                angle: index == columnIndex && orderIndex == 2 ? math.pi : 0,
                alignment: Alignment.center,
                child: Icon(
                  Icons.filter_list_rounded,
                  size: 20,
                  color: index == columnIndex && orderIndex != 0
                      ? Colors.indigoAccent
                      : null,
                ),
              ),
            )
        ],
      ),
    );
  }

  void _sort(int index) {
    setState(() {
      orderIndex += 1;
      columnIndex = index;
      final String key = sortKey[columnIndex];

      switch (orderIndex) {
        case 1:
          tableData.sort(
            (a, b) => b[key]!.compareTo(a[key]!),
          );
          break;
        case 2:
          tableData.sort(
            (a, b) => a[key]!.compareTo(b[key]!),
          );
          break;
        case 3:
          orderIndex = 0;
          break;
        default:
          break;
      }
    });
  }
}
