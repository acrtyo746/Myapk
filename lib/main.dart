import 'dart:async';
import 'dart:ui';
// import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarContrastEnforced: false,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const RailOneApp());
}

class RailOneApp extends StatelessWidget {
  const RailOneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RailOne',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: AppColors.lightGrey,
        fontFamily: 'Arial',
        primaryColor: AppColors.blue,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.blue,
          primary: AppColors.blue,
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                   COLORS                                   */
/* -------------------------------------------------------------------------- */

class AppColors {
  static const blue = Color(0xFF0C64F5);
  static const darkBlue = Color(0xFF335BCF);
  static const orange = Color(0xFFE3A655);
  static const lightOrangeBorder = Color(0xFFEAC28F);
  static const softBlueChip = Color(0xFFC9F2FF);
  static const softBlueChipText = Color(0xFF2B99B8);
  static const softPurpleChip = Color(0xFFEED9FF);
  static const softPurpleChipText = Color(0xFFA86BD7);
  static const titleBlack = Color(0xFF111111);
  static const textBlack = Color(0xFF242424);
  static const darkGrey = Color(0xFF444444);
  static const mutedText = Color(0xFF707070);
  static const lightGrey = Color(0xFFF6F7FB);
  static const noteBg = Color(0xFFFFE3E3);
  static const noteText = Color(0xFFD45454);
  static const ticketPink = Color.fromRGBO(255, 59, 31, 1);
  static const timerRed = Color(0xFFFF3B1F);
  static const dividerGrey = Color(0xFFD9D9D9);
  static const navBg = Color(0xFFDFF0FB);
  static const navBorder = Color(0xFFB9D6EA);
  static const qrBg = Color(0xFFF0F0F0);
  static const infoBoxBg = Color(0xFFF7F7F7);
  static const errorBgLight = Color(0xFFFFF3F5);
  static const errorRed = Color(0xFFF16565);
  static const subtextGrey = Color(0xFF6E6E6E);
  static const outlinedButtonBorder = Color(0xFF49A5C6);
  static const outlinedButtonText = Color(0xFF3C6980);
  static const lightText = Color(0xFFBBBBBB);
  static const ticketYellow = Color(0xFFF4A62A);
}

/* -------------------------------------------------------------------------- */
/*                              SAMPLE / DUMMY DATA                           */
/* -------------------------------------------------------------------------- */

class BookingItem {
  final String tag;
  final Color tagBg;
  final Color tagText;
  final String fromStation;
  final String toStation;
  final String viaStation;
  final String distance;
  final String utsNumber;
  final String ticketTypeLabel;
  final String ticketCategory;
  final String bookedOn;
  final bool showPnr;

