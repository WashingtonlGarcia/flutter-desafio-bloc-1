import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/laucher/laucher.dart';
import '../../../domain/usecases/get_anime_posts.dart';
import '../../blocs/anime/anime_bloc.dart';
import 'widgets/widgets.dart';

class AnimePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnimeBloc(usecase: context.read<GetAnimePost>()),
      child: _AnimePage(),
    );
  }
}

class _AnimePage extends StatefulWidget {
  @override
  __AnimePageState createState() => __AnimePageState();
}

class __AnimePageState extends State<_AnimePage> {
  late ScrollController _scrollController;

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_isBottom) context.read<AnimeBloc>().add(AnimeFetchEvent());
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Anime'),
      ),
      body: BlocBuilder<AnimeBloc, AnimeState>(
        bloc: context.read<AnimeBloc>()..add(AnimeFetchEvent()),
        builder: (context, state) {
          if (state is AnimeSuccessState) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final anime = state.animes[index];
                  return Column(
                    children: [
                      ListTileAnimeWidget(anime: anime, onTap: Launcher.navigatetoLink(link: anime.link)),
                      if (!state.hasReachedMax && index == state.animes.length - 1)
                        ...[const SizedBox(height: 8), const CircularProgressIndicator()].toList()
                    ],
                  );
                },
                separatorBuilder: (__, _) => const SizedBox(height: 8),
                itemCount: state.animes.length);
          }
          if (state is AnimeLoadingState) return const Center(child: CircularProgressIndicator());
          if (state is AnimeFailureState) return const Center(child: Text('Failure'));
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
