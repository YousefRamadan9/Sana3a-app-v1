import 'package:flutter/material.dart';

void main() {
  runApp(const San3aApp());
}

// --- Data Models & Mock Data ---

class Service {
  final String id;
  final String name;
  final String icon;
  final Color color;
  final Color iconColor;
  final String description;

  Service({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.iconColor,
    required this.description,
  });
}

class Worker {
  final String id;
  final String serviceId;
  final String name;
  final double rating;
  final int jobs;
  final double rate;
  final String imageUrl;
  final bool verified;

  Worker({
    required this.id,
    required this.serviceId,
    required this.name,
    required this.rating,
    required this.jobs,
    required this.rate,
    required this.imageUrl,
    required this.verified,
  });
}

final List<Service> services = [
  Service(
    id: "s1",
    name: "سباكة",
    icon: "🔧",
    color: Colors.blue.shade50,
    iconColor: Colors.blue,
    description: "إصلاح التسريبات، تركيب الأنابيب، والصيانة العامة.",
  ),
  Service(
    id: "s2",
    name: "كهرباء",
    icon: "⚡",
    color: Colors.amber.shade50,
    iconColor: Colors.amber.shade700,
    description: "توصيلات كهربائية، تركيبات، وإصلاح الأعطال.",
  ),
  Service(
    id: "s3",
    name: "نظافة",
    icon: "✨",
    color: Colors.green.shade50,
    iconColor: Colors.green,
    description: "تنظيف عميق للمنازل والمكاتب.",
  ),
  Service(
    id: "s4",
    name: "نجارة",
    icon: "🪚",
    color: Colors.orange.shade50,
    iconColor: Colors.orange.shade800,
    description: "إصلاح الأثاث والأعمال الخشبية المخصصة.",
  ),
  Service(
    id: "s5",
    name: "نقاشة",
    icon: "🎨",
    color: Colors.purple.shade50,
    iconColor: Colors.purple,
    description: "دهانات داخلية وخارجية وتجديد الديكور.",
  ),
  Service(
    id: "s6",
    name: "تكييف",
    icon: "❄️",
    color: Colors.cyan.shade50,
    iconColor: Colors.cyan,
    description: "صيانة وتنظيف أجهزة التكييف.",
  ),
];

final List<Worker> workers = [
  Worker(
    id: "w1",
    serviceId: "s1",
    name: "أحمد حسن",
    rating: 4.8,
    jobs: 120,
    rate: 50,
    imageUrl:
        "https://images.unsplash.com/photo-1560250097-0b93528c311a?auto=format&fit=crop&q=80&w=200",
    verified: true,
  ),
  Worker(
    id: "w2",
    serviceId: "s1",
    name: "محمود علي",
    rating: 4.5,
    jobs: 85,
    rate: 45,
    imageUrl:
        "https://images.unsplash.com/photo-1540569014015-19a7be504e3a?auto=format&fit=crop&q=80&w=200",
    verified: true,
  ),
  Worker(
    id: "w3",
    serviceId: "s2",
    name: "سارة عثمان",
    rating: 4.9,
    jobs: 200,
    rate: 60,
    imageUrl:
        "https://images.unsplash.com/photo-1573496359-136d475583dc?auto=format&fit=crop&q=80&w=200",
    verified: true,
  ),
  Worker(
    id: "w4",
    serviceId: "s3",
    name: "فريق كلين كو",
    rating: 4.7,
    jobs: 340,
    rate: 35,
    imageUrl:
        "https://images.unsplash.com/photo-1581578731117-1045293d2f2d?auto=format&fit=crop&q=80&w=200",
    verified: true,
  ),
];

// --- Main Application ---

class San3aApp extends StatelessWidget {
  const San3aApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'San3a - صنعة',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        fontFamily: 'Arial', // Fallback for Arabic support
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      // Enforce RTL for Arabic
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child!,
        );
      },
      home: const OnboardingScreen(),
    );
  }
}

// --- Screens ---

