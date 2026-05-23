import 'package:flutter/material.dart';
import 'add_task_screen.dart';

// A simple data class to hold each task's info.
// No database yet — just a plain Dart object for the UI.
class Task {
  final String id;
  final String title;
  final String time;
  final String status; // 'Done', 'In Progress', or 'To-do'
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;

  const Task({
    required this.id,
    required this.title,
    required this.time,
    required this.status,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
  });
}

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // These are our sample tasks that match the UI screenshot exactly
    final List<Task> tasks = const [
      Task(
        id: '01',
        title: 'Market Research',
        time: '10:00 AM (10 minutes ago)',
        status: 'Done',
        icon: Icons.shopping_bag_outlined,
        iconBgColor: Color(0xFFFCE4EC),
        iconColor: Color(0xFFE91E63),
      ),
      Task(
        id: '02',
        title: 'Competitive Analysis',
        time: '12:00 PM',
        status: 'In Progress',
        icon: Icons.shopping_bag_outlined,
        iconBgColor: Color(0xFFFCE4EC),
        iconColor: Color(0xFFE91E63),
      ),
      Task(
        id: '03',
        title: 'Create Low-fidelity Wireframe',
        time: '07:00 PM',
        status: 'To-do',
        icon: Icons.person_outline_rounded,
        iconBgColor: Color(0xFFEDE7F6),
        iconColor: Color(0xFF7C3AED),
      ),
      Task(
        id: '04',
        title: 'How to pitch a Design Sprint',
        time: '09:00 PM',
        status: 'To-do',
        icon: Icons.menu_book_outlined,
        iconBgColor: Color(0xFFFFF3E0),
        iconColor: Color(0xFFFF8F00),
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FB),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'To-Do List',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1A1A2E),
                ),
              ),
              const SizedBox(height: 20),

              // ListView takes up all remaining space and scrolls nicely
              Expanded(
                child: ListView.separated(
                  itemCount: tasks.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return _TaskCard(task: tasks[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // The FAB navigates to AddTaskScreen using MaterialPageRoute
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const AddTaskScreen()),
          );
        },
        backgroundColor: const Color(0xFF6C3EF4),
        elevation: 4,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

// Keeping the card in its own widget makes the ListView code clean and readable
class _TaskCard extends StatelessWidget {
  final Task task;

  const _TaskCard({required this.task});

  // Each status gets a different text and background color — just like the design
  Color _statusTextColor() {
    switch (task.status) {
      case 'Done':
        return const Color(0xFF6C3EF4);
      case 'In Progress':
        return const Color(0xFFFF8F00);
      default:
        return const Color(0xFF9C8FE6);
    }
  }

  Color _statusBgColor() {
    switch (task.status) {
      case 'Done':
        return const Color(0xFFEDE7F6);
      case 'In Progress':
        return const Color(0xFFFFF3E0);
      default:
        return const Color(0xFFF3F0FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side: ID, title, time, and status badge
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ID: ${task.id}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFAAAAAA),
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 8),

                // Time + status badge sit side by side on the same row
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_rounded,
                      size: 14,
                      color: Color(0xFF6C3EF4),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: Text(
                        task.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFFAAAAAA),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 3,
                      ),
                      decoration: BoxDecoration(
                        color: _statusBgColor(),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        task.status,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: _statusTextColor(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Right side: colored icon box representing the task group
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: task.iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(task.icon, color: task.iconColor, size: 20),
          ),
        ],
      ),
    );
  }
}
