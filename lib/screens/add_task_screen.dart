import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),

      // Custom AppBar to match the design: back arrow on the left, centered title
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: Color(0xFF1A1A2E)),
        ),
        title: const Text(
          'Add Task',
          style: TextStyle(
            color: Color(0xFF1A1A2E),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              // Task Group card — shows the currently selected group
              // In a real app this would open a group picker on tap
              _SectionCard(
                child: Row(
                  children: [
                    // Colored icon box for the task group
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFCE4EC),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Color(0xFFE91E63),
                        size: 19,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Task Group',
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xFFAAAAAA),
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Work',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1A1A2E),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 14),

              // Description field — uses TextFormField inside a styled card
              _SectionCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFFAAAAAA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      maxLines: 6,
                      // initialValue pre-fills the field to match the screenshot
                      initialValue:
                          'This application is designed for super shops. By using '
                          'this application they can enlist all their products in one '
                          'place and can deliver. Customers will get a one-stop '
                          'solution for their daily shopping.',
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Write your task description here...',
                        hintStyle: TextStyle(
                          fontSize: 13,
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 13.5,
                        color: Color(0xFF424242),
                        height: 1.55,
                      ),
                    ),
                  ],
                ),
              ),

              // Spacer pushes the Add button to the bottom of the screen
              const Spacer(),

              // Add button — full width, rounded, purple
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    // For now we just go back.
                    // Later you could collect form data and save it here.
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C3EF4),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}

// A reusable white card with a soft shadow — used for both sections above
class _SectionCard extends StatelessWidget {
  final Widget child;

  const _SectionCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: child,
    );
  }
}