// 1. Onboarding Screen
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  final List<Map<String, String>> _onboardingData = [
    {
      "title": "اعثر على حرفيين محترفين",
      "desc": "تواصل مع أمهر الفنيين والعمال لجميع احتياجات منزلك.",
      "image":
          "https://images.unsplash.com/photo-1581578731117-1045293d2f2d?auto=format&fit=crop&q=80&w=600"
    },
    {
      "title": "حجز سهل وسريع",
      "desc": "حدد الموعد المناسب لك واحجز الخدمة بضغطات بسيطة.",
      "image":
          "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?auto=format&fit=crop&q=80&w=600"
    },
    {
      "title": "ضمان الجودة والرضا",
      "desc": "مدفوعات آمنة وضمان جودة الخدمة لراحة بالك.",
      "image":
          "https://images.unsplash.com/photo-1556742049-0cfed4f7a07d?auto=format&fit=crop&q=80&w=600"
    },
  ];

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const LandingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) =>
                      setState(() => _currentPage = value),
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      child: Image.network(
                        _onboardingData[index]["image"]!,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LandingScreen())),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(0.9),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text("تخطي",
                        style: TextStyle(color: Colors.grey)),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        _onboardingData[_currentPage]["title"]!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _onboardingData[_currentPage]["desc"]!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, color: Colors.grey[600], height: 1.5),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _onboardingData.length,
                          (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            height: 8,
                            width: _currentPage == index ? 32 : 8,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? Colors.blue
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: ElevatedButton(
                          onPressed: _nextPage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            elevation: 8,
                            shadowColor: Colors.blue.withOpacity(0.3),
                          ),
                          child: Text(
                            _currentPage == _onboardingData.length - 1
                                ? "ابدأ الآن"
                                : "التالي",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 2. Landing Screen
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: const NetworkImage(
                "https://www.transparenttextures.com/patterns/cubes.png"), // Subtle pattern placeholder
            opacity: 0.05,
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.blue[600],
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blue.withOpacity(0.4),
                      blurRadius: 20,
                      offset: const Offset(0, 10))
                ],
              ),
              child: const Icon(Icons.work, size: 48, color: Colors.white),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                    fontFamily: 'Arial'),
                children: [
                  const TextSpan(text: "صن"),
                  TextSpan(
                      text: "عة", style: TextStyle(color: Colors.blue[600])),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "منصتك الموثوقة للأيادي الماهرة والخدمات المنزلية",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AuthScreen(isLogin: true))),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 0,
                ),
                child: const Text("تسجيل الدخول",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: OutlinedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const AuthScreen(isLogin: false))),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.grey[800],
                  side: BorderSide(color: Colors.grey[300]!),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("إنشاء حساب جديد",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 32),
            GestureDetector(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const AdminLoginScreen())),
              child: Text(
                "هل أنت حرفي؟ دخول المسؤول",
                style: TextStyle(
                    color: Colors.blue[600], fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. Auth Screen (Login/Signup)
class AuthScreen extends StatefulWidget {
  final bool isLogin;
  const AuthScreen({super.key, required this.isLogin});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late bool _isLogin;

  @override
  void initState() {
    super.initState();
    _isLogin = widget.isLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _isLogin ? "مرحباً بعودتك!" : "إنشاء حساب",
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _isLogin ? "سجل دخولك للمتابعة" : "املأ بياناتك للبدء",
              style: TextStyle(fontSize: 16, color: Colors.grey[500]),
            ),
            const SizedBox(height: 40),
            if (!_isLogin) ...[
              const CustomTextField(
                  label: "الاسم الكامل", icon: Icons.person_outline),
              const SizedBox(height: 16),
            ],
            const CustomTextField(
                label: "البريد الإلكتروني", icon: Icons.email_outlined),
            const SizedBox(height: 16),
            const CustomTextField(
                label: "كلمة المرور",
                icon: Icons.lock_outline,
                isPassword: true),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const MainScreen()),
                    (route) => false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 5,
                  shadowColor: Colors.blue.withOpacity(0.4),
                ),
                child: Text(_isLogin ? "تسجيل الدخول" : "إنشاء حساب",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_isLogin ? "ليس لديك حساب؟ " : "لديك حساب بالفعل؟ ",
                    style: TextStyle(color: Colors.grey[600])),
                GestureDetector(
                  onTap: () => setState(() => _isLogin = !_isLogin),
                  child: Text(
                    _isLogin ? "أنشئ حساباً" : "سجل الدخول",
                    style: TextStyle(
                        color: Colors.blue[600], fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isPassword;

  const CustomTextField(
      {super.key,
      required this.label,
      required this.icon,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.black87)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            prefixIcon: Icon(icon, color: Colors.grey[400]),
            hintText: label,
            filled: true,
            fillColor: Colors.grey[50],
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.blue[200]!, width: 2)),
          ),
        ),
      ],
    );
  }
}

// 4. Admin Login
class AdminLoginScreen extends StatelessWidget {
  const AdminLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate 900
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.blue[500],
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(Icons.admin_panel_settings,
                  size: 40, color: Colors.white),
            ),
            const SizedBox(height: 24),
            const Text("بوابة المسؤولين",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const Text("وصول مقيد للموظفين فقط",
                style: TextStyle(color: Colors.grey, fontSize: 14)),
            const SizedBox(height: 40),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "معرف المسؤول",
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "كلمة المرور",
                hintStyle: TextStyle(color: Colors.grey[500]),
                filled: true,
                fillColor: const Color(0xFF1E293B),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none),
              ),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
                child: const Text("دخول للوحة التحكم"),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("العودة للتطبيق",
                  style: TextStyle(color: Colors.grey)),
            )
          ],
        ),
      ),
    );
  }
}

// 5. Main Screen (Bottom Nav Container)
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const OrdersScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.shade100)),
        ),
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.home_rounded, "الرئيسية"),
            _buildNavItem(1, Icons.calendar_month_rounded, "حجوزاتي"),
            _buildNavItem(2, Icons.person_rounded, "حسابي"),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label) {
    bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon,
              color: isSelected ? Colors.blue[600] : Colors.grey[400],
              size: 28),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.blue[600] : Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}

// 6. Home Screen (Services)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الموقع الحالي",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 12)),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color: Colors.blue[600], size: 16),
                              const SizedBox(width: 4),
                              const Text("القاهرة، مصر",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ],
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: const NetworkImage(
                            "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=200"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "عن أي خدمة تبحث؟",
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[100],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.blue.shade700,
                          Colors.indigo.shade600
                        ]),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 8))
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("خصم 20%",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22)),
                              const SizedBox(height: 4),
                              Text("على خدمة التنظيف الأولى",
                                  style: TextStyle(color: Colors.blue[100])),
                              const SizedBox(height: 16),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Text("احصل عليه الآن",
                                    style: TextStyle(
                                        color: Colors.blue[700],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ),
                            ],
                          ),
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Icon(Icons.star,
                                size: 80, color: Colors.white.withOpacity(0.1)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text("التصنيفات",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 16),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              childAspectRatio: 1.1),
                      itemCount: services.length,
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return GestureDetector(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      WorkerDetailsScreen(service: service))),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade100),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.05),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4))
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: service.color,
                                      shape: BoxShape.circle),
                                  child: Text(service.icon,
                                      style: const TextStyle(fontSize: 28)),
                                ),
                                const SizedBox(height: 12),
                                Text(service.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 40),
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

// 7. Worker Details Screen
class WorkerDetailsScreen extends StatelessWidget {
  final Service service;
  const WorkerDetailsScreen({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final filteredWorkers =
        workers.where((w) => w.serviceId == service.id).toList();

    return Scaffold(
      appBar: AppBar(title: Text(service.name), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${filteredWorkers.length} فنيين متاحين بالقرب منك",
                style: TextStyle(color: Colors.grey[600])),
            const SizedBox(height: 16),
            Expanded(
              child: filteredWorkers.isEmpty
                  ? Center(
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey[300]),
                      const SizedBox(height: 16),
                      Text("لا يوجد فنيين متاحين حالياً",
                          style: TextStyle(color: Colors.grey[400]))
                    ]))
                  : ListView.builder(
                      itemCount: filteredWorkers.length,
                      itemBuilder: (context, index) {
                        final worker = filteredWorkers[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey.shade100),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2))
                              ]),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(worker.imageUrl,
                                    width: 80, height: 80, fit: BoxFit.cover),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(worker.name,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        if (worker.verified)
                                          const Icon(Icons.verified,
                                              color: Colors.blue, size: 16),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Text("متخصص ${service.name}",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[500])),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("${worker.rate}\$ / ساعة",
                                            style: TextStyle(
                                                color: Colors.blue[700],
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.amber.shade50,
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: Row(children: [
                                            const Icon(Icons.star,
                                                size: 14, color: Colors.amber),
                                            const SizedBox(width: 4),
                                            Text(worker.rating.toString(),
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.amber.shade900))
                                          ]),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              ElevatedButton(
                                onPressed: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) =>
                                            BookingScreen(worker: worker))),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[100],
                                  foregroundColor: Colors.black,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  minimumSize: const Size(60, 40),
                                ),
                                child: const Text("حجز"),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// 8. Booking Screen
