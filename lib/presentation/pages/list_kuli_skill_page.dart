import 'package:capstone_kuliku/presentation/bloc/kuli_bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/widgets/kuli_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListKuliSkillPage extends StatefulWidget {
  static const routeName = '/listkuliskillpage';
  final String skill;
  const ListKuliSkillPage({super.key, required this.skill});

  @override
  State<ListKuliSkillPage> createState() => _ListKuliSkillPageState();
}

class _ListKuliSkillPageState extends State<ListKuliSkillPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<GetKuliSkillListBloc>().add(FetchKuliSkillList(widget.skill)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFdefbff),
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
          child: BlocBuilder<GetKuliSkillListBloc, KuliBlocState>(
              builder: (context, state) {
            if (state is KuliLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is KuliSkillHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final kuli = state.kuliskill[index];
                  return KuliCard(kuli);
                },
                itemCount: state.kuliskill.length,
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
