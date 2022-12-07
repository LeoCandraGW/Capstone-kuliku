import 'package:capstone_kuliku/common/utils.dart';
import 'package:capstone_kuliku/presentation/bloc/kuli_bloc.dart';
import 'package:capstone_kuliku/presentation/widgets/kuli_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteKuliPage extends StatefulWidget {
  static const routeName = '/favorite-kuli';
  const FavoriteKuliPage({super.key});

  @override
  State<FavoriteKuliPage> createState() => FavoriteKuliPageState();
}

class FavoriteKuliPageState extends State<FavoriteKuliPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => context.read<KuliFavoriteBloc>().add(FetchFavoriteKuli()));
  }

  @override
  void didChangeDepedencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  void didPopNext() {
    context.read<KuliFavoriteBloc>().add(FetchFavoriteKuli());
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
                  'Favorit Kuli',
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
        body: BlocBuilder<KuliFavoriteBloc, KuliBlocState>(
          builder: (context, state) {
            if (state is KuliLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is FavoriteKuliHasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final kuli = state.favoriteKuli[index];
                  return KuliCard(kuli);
                },
                itemCount: state.favoriteKuli.length,
              );
            } else if (state is KuliHasError) {
              return Center(
                key: Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return Center(child: Text('No Favorite Kuli'));
            }
          },
        ));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
