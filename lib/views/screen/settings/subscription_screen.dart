import 'package:flutter/material.dart';
import 'package:flutter_extension/util/app_colors.dart';
import 'package:flutter_extension/views/base/custom_grident_design.dart';
import 'package:get/route_manager.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int selectedPlan = 0; // 0 = Standard, 1 = Premium

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustomGridentDesign(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: AppColors.textColor,
                        ),
                      ),
                      const SizedBox(width: 24),
                      const Text(
                        "Subscription",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          _buildPlanCard(
                            title: "Standard",
                            description: "Visual enhancement only",
                            price: "\$5",
                            period: "/month",
                            features: [
                              "Multiple font styles",
                              "Animated text in channels",
                              "Custom emojis",
                            ],
                            isSelected: selectedPlan == 0,
                            onTap: () {
                              setState(() {
                                selectedPlan = 0;
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          _buildPlanCard(
                            title: "Premium",
                            description: "Full access to all features",
                            price: "\$12",
                            period: "/month",
                            features: [
                              "All Standard features",
                              "HD video calls",
                              "Priority support",
                              "Cloud storage 50GB",
                            ],
                            isSelected: selectedPlan == 1,
                            onTap: () {
                              setState(() {
                                selectedPlan = 1;
                              });
                            },
                          ),
                        ],
                      ),
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

  Widget _buildPlanCard({
    required String title,
    required String description,
    required String price,
    required String period,
    required List<String> features,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFF101010),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected
                ? const Color(0xFFFF6A00).withValues(alpha: 0.30)
                : Colors.white.withValues(alpha: 0.06),
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    period,
                    style: TextStyle(
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Divider(
              color: Colors.white.withValues(alpha: 0.08),
              thickness: 1,
              height: 1,
            ),
            const SizedBox(height: 20),
            ...features.map(
              (feature) => Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Row(
                  children: [
                    Icon(Icons.check, color: AppColors.textColor, size: 18),
                    const SizedBox(width: 10),
                    Text(
                      feature,
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            _buildButton(isSelected: isSelected),
          ],
        ),
      ),
    );
  }

  Widget _buildButton({required bool isSelected}) {
    if (isSelected) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(1.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF3D2000),
              Color(0xFFCC8800),
              Color(0xFFFFAA00),
            ],
            stops: [0.0, 0.6, 1.0],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF0C0C0C),
                Color(0xFF0C0C0C),
                Color(0xFF3D2500),
                Color(0xFFCC8800),
              ],
              stops: [0.0, 0.3, 0.7, 1.0],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: const Center(
            child: Text(
              "Start Now",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white.withValues(alpha: 0.06),
        ),
        child: Center(
          child: Text(
            "Start Now",
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.40),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    }
  }
}
