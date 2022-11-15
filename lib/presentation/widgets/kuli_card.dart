import 'package:capstone_kuliku/presentation/provider/list_kuli.dart';
import 'package:flutter/material.dart';

class KuliCard extends StatelessWidget {
  const KuliCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
        final ListKuli kuli = listKuliku[index];
        return InkWell(
          onTap: (() {
            
          }),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Card(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 16 + 80 + 16,
                  bottom: 8,
                  right: 8,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        kuli.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                       const SizedBox(height: 16),
                      Text(
                        kuli.alamat,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        kuli.skill,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  bottom: 16,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    kuli.imageAsset,
                    width: 70,
                  ),
                ),
              ),
            ],

          ),
        );
      },
      itemCount: listKuliku.length,
      );
  }
}