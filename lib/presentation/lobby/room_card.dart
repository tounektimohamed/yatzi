import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoomCard extends StatelessWidget {
  final String roomCode;
  final int playerCount;
  final int maxPlayers;
  final bool isHost;
  final VoidCallback? onShare;

  const RoomCard({
    super.key,
    required this.roomCode,
    required this.playerCount,
    required this.maxPlayers,
    this.isHost = false,
    this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.amber.shade400.withValues(alpha: 0.15),
            Colors.amber.shade400.withValues(alpha: 0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Colors.amber.shade400.withValues(alpha: 0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            'ROOM CODE',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
              letterSpacing: 3,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            roomCode,
            style: GoogleFonts.bebasNeue(
              fontSize: 42,
              color: Colors.amber.shade400,
              letterSpacing: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.people, color: Colors.white54, size: 18),
              const SizedBox(width: 6),
              Text(
                '$playerCount / $maxPlayers',
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
