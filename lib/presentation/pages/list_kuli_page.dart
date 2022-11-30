import 'package:capstone_kuliku/domain/usecases/get_kuli_list.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/widgets/kuli_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListKuliPage extends StatefulWidget {
  static const routeName = '/listkulipage';
  const ListKuliPage({super.key});

  @override
  State<ListKuliPage> createState() => _ListKuliPageState();
}


class _ListKuliPageState extends State<ListKuliPage> {

  @override
  void initState(){
    super.initState();
    Future.microtask(() => context.read<GetKuliListBloc>().add(FetchKuliList()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Center(
              child: Text(
                'Kuliku',
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {},
            ),
          ],
        ),
        backgroundColor: const Color(0xff002f48),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<GetKuliListBloc, KuliBlocState>(
              builder: (context, state) {
            if (state is KuliLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is KuliHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final kuli = state.kuli[index];
                  return KuliCard(kuli);
                },
                itemCount: state.kuli.length,
              );
            } else if (state is KuliHasError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return const Text('No Data');
            }
          })),
    );
  }
}
