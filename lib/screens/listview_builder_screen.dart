import 'package:flutter/material.dart';
import 'package:flutter_components/theme/app_theme.dart';

class ListViewBuilderScreen extends StatefulWidget {
   
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {

  final List<int> imagesLoading = [1,2,3,4,5,6,7,8,9,10];
  final List<int> loadImages = [1,2,3,4,5,6,7,8,9,10];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      if ( (scrollController.position.pixels + 300) >= scrollController.position.maxScrollExtent) {
        getImages();
      }
      print(scrollController.position.pixels);
      print(scrollController.position.maxScrollExtent);
    });
  }

  Future getImages() async{

    if (isLoading) return;

    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    addImagesScroll();
    isLoading = false;
    setState(() {});

    if ( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent ) return;

    scrollController.animateTo(
      scrollController.position.pixels + 150,
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  void addImagesScroll(){
    final lastId = imagesLoading.last;
    imagesLoading.addAll(
      loadImages.map((e) => lastId + e)
    );
    setState(() {});
  }

  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 2));
    final lastId = imagesLoading.length;
    imagesLoading.clear();
    imagesLoading.add(lastId + 1);
    addImagesScroll();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [

            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: onRefresh,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imagesLoading.length,
                itemBuilder: (BuildContext context, index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder:  const AssetImage('assets/jar-loading.gif'), 
                    image: NetworkImage('https://picsum.photos/500/300?image=${imagesLoading[index]}')
                  );
                }
              ),
            ),

            if (isLoading)
              Positioned(
                bottom: 40,
                left: size.width * 0.5 - 30,
                child: const _LoadingIcon()
              )
          ],
        ),
      )
    );
  }
}

class _LoadingIcon extends StatelessWidget {
  const _LoadingIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        shape: BoxShape.circle
      ),
      height: 60,
      width: 60,
      child: const CircularProgressIndicator(color: AppTheme.primary,),
    );
  }
}