import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/laucher/laucher.dart';
import '../../blocs/anime/anime_bloc.dart';
import '../../theme/app_theme.dart';
import 'widgets/widgets.dart';

class AnimePage extends StatefulWidget {
  @override
  _AnimePageState createState() => _AnimePageState();
}

class _AnimePageState extends State<AnimePage> {
  @override
  void initState() {
    context.read<AnimeBloc>().add(AnimeFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AnimeBloc>();
    final state = bloc.state;
    Widget child;
    if (state is AnimeSuccessState) {
      child = BodySuccess(state: state);
    } else if (state is AnimeLoadingState) {
      child = const BodyLoading();
    } else if (state is AnimeFailureState) {
      child = const BodyFailure();
    } else {
      child = const BodyInitial();
    }
    return Scaffold(
      backgroundColor: AppTheme.colors.background,
      appBar: CustomAppBarWidget(title: 'Anime'),
      body: child,
    );
  }
}

class BodyInitial extends StatelessWidget {
  const BodyInitial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class BodyFailure extends StatelessWidget {
  final String? message;

  const BodyFailure({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(message ?? 'Um erro inesperado!', style: AppTheme.textStyles.messageFailure));
  }
}

class BodyLoading extends StatelessWidget {
  const BodyLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(child: CustomCircularIndicatorWidget());
  }
}

class BodySuccess extends StatefulWidget {
  final AnimeSuccessState state;

  const BodySuccess({Key? key, required this.state}) : super(key: key);

  @override
  _BodySuccessState createState() => _BodySuccessState();
}

class _BodySuccessState extends State<BodySuccess> {
  late ScrollController _scrollController;

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  AnimeSuccessState get state => widget.state;

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
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final anime = state.animes[index];
          return Column(
            children: [
              ListTileAnimeWidget(
                title: anime.title.trimLeft(),
                onTap: Launcher.navigatetoLink(link: anime.link),
              ),
              Visibility(
                visible: !state.hasReachedMax && index == state.animes.length - 1,
                child: Column(
                  children:  [
                    const SizedBox(height: 8),
                    CustomCircularIndicatorWidget(),
                  ],
                ),
              )
            ],
          );
        },
        separatorBuilder: (__, _) => const SizedBox(height: 8),
        itemCount: state.animes.length);
  }
}
