import 'package:flutter/material.dart';
import 'package:technical_assignment/features/storeShop/domain/entities/store.dart';
import 'package:technical_assignment/features/storeShop/presentation/widgets/shadows.dart';

class StoreCard extends StatelessWidget {
  const StoreCard({super.key, required this.store});

  final StoreEntity store;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.white, Colors.white, Color(0xFFFFD369)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        boxShadow: boxShadow,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 80,
              height: 80,

              decoration: BoxDecoration(
                boxShadow: boxShadow,
                borderRadius: BorderRadius.circular(
                  11,
                ),
                border: Border.all(
                  color: Colors.white, 
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(store.coverPhoto ?? '', fit: BoxFit.cover),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          store.name?.en ?? '',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: store.availability == true
                              ? Colors.green
                              : Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          store.availability == true ? "OPEN" : "CLOSED",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 4),

                  Text(
                    store.description?.en ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.timer, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        store.estimatedDeliveryTime ?? '',
                        style: const TextStyle(fontSize: 12),
                      ),

                      const SizedBox(width: 12),

                      const Icon(Icons.shopping_cart, size: 14),
                      const SizedBox(width: 4),
                      Text(
                        "${store.minimumOrder?.amount ?? 0} ${store.minimumOrder?.currency ?? ''}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          "${store.address?.country ?? ''}, ${store.address?.state ?? ''}, ${store.address?.city ?? ''}, ${store.address?.street ?? ''}, ${store.address?.otherDetails ?? ''}",
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
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
