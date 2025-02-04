import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/CreateAppointment/CreateAppointmentScreen.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class WeekCalendarView extends StatefulWidget {
  final Function(DateTime)? onDateSelected;
  final DateTime? initialDate;

  const WeekCalendarView({
    Key? key,
    this.onDateSelected,
    this.initialDate,
  }) : super(key: key);

  @override
  _WeekCalendarViewState createState() => _WeekCalendarViewState();
}

class _WeekCalendarViewState extends State<WeekCalendarView> {
  late DateTime _selectedDate;
  late DateTime _currentWeekStart;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate ?? DateTime.now();
    _currentWeekStart = _getWeekStart(_selectedDate);
  }

  DateTime _getWeekStart(DateTime date) {
    // Get the Monday of the current week
    return date.subtract(Duration(days: date.weekday - 1));
  }

  void _selectDate(DateTime date) {
    print(date);
    print(date.isAtSameMomentAs(DateTime.now()));
    if (date.isAfter(DateTime.now()) || isDateSame(date, DateTime.now())) {
      setState(() {
        _selectedDate = date;
      });
      widget.onDateSelected?.call(date);
    } else {
      Fluttertoast.showToast(msg: "Can't book on previous date");
    }
  }

  void _navigateWeek(int direction) {
    setState(() {
      _currentWeekStart = _currentWeekStart.add(Duration(days: 7 * direction));
      _selectedDate =
          _currentWeekStart.add(Duration(days: 3)); // Select middle day
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Month and Navigation Row
          Container(
            height: 47.h,
            //  margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.r),
                color: Color(0xffF7F6F5)),
            padding: EdgeInsets.symmetric(
              horizontal: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () => _navigateWeek(-1),
                  color: Colors.grey,
                ),
                appText.primaryText(
                  text: DateFormat('MMMM').format(_currentWeekStart),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () => _navigateWeek(1),
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          // Week Days Row
          SpacerH(10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final date = _currentWeekStart.add(Duration(days: index));
              final isSelected = DateUtils.isSameDay(date, _selectedDate);
              final dayName = DateFormat('E').format(date).toUpperCase();
              final dayNumber = date.day.toString();

              return Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(date),
                  child: Container(
                    margin: const EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? appColor.primaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      children: [
                        appText.primaryText(
                          text: dayName,
                          color: isSelected ? Colors.white : Colors.grey,
                          fontSize: 14.sp,
                        ),
                        const SizedBox(height: 4),
                        appText.primaryText(
                          text: dayNumber,
                          color: isSelected ? Colors.white : Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

// Example usage:
