import 'package:flutter/material.dart';
import '../models/data_service.dart';

class OutcomeScreen extends StatelessWidget {
  const OutcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine dynamic vs hardcoded data based on Simulation_output.json
    final Map<String, dynamic>? simData = DataService.simulationOutput;
    
    // We stick to the prompt's hardcoded UI requirements where specified,
    // but structure it referencing the expected data structure if it were loaded.
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulation Results'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // BEFORE vs AFTER Section
            const Text(
              'Impact Assessment',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: _buildRiskCard('Before', 'CRITICAL', Colors.red, context)),
                const SizedBox(width: 16),
                const Icon(Icons.arrow_forward_rounded, color: Colors.white54),
                const SizedBox(width: 16),
                Expanded(child: _buildRiskCard('After', 'MEDIUM', Colors.amber, context)),
              ],
            ),
            const SizedBox(height: 32),

            // Execution Log Section
            const Text(
              'Execution Log',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white12),
              ),
              child: Column(
                children: [
                  _buildLogItem('ACT-001', 'Bypass route mapped', 'SUCCESS', Colors.green),
                  const Divider(color: Colors.white12, height: 1),
                  _buildLogItem('ACT-002', 'LTV Fleet Dispatch', 'RECOVERED', Colors.amber),
                  const Divider(color: Colors.white12, height: 1),
                  _buildLogItem('ACT-003', 'Secure emergency units', 'SUCCESS', Colors.green),
                  const Divider(color: Colors.white12, height: 1),
                  _buildLogItem('ACT-004', 'Update customer ETAs', 'SUCCESS', Colors.green),
                  const Divider(color: Colors.white12, height: 1),
                  _buildLogItem('ACT-005', 'Activate Cross-docking', 'SUCCESS', Colors.green),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Summary Metrics Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  _buildSummaryRow('Total Cost', 'PKR 420,150', Colors.white),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Budget Status', 'WITHIN BUDGET', Colors.green),
                  const SizedBox(height: 12),
                  _buildSummaryRow('Monitoring Status', 'ACTIVE', Theme.of(context).colorScheme.secondary),
                ],
              ),
            ),
            const SizedBox(height: 32),
            
            // Return Button
            OutlinedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                side: const BorderSide(color: Colors.white54),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('New Analysis'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRiskCard(String label, String riskLevel, Color color, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white70),
          ),
          const SizedBox(height: 8),
          Text(
            riskLevel,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Stockout Risk',
            style: TextStyle(fontSize: 12, color: Colors.white54),
          ),
        ],
      ),
    );
  }

  Widget _buildLogItem(String id, String task, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          Text(
            id,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white70,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              task,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: statusColor.withOpacity(0.5)),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, Color valueColor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
