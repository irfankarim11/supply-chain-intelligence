import 'package:flutter/material.dart';

class ActionChainScreen extends StatelessWidget {
  const ActionChainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Hardcoded action plan with the precise values provided
    final List<Map<String, dynamic>> actions = [
      {
        "id": "ACT-001",
        "title": "Map bypass route via rural paths",
        "owner": "Logistics Team",
        "time": "2 hours",
        "cost": "PKR 0",
        "hasWarning": false,
      },
      {
        "id": "ACT-002",
        "title": "Dispatch LTV Fleet via WhatsApp API",
        "owner": "Fleet Manager",
        "time": "12 hours",
        "cost": "PKR 150",
        "hasWarning": true,
      },
      {
        "id": "ACT-003",
        "title": "Secure emergency units locally",
        "owner": "Procurement Team",
        "time": "6 hours",
        "cost": "PKR 420000",
        "hasWarning": false,
      },
      {
        "id": "ACT-004",
        "title": "Update customer ETAs",
        "owner": "Customer Service",
        "time": "1 hour",
        "cost": "PKR 0",
        "hasWarning": false,
      },
      {
        "id": "ACT-005",
        "title": "Activate Cross-docking bays",
        "owner": "Warehouse Manager",
        "time": "8 hours",
        "cost": "PKR 0",
        "hasWarning": false,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Action Plan'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: actions.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> action = actions[index];
                final bool isLast = index == actions.length - 1;
                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Timeline line & node
                      Column(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 2,
                                color: Theme.of(context).colorScheme.secondary.withOpacity(0.5),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      // Action Card
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      action['id'] as String,
                                      style: TextStyle(
                                        color: Theme.of(context).colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (action['hasWarning'] == true)
                                      const Icon(
                                        Icons.warning_rounded,
                                        color: Colors.amber,
                                        size: 20,
                                      ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  action['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                // Using proper string interpolation syntax without literal escapes
                                _buildDetailRow(Icons.person, 'Owner: ${action["owner"]}'),
                                const SizedBox(height: 4),
                                _buildDetailRow(Icons.access_time, 'Est. Time: ${action["time"]}'),
                                const SizedBox(height: 4),
                                _buildDetailRow(Icons.monetization_on, 'Cost: ${action["cost"]}'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/outcome');
                },
                child: const Text('Run Simulation'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 14, color: Colors.white54),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ],
    );
  }
}