  const BookingItem({
    required this.tag,
    required this.tagBg,
    required this.tagText,
    required this.fromStation,
    required this.toStation,
    required this.viaStation,
    required this.distance,
    required this.utsNumber,
    required this.ticketTypeLabel,
    required this.ticketCategory,
    required this.bookedOn,
    required this.showPnr,
  });
}

const reservedBooking = BookingItem(
  tag: 'Unreserved',
  tagBg: AppColors.softPurpleChip,
  tagText: AppColors.softPurpleChipText,
  fromStation: 'MANKHURD',
  toStation: 'BYCULLA',
  viaStation: 'KURLA',
  distance: '18 km',
  utsNumber: '95XWEBR09F',
  ticketTypeLabel: 'Season Ticket',
  ticketCategory: 'MONTHLY | FIRST | ₹570.00',
  bookedOn: '16 Apr 2026, 05:09',
  showPnr: false,
);

const unreservedBooking = BookingItem(
  tag: 'Unreserved',
  tagBg: AppColors.softPurpleChip,
  tagText: AppColors.softPurpleChipText,
  fromStation: 'DADAR',
  toStation: 'BORIVALI',
  viaStation: '---',
  distance: '24 km',
  utsNumber: 'G019EC0022',
  ticketTypeLabel: 'Season Ticket',
  ticketCategory: 'MONTHLY | FIRST | ₹660.00',
  bookedOn: '16 Apr 2026, 10:30',
  showPnr: false,
);

/* -------------------------------------------------------------------------- */
/*                                SPLASH SCREEN                               */
/* -------------------------------------------------------------------------- */

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NoInternetScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/my_rail_login.png', height: 80),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                             NO INTERNET SCREEN                             */
/* -------------------------------------------------------------------------- */

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const Spacer(),
              Container(
                width: 118,
                height: 118,
                decoration: BoxDecoration(
                  color: AppColors.errorBgLight,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: const Center(
                  child: Icon(
                    Icons.wifi_off_rounded,
                    color: AppColors.errorRed,
                    size: 44,
                  ),
                ),
              ),
              const SizedBox(height: 34),
              const Text(
                'No internet connection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: AppColors.titleBlack,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Please check your internet connection and try\nagain',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.35,
                  fontSize: 16,
                  color: AppColors.subtextGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 1,
                    backgroundColor: AppColors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Still offline. Showing local screens.'),
                      ),
                    );
                  },
                  child: const Text(
                    'Try Again!',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: AppColors.outlinedButtonBorder,
                      width: 1.2,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const MyBookingsScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.confirmation_number_outlined,
                    color: AppColors.blue,
                    size: 22,
                  ),
                  label: const Text(
                    'My Bookings',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: AppColors.outlinedButtonText,
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                              MY BOOKINGS SCREEN                            */
/* -------------------------------------------------------------------------- */

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({super.key});

  @override
  State<MyBookingsScreen> createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          height: 74 + MediaQuery.of(context).padding.bottom,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
            border: Border.all(color: const Color(0xFFE0E0E0)),
          ),
          child: Padding(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            child: Row(
              children: [
                _BottomTab(
                  selected: currentTab == 0,
                  label: 'Upcoming',
                  onTap: () => setState(() => currentTab = 0),
                ),
                _BottomTab(
                  selected: currentTab == 1,
                  label: 'Completed',
                  onTap: () => setState(() => currentTab = 1),
                ),
                _BottomTab(
                  selected: currentTab == 2,
                  label: 'Cancelled',
                  onTap: () => setState(() => currentTab = 2),
                ),
                _BottomTab(
                  selected: currentTab == 3,
                  label: 'All',
                  onTap: () => setState(() => currentTab = 3),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 12,
                right: 12,
                bottom: 16,
              ),
              color: AppColors.blue,
              child: Row(
                children: [
                  _roundIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'My Bookings',
                      style: TextStyle(
                        fontSize: 21,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  _roundIconButton(
                    icon: Icons.filter_list_alt,
                    onTap: () {},
                    showBorder: false,
                    iconSize: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(14, 8, 14, 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Spacer(flex: 2),
                        const Text(
                          'Upcoming (2)',
                          style: TextStyle(
                            color: AppColors.orange,
                            fontSize: 15.5,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.sync,
                          size: 20,
                          color: AppColors.mutedText,
                        ),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 12),
                    BookingTicketCard(
                      item: reservedBooking,
                      onViewDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingDetailsScreen(item: reservedBooking),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 14),
                    BookingTicketCard(
                      item: unreservedBooking,
                      onViewDetails: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BookingDetailsScreen(item: unreservedBooking),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _roundIconButton({
  required IconData icon,
  required VoidCallback onTap,
  bool showBorder = true,
  double iconSize = 18,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(22),
    child: Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: Colors.white54, width: 1) : null,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: iconSize),
    ),
  );
}

class BookingTicketCard extends StatelessWidget {
  final BookingItem item;
  final VoidCallback onViewDetails;

  const BookingTicketCard({
    super.key,
    required this.item,
    required this.onViewDetails,
  });

  @override
  Widget build(BuildContext context) {
    const double notchPosition = 135.0;
    const double notchRadius = 15.0;

    final shape = TicketShapeBorder(
      side: const BorderSide(color: Color(0xFFE3A655), width: 1.6),
      notchRadius: notchRadius,
      notchPosition: notchPosition,
      borderRadius: 14,
    );

    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF5F5F5),
        shape: shape,
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4.5),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2E7F5),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Unreserved',
                          style: TextStyle(
                            color: Color(0xFFAC48BD),
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'UTS: ',
                        style: TextStyle(
                          color: AppColors.mutedText,
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        item.utsNumber,
                        style: const TextStyle(
                          color: AppColors.textBlack,
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Ticket Type',
                          style: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          'Booking Date',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'MONTHLY',
                          style: TextStyle(
                            color: AppColors.titleBlack,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.bookedOn.split(',')[0],
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: AppColors.titleBlack,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.fromStation,
                          style: const TextStyle(
                            color: AppColors.titleBlack,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        '— ${item.distance} —',
                        style: const TextStyle(
                          color: Color(0xFFBCBCBC),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.toStation,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            color: AppColors.titleBlack,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 32,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: DashedLine(
                      color: Color(0xFFD9D9D9),
                      dashWidth: 3,
                      spacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 52,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: const Center(
                        child: Text(
                          'Book Again',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 0.8,
                    height: 20,
                    color: const Color(0xFFD0D0D0),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: onViewDetails,
                      child: const Center(
                        child: Text(
                          'View Details',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomTab extends StatelessWidget {
  final bool selected;
  final String label;
  final VoidCallback onTap;

  const _BottomTab({
    required this.selected,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.orange : const Color(0xFF8DA2AF);

    String asset;
    switch (label) {
      case 'Upcoming':
        asset = 'assets/select_upcoming_ticket.png';
        break;
      case 'Completed':
        asset = 'assets/select_completed_ticket.png';
        break;
      case 'Cancelled':
        asset = 'assets/selected_cancelled_ticket.png';
        break;
      case 'All':
      default:
        asset = 'assets/select_all_ticket.png';
    }

    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
          decoration: selected
              ? BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFDECD1), width: 1.2),
                )
              : null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                asset,
                width: 22,
                height: 22,
                color: color,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                style: TextStyle(
                  color: color,
                  fontSize: 10.5,
                  fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                           BOOKING DETAILS SCREEN                           */
/* -------------------------------------------------------------------------- */

class BookingDetailsScreen extends StatefulWidget {
  final BookingItem item;
  const BookingDetailsScreen({super.key, required this.item});

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {
  Timer? _timer;
  int _remainingSeconds = 300; // 05:00

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;
      if (_remainingSeconds == 0) {
        timer.cancel();
        setState(() {});
      } else {
        setState(() {
          _remainingSeconds--;
          if (_remainingSeconds == 0) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  String get formattedTime {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final expired = _remainingSeconds == 0;
    final progress = expired ? 1.0 : (300 - _remainingSeconds) / 300.0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).padding.bottom,
          width: double.infinity,
          color: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              color: AppColors.blue,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 10,
                left: 12,
                right: 12,
                bottom: 16,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _roundIconButton(
                    icon: Icons.arrow_back,
                    onTap: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Booking Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Mobile: 8452856283',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.share_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Thank You Ajay Amirka Chauhan, Happy Journey !',
                      style: TextStyle(
                        color: AppColors.darkGrey,
                        fontSize: 15.5,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: TicketDetailsCard(
                      item: widget.item,
                      expired: expired,
                      formattedTime: formattedTime,
                      progress: progress,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.noteBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        'Note: This ticket is non refundable. Ticket is stored locally on the device. Please do not change your handset or perform factory reset.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.noteText,
                          fontSize: 13.5,
                          fontWeight: FontWeight.w600,
                          height: 1.28,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Upgrade to Superfast',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 14),
                        const _QrAndInfoSection(),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
}

class _QrAndInfoSection extends StatelessWidget {
  const _QrAndInfoSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // QR Code Box
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.qrBg,
            borderRadius: BorderRadius.circular(40),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: SizedBox(
              width: 210,
              height: 210,
              child: Image.asset(
                'assets/custom_qr.png',
                fit: BoxFit.fill,
                filterQuality: FilterQuality.none,
                isAntiAlias: false,
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Icon(Icons.qr_code_2, size: 210, color: Color(0xFF333333)),
                  );
                },
              ),
            ),
          ),
        ),
        const SizedBox(height: 1),
        // Info Box
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.infoBoxBg,
            borderRadius: BorderRadius.circular(4),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Do you know?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGrey,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'IR recovers only 57% of cost of travel on an average.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'This ticket is booked on a personal user ID. It\'s sale/purchase is an offence u/s 143 of the Railways Act, 1989',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'For enquiry and integrated railway helpline, please dial 139.',
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.mutedText,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TicketDetailsCard extends StatelessWidget {
  final BookingItem item;
  final bool expired;
  final String formattedTime;
  final double progress;

  const TicketDetailsCard({
    super.key,
    required this.item,
    required this.expired,
    required this.formattedTime,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    const double notchPosition = 423.0;
    const double notchRadius = 20.0;

    final shape = TicketShapeBorder(
      notchRadius: notchRadius,
      notchPosition: notchPosition,
      borderRadius: 18,
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: ShapeDecoration(
        color: const Color(0xFFFFFDFD),
        shape: shape,
        shadows: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: shape),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TicketTopPreview(
              item: item,
              expired: expired,
              formattedTime: formattedTime,
            ),
            if (!expired)
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.shade300,
                valueColor: const AlwaysStoppedAnimation<Color>(Color.fromRGBO(255, 59, 31, 1)),
              ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          item.ticketTypeLabel,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: AppColors.titleBlack,
                          ),
                        ),
                      ),
                      Text(
                        item.utsNumber,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: AppColors.textBlack,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          item.fromStation,
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2),
                        child: Text(
                          '— ${item.distance} —',
                          style: const TextStyle(
                            color: AppColors.mutedText,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.toStation,
                          textAlign: TextAlign.right,
                          style: const TextStyle(
                            fontSize: 16.5,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _DetailPair(
                          label: 'Via',
                          value: item.viaStation,
                          alignEnd: false,
                        ),
                      ),
                      Expanded(
                        child: _DetailPair(
                          label: 'Booked on',
                          value: item.bookedOn.replaceAll(',', ''),
                          alignEnd: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _DetailPair(
                          label: 'Valid From',
                          value: '16/04/2026',
                          alignEnd: false,
                        ),
                      ),
                      Expanded(
                        child: _DetailPair(
                          label: '*Valid Till',
                          value: '15/05/2026',
                          alignEnd: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    item.ticketCategory,
                    style: const TextStyle(
                      fontSize: 14.8,
                      color: AppColors.textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const SizedBox(
                    height: 35,
                    child: Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17.5),
                            child: DashedLine(color: AppColors.dividerGrey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      Expanded(
                        child: _PersonDetail(
                          label: 'Name',
                          value: 'Ajay Amirka Chauhan',
                          alignEnd: false,
                        ),
                      ),
                      Expanded(
                        child: _PersonDetail(
                          label: 'Age',
                          value: '20 years',
                          alignEnd: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    children: [
                      Expanded(
                        child: _PersonDetail(
                          label: 'ID Type',
                          value: 'PAN Card',
                          alignEnd: false,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'ID Number',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.mutedText,
                              ),
                            ),
                            SizedBox(height: 6),
                            Text(
                              'DFCPC7842Q',
                              style: TextStyle(
                                fontSize: 14.8,
                                fontWeight: FontWeight.w700,
                                color: AppColors.textBlack,
                                letterSpacing: 0.3,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '*Valid for start of journey within 1 hour or until departure of the first train.',
                    style: TextStyle(
                      fontSize: 12,
                      color: AppColors.mutedText,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 12,
              decoration: const BoxDecoration(
                color: AppColors.ticketPink,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TicketTopPreview extends StatelessWidget {
  final BookingItem item;
  final bool expired;
  final String formattedTime;

  const _TicketTopPreview({
    required this.item,
    required this.expired,
    required this.formattedTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/ticket_bcgrnd.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withValues(alpha: .26),
                      Colors.black.withValues(alpha: .14),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 12,
                decoration: const BoxDecoration(
                  color: AppColors.ticketPink,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
              ),
            ),
            const Positioned(
              left: 5,
              top: 15,
              bottom: 29,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'INDIAN RAILWAYS',
                  style: TextStyle(
                    color: Color.fromARGB(255, 187, 187, 187),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 30,
              top: 15,
              bottom: 10,
              child: _VerticalRectDashLine(),
            ),
            const Positioned(
              right: -1,
              top: 15,
              bottom: 50,
              child: RotatedBox(
                quarterTurns: 3,
                child: Text(
                  'भारतीय रेल',
                  style: TextStyle(
                    color: Color.fromARGB(255, 187, 187, 187),
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const Positioned(
              right: 30,
              top: 15,
              bottom: 10,
              child: _VerticalRectDashLine(),
            ),
            Positioned(
              left: 24,
              right: 24,
              top: 18,
              bottom: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Dynamic preview will close in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    expired ? 'EXPIRED' : formattedTime,
                    style: TextStyle(
                      color: expired ? Colors.white : AppColors.timerRed,
                      fontSize: expired ? 28 : 42,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Ticket Booking Date & Time',
                    style: TextStyle(
                      color: AppColors.lightText,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item.bookedOn,
                    style: const TextStyle(
                      color: AppColors.ticketYellow,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'R25585',
                    style: TextStyle(
                      color: AppColors.lightText,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Ticket is Non-Transferable',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VerticalRectDashLine extends StatelessWidget {
  const _VerticalRectDashLine();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        const dashHeight = 6.0;
        const dashWidth = 1.6;
        const dashGap = 4.0;
        final dashCount =
            (constraints.maxHeight / (dashHeight + dashGap)).floor().clamp(
                  1,
                  100,
                );

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            dashCount,
            (index) => Container(
              margin: EdgeInsets.only(bottom: index == dashCount - 1 ? 0 : dashGap),
              width: dashWidth,
              height: dashHeight,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.45),
                borderRadius: BorderRadius.circular(0.5),
              ),
            ),
          ),
        );
      },
    );
  }
}

/* -------------------------------------------------------------------------- */
/*                                HELPER WIDGETS                              */
/* -------------------------------------------------------------------------- */

class RailOneLogo extends StatelessWidget {
  const RailOneLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/railone.png',
      width: 150,
      height: 62,
      fit: BoxFit.contain,
    );
  }
}

class DashedLine extends StatelessWidget {
  final Color  color;
  final double dashWidth;
  final double dashHeight;
  final double spacing;

  const DashedLine({
    super.key,
    required this.color,
    this.dashWidth = 2,
    this.dashHeight = 1.2,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        final count = (constraints.maxWidth / (dashWidth + spacing)).floor();
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            count,
            (_) => Container(
              width: dashWidth,
              height: dashHeight,
              color: color,
            ),
          ),
        );
      },
    );
  }
}

class _DetailPair extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _DetailPair({
    required this.label,
    required this.value,
    required this.alignEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          textAlign: alignEnd ? TextAlign.right : TextAlign.left,
          style: const TextStyle(
            fontSize: 14.8,
            fontWeight: FontWeight.w700,
            color: AppColors.textBlack,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class _PersonDetail extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _PersonDetail({
    required this.label,
    required this.value,
    required this.alignEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.mutedText,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          textAlign: alignEnd ? TextAlign.right : TextAlign.left,
          style: const TextStyle(
            fontSize: 16.2,
            fontWeight: FontWeight.w700,
            color: AppColors.titleBlack,
            height: 1.2,
          ),
        ),
      ],
    );
  }
}

class TicketShapeBorder extends OutlinedBorder {
  final double notchRadius;
  final double notchPosition;
  final double borderRadius;

  const TicketShapeBorder({
    super.side = BorderSide.none,
    required this.notchRadius,
    required this.notchPosition,
    this.borderRadius = 14.0,
  });

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _ticketPath(rect, notchRadius, notchPosition, borderRadius, side.width);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _ticketPath(rect, notchRadius, notchPosition, borderRadius, 0);
  }

  Path _ticketPath(Rect rect, double radius, double position, double bRadius, double inset) {
    final innerRect = rect.deflate(inset);
    final path = Path();
    path.addRRect(RRect.fromRectAndRadius(innerRect, Radius.circular(bRadius)));

    final leftNotch = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(rect.left + inset, rect.top + position),
        radius: radius,
      ));

    final rightNotch = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(rect.right - inset, rect.top + position),
        radius: radius,
      ));

    return Path.combine(
      PathOperation.difference,
      path,
      Path.combine(PathOperation.union, leftNotch, rightNotch),
    );
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (side.style == BorderStyle.none) return;
    final paint = side.toPaint();
    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is TicketShapeBorder) {
      return TicketShapeBorder(
        side: BorderSide.lerp(a.side, side, t),
        notchRadius: lerpDouble(a.notchRadius, notchRadius, t)!,
        notchPosition: lerpDouble(a.notchPosition, notchPosition, t)!,
        borderRadius: lerpDouble(a.borderRadius, borderRadius, t)!,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is TicketShapeBorder) {
      return TicketShapeBorder(
        side: BorderSide.lerp(side, b.side, t),
        notchRadius: lerpDouble(notchRadius, b.notchRadius, t)!,
        notchPosition: lerpDouble(notchPosition, b.notchPosition, t)!,
        borderRadius: lerpDouble(borderRadius, b.borderRadius, t)!,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  ShapeBorder scale(double t) => TicketShapeBorder(
        side: side.scale(t),
        notchRadius: notchRadius * t,
        notchPosition: notchPosition * t,
        borderRadius: borderRadius * t,
      );

  @override
  OutlinedBorder copyWith({
    BorderSide? side,
    double? notchRadius,
    double? notchPosition,
    double? borderRadius,
  }) {
    return TicketShapeBorder(
      side: side ?? this.side,
      notchRadius: notchRadius ?? this.notchRadius,
      notchPosition: notchPosition ?? this.notchPosition,
      borderRadius: borderRadius ?? this.borderRadius,
    );
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is TicketShapeBorder &&
        other.side == side &&
        other.notchRadius == notchRadius &&
        other.notchPosition == notchPosition &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => Object.hash(side, notchRadius, notchPosition, borderRadius);
}

/* -------------------------------------------------------------------------- */
/*                                  PAINTERS                                  */
/* -------------------------------------------------------------------------- */

class RailOneLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Paint()
      ..color = AppColors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final main = Path()
      ..moveTo(size.width * 0.18, size.height * 0.55)
      ..quadraticBezierTo(
        size.width * 0.58,
        size.height * 0.08,
        size.width * 0.82,
        size.height * 0.28,
      )
      ..quadraticBezierTo(
        size.width * 0.92,
        size.height * 0.36,
        size.width * 0.88,
        size.height * 0.62,
      )
      ..quadraticBezierTo(
        size.width * 0.84,
        size.height * 0.79,
        size.width * 0.70,
        size.height * 0.77,
      );

    final line1 = Path()
      ..moveTo(size.width * 0.16, size.height * 0.53)
      ..quadraticBezierTo(
        size.width * 0.34,
        size.height * 0.40,
        size.width * 0.53,
        size.height * 0.40,
      );

    final line2 = Path()
      ..moveTo(size.width * 0.18, size.height * 0.59)
      ..quadraticBezierTo(
        size.width * 0.40,
        size.height * 0.48,
        size.width * 0.58,
        size.height * 0.50,
      );

    final inner = Path()
      ..moveTo(size.width * 0.60, size.height * 0.33)
      ..quadraticBezierTo(
        size.width * 0.70,
        size.height * 0.48,
        size.width * 0.72,
        size.height * 0.62,
      );

    canvas.drawPath(main, p);
    canvas.drawPath(line1, p);
    canvas.drawPath(line2, p);
    canvas.drawPath(inner, p);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}


