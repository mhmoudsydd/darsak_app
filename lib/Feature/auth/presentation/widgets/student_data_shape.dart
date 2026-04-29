import 'package:darsak/Feature/auth/presentation/widgets/student_data_circle_shape.dart';
import 'package:darsak/Feature/auth/presentation/widgets/student_data_rect_shape.dart';
import 'package:flutter/material.dart';

class StudentDataShapes extends StatelessWidget {
  const StudentDataShapes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox.expand(child: ColoredBox(color: Color(0xFFF5F7FA))),
        
        StudentDataCircleShape(),
        StudentDataRectangelShape(),
      ],
    );
  }
}



