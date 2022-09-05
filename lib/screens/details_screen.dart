import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

//El key es una manera de identificar el widget en el arbol de widgets
class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // TODO: Cambiar luego por una instancia de movie
    // Los dos simbolos de ?? declaran que si todo lo anterior es nulo se le mandara otra cosa
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';


    return Scaffold(
      body: CustomScrollView(
        //Los slivers son ciertos widgets que tienen cierto funcionamiento programado cuando se hace scroll en el contenido del padre
        slivers: [
          _CustomAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitle(),
                _Overview(),
                _Overview(),
                _Overview(),
                _Overview(),
                _Overview(),
                CastingCards(),

                
                ]
            ))
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  //const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          child: Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
          image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'), 
              image: NetworkImage('https://via.placeholder.com/200x300'),
              height: 150,
              ),
          ),

          SizedBox(width: 20,),

          Column(
            //Para que quede alineado al inicio en este caso a la izquierda
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
              Text('movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 1,),
           
              Row(
                children: [
                  Icon(Icons.star, size: 15, color: Colors.grey,),
                  SizedBox(width: 5,),
                  Text('movie.voteAverage', style: textTheme.caption,),
                ],
              )
           ],
          )
        ],
      ),
    );
  }
}

//El overview es un simple contenedor en el cual va a tener un texto
class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text('Velit pariatur minim aliqua cupidatat minim exercitation adipisicing esse eu in magna do dolor ullamco. Officia anim Lorem est sint dolor dolor do elit nostrud. Dolor veniam excepteur eiusmod veniam non magna adipisicing commodo ullamco officia anim culpa ex excepteur. Eiusmod eu non ipsum minim sunt.',
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1),
    );
  }
}