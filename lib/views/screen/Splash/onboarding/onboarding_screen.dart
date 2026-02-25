import 'package:flutter/material.dart';
import 'package:flutter_extension/helper/route_helper.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _onboardingData = [
    OnboardingModel(
      title: "Your Privacy Comes First",
      description:
          "End-to-end encrypted messaging built to protect your conversations.",
      image: "assets/images/image.png",
    ),
    OnboardingModel(
      title: "Discover Channels",
      description: "Explore and join featured & trending communities.",
      image: "assets/images/image2.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      print("Navigating to: ${AppRoutes.welcomeScreen}");
      Get.offAllNamed(AppRoutes.welcomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(color: Color(0xFF0E0A32)),
        child: SafeArea(
          child: Column(
            children: [
              // PageView
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      title: _onboardingData[index].title,
                      description: _onboardingData[index].description,
                      image: _onboardingData[index].image,
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SmoothPageIndicator(
                      controller: _pageController,
                      count: _onboardingData.length,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        activeDotColor: Color(0xFF1DA9FF),
                        dotColor: Color(0xFF2D3373),
                        spacing: 8,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Next/Get Started button
                    Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFF41DC), Color(0xFF1DA9FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: _nextPage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _currentPage == _onboardingData.length - 1
                                  ? "Get Started"
                                  : "Next",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            if (_currentPage != _onboardingData.length - 1) ...[
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 16,
                              ),
                            ],
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
      ),
    );
  }
}

// Onboarding Page Widget
class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Image/Illustration
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF0E0A32),
                  blurRadius: 30,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Image.asset(image, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 40),

        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white70,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            height: 1.5,
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}

// Model class
class OnboardingModel {
  final String title;
  final String description;
  final String image;

  OnboardingModel({
    required this.title,
    required this.description,
    required this.image,
  });
}
