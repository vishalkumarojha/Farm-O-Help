import 'package:flutter/material.dart';
import 'dart:ui'; // For BackdropFilter
import 'plant_disease_detector.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: [
          _buildPage(
            title: "Welcome to Farm-O-Help!",
            subtitle: "We’re glad you’re here, let’s get started",
            actionText: "Swipe →",
            onTap: () => _controller.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            ),
          ),
          _buildPage(
            title: "Tips & Tricks",
            subtitle: "To keep your plants healthy and prevent diseases, regularly inspect them for signs of trouble, practice proper watering techniques, and maintain healthy soil. Use disease-resistant varieties, avoid overcrowding, and rotate crops to reduce disease buildup. Clean tools between uses, prune infected parts, and apply organic pesticides when necessary. Encourage natural predators and ensure your plants get enough sunlight. Lastly, use a plant disease detection app for quick identification and follow expert tips for effective treatment",
            actionText: "Get Started",
            isLast: true,
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const PlantDiseaseDetector()),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String title,
    required String subtitle,
    required String actionText,
    required VoidCallback onTap,
    bool isLast = false,
  }) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Background image
        Image.asset(
          "assets/images/onboarding_bg.jpg",
          fit: BoxFit.cover,
        ),
        // Backdrop filter for glassmorphism effect
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), // Apply blur effect
          child: Container(
            color: Colors.black.withOpacity(0.3), // Semi-transparent overlay for glassmorphism
          ),
        ),
        // Content
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 60),
              Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color set to white
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white, // Text color set to white
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: isLast ? Colors.black : Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    border: isLast
                        ? null
                        : Border.all(color: Colors.green.shade700),
                  ),
                  child: Text(
                    actionText,
                    style: TextStyle(
                      fontSize: 16,
                      color: isLast ? Colors.white : Colors.green.shade700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
