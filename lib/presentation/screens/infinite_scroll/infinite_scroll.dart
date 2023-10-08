import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const name = 'scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesId = [1, 2, 3, 4, 5];

  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 400) >=
          scrollController.position.maxScrollExtent) {
        loadNextImages();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  void addNewImages() {
    final lastId = imagesId.last;

    imagesId.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future loadNextImages() async {
    //Solo queremos cargar imagenes si hemos llegado al final
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 1));

    //Añadimos nuevas imagenes y seteamos el loading a false
    addNewImages();
    isLoading = false;

    //Comprobamos si el widget no esta montado
    if (!isMounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  Future<void> onRefresh() async {
    isLoading = true; //Si refrescamos esta loading
    setState(() {});

    await Future.delayed(const Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false; //Si se ha montado el widget ya no está cargando
    final lastId = imagesId.last;
    imagesId.clear();
    imagesId.add(lastId + 1);
    addNewImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if ((scrollController.position.pixels + 150) >=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 100,
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesId.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesId[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_rounded),
              )
            : FadeIn(
                duration: const Duration(milliseconds: 700),
                child: const Icon(Icons.arrow_back_ios_new_outlined)),
      ),
    );
  }
}