class BookingScreen extends StatefulWidget {
  final Worker worker;
  const BookingScreen({super.key, required this.worker});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int _selectedDate = 0;
  int? _selectedTime;
  final List<String> _dates = [
    "الاثنين 12",
    "الثلاثاء 13",
    "الأربعاء 14",
    "الخميس 15",
    "الجمعة 16"
  ];
  final List<String> _times = [
    "09:00 ص",
    "10:00 ص",
    "11:00 ص",
    "02:00 م",
    "04:00 م"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حجز موعد"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16)),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.worker.imageUrl),
                            radius: 24),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.worker.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                            Text("${widget.worker.rate}\$ / الساعة",
                                style: TextStyle(
                                    color: Colors.grey[600], fontSize: 14)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text("اختر اليوم",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(_dates.length, (index) {
                        bool isSelected = _selectedDate == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedDate = index),
                          child: Container(
                            margin: const EdgeInsets.only(left: 12),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 16),
                            decoration: BoxDecoration(
                              color:
                                  isSelected ? Colors.blue[600] : Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.blue[600]!
                                      : Colors.grey.shade200),
                            ),
                            child: Column(
                              children: [
                                Text(_dates[index].split(" ")[0],
                                    style: TextStyle(
                                        color: isSelected
                                            ? Colors.white70
                                            : Colors.grey,
                                        fontSize: 12)),
                                const SizedBox(height: 4),
                                Text(_dates[index].split(" ")[1],
                                    style: TextStyle(
                                        color: isSelected
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text("اختر الوقت",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(_times.length, (index) {
                      bool isSelected = _selectedTime == index;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedTime = index),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.blue[600] : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                                color: isSelected
                                    ? Colors.blue[600]!
                                    : Colors.grey.shade200),
                          ),
                          child: Text(_times[index],
                              style: TextStyle(
                                  color: isSelected
                                      ? Colors.white
                                      : Colors.black87,
                                  fontWeight: FontWeight.w500)),
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),
                  const Text("وصف المشكلة",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 12),
                  TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "اشرح المشكلة باختصار...",
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.shade200)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(color: Colors.grey.shade200)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: _selectedTime == null
                    ? null
                    : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const PaymentScreen())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text("المتابعة للدفع",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 9. Payment Screen
class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الدفع"), centerTitle: true),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade100),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.02),
                              blurRadius: 10,
                              offset: const Offset(0, 4))
                        ]),
                    child: const Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("رسوم الخدمة",
                                  style: TextStyle(color: Colors.grey)),
                              Text("50.00\$",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                        SizedBox(height: 12),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("ضريبة الحجز",
                                  style: TextStyle(color: Colors.grey)),
                              Text("2.00\$",
                                  style: TextStyle(fontWeight: FontWeight.bold))
                            ]),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            child: Divider()),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("الإجمالي",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              Text("52.00\$",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blue))
                            ]),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text("طريقة الدفع",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(height: 16),
                  _buildPaymentOption(
                      Icons.credit_card, "بطاقة ائتمان", "**** 4242", true),
                  const SizedBox(height: 12),
                  _buildPaymentOption(Icons.money, "الدفع عند الاستلام",
                      "ادفع عند انتهاء الخدمة", false),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const SuccessScreen())),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16))),
                child: const Text("تأكيد الحجز",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(
      IconData icon, String title, String subtitle, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: isSelected ? Colors.blue[600]! : Colors.grey.shade200,
            width: isSelected ? 2 : 1),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade50 : Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12)),
            child: Icon(icon,
                color: isSelected ? Colors.blue[600] : Colors.grey[600]),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(subtitle,
                  style: TextStyle(color: Colors.grey[500], fontSize: 12)),
            ],
          ),
          const Spacer(),
          if (isSelected) Icon(Icons.check_circle, color: Colors.blue[600]),
        ],
      ),
    );
  }
}

// 10. Success/Rating Screen
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.green.shade100, shape: BoxShape.circle),
                child:
                    Icon(Icons.check, size: 48, color: Colors.green.shade700),
              ),
              const SizedBox(height: 32),
              const Text("تم الحجز بنجاح!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              Text("تم تأكيد موعدك بنجاح. سنرسل لك تفاصيل الحجز قريباً.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[500])),
              const SizedBox(height: 48),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Text("كيف كانت تجربة الحجز؟",
                        style: TextStyle(color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          5,
                          (index) => const Icon(Icons.star,
                              color: Colors.amber, size: 32)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainScreen()),
                      (route) => false),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[600],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  child: const Text("العودة للرئيسية",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 11. Orders Screen
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حجوزاتي"), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _buildOrderItem(
            title: "إصلاح سباكة",
            date: "اليوم، 02:00 م",
            icon: "🔧",
            status: "قادم",
            statusColor: Colors.blue,
            isUpcoming: true,
          ),
          const SizedBox(height: 16),
          _buildOrderItem(
            title: "تنظيف منزلي",
            date: "12 أغسطس، 10:00 ص",
            icon: "✨",
            status: "مكتمل",
            statusColor: Colors.green,
            isUpcoming: false,
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(
      {required String title,
      required String date,
      required String icon,
      required String status,
      required Color statusColor,
      required bool isUpcoming}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: isUpcoming ? Colors.blue.shade100 : Colors.grey.shade100),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child:
                            Text(icon, style: const TextStyle(fontSize: 24))),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 4),
                      Text(date,
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 13)),
                    ],
                  ),
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(status,
                    style: TextStyle(
                        color: statusColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12)),
              ),
            ],
          ),
          if (isUpcoming) ...[
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 16), child: Divider()),
            Row(
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("إعادة جدولة"))),
                const SizedBox(width: 12),
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[600],
                            foregroundColor: Colors.white),
                        child: const Text("تتبع"))),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// 12. Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("حسابي"), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=200"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.blue[600],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2)),
                      child:
                          const Icon(Icons.edit, size: 14, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text("أحمد محمد",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text("ahmed@example.com",
                style: TextStyle(color: Colors.grey[500])),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  _buildProfileItem(Icons.person_outline, "تعديل الملف الشخصي"),
                  _buildProfileItem(
                      Icons.location_on_outlined, "العناوين المحفوظة"),
                  _buildProfileItem(Icons.credit_card, "طرق الدفع"),
                  _buildProfileItem(Icons.lock_outline, "الخصوصية والأمان"),
                  _buildProfileItem(
                      Icons.headset_mic_outlined, "المساعدة والدعم"),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const LandingScreen()),
                        (route) => false),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.red.shade50,
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Colors.red.shade400),
                          const SizedBox(width: 16),
                          Text("تسجيل الخروج",
                              style: TextStyle(
                                  color: Colors.red.shade700,
                                  fontWeight: FontWeight.bold)),
                        ],
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

  Widget _buildProfileItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10)),
          child: Icon(icon, color: Colors.grey[700], size: 20),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.white,
      ),
    );
  }
}

// 13. Dashboard Screen (Admin)
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
            decoration: const BoxDecoration(color: Color(0xFF0F172A)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("لوحة التحكم",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    IconButton(
                        onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const LandingScreen())),
                        icon: const Icon(Icons.logout, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("المبيعات",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            SizedBox(height: 8),
                            Text("\$12,450",
                                style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white10)),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("النشطين",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            SizedBox(height: 8),
                            Text("1,204",
                                style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("النشاطات الأخيرة",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: 5,
                      separatorBuilder: (c, i) => const Divider(height: 32),
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: Colors.blue.shade50,
                                child: Text("JD",
                                    style: TextStyle(
                                        color: Colors.blue.shade700,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12))),
                            const SizedBox(width: 16),
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("حجز جديد بواسطة جون دو",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text("منذ دقيقتين",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
