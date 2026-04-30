// lib/data/movies_data.dart

import '../models/movie.dart';

final List<Movie> moviesData = [
  const Movie(
    id: 1,
    title: 'Duna',
    category: 'Ficção Científica',
    imageUrl: 'https://image.tmdb.org/t/p/w500/d5NXSklXo0qyIYkgV94XAgMIckC.jpg',
    description:
        'Em um futuro distante, o jovem Paul Atreides e sua família aceitam o controle do planeta deserto Arrakis, único fornecedor da substância mais valiosa do universo. Mas quando sua família se torna alvo de uma conspiração devastadora, Paul enfrenta um destino maior do que poderia ter imaginado.',
    releaseYear: 2021,
    rating: 8.0,
    director: 'Denis Villeneuve',
    cast: ['Timothée Chalamet', 'Zendaya', 'Oscar Isaac', 'Rebecca Ferguson'],
    durationMinutes: 155,
  ),
  const Movie(
    id: 2,
    title: 'Oppenheimer',
    category: 'Drama Histórico',
    imageUrl: 'https://image.tmdb.org/t/p/w500/ptpr0kGAckfQkJeJIt8st5dglvd.jpg',
    description:
        'A história do físico J. Robert Oppenheimer e seu papel crucial no Projeto Manhattan, que levou ao desenvolvimento das primeiras armas nucleares durante a Segunda Guerra Mundial. Um retrato íntimo de um homem cuja criação mudaria o mundo para sempre.',
    releaseYear: 2023,
    rating: 8.9,
    director: 'Christopher Nolan',
    cast: ['Cillian Murphy', 'Emily Blunt', 'Matt Damon', 'Robert Downey Jr.'],
    durationMinutes: 180,
  ),
  const Movie(
    id: 3,
    title: 'Tudo em Todo Lugar ao Mesmo Tempo',
    category: 'Aventura / Comédia',
    imageUrl: 'https://image.tmdb.org/t/p/w500/u68AjlvlutfEIcpmbYpKcdi09ut.jpg',
    description:
        'Uma lavanderia chinesa sobrecarregada é varrida por uma aventura absurda, na qual só ela pode salvar a existência ao explorar outros universos e se conectar com as vidas que poderia ter levado.',
    releaseYear: 2022,
    rating: 7.8,
    director: 'Daniel Kwan, Daniel Scheinert',
    cast: ['Michelle Yeoh', 'Ke Huy Quan', 'Jamie Lee Curtis', 'Stephanie Hsu'],
    durationMinutes: 139,
  ),
  const Movie(
    id: 4,
    title: 'O Irlandês',
    category: 'Crime',
    imageUrl: 'https://image.tmdb.org/t/p/w500/mbm8k3GFhXS0ROd9AD1gqYbIFbM.jpg',
    description:
        'Frank Sheeran, um veterano de guerra e transportador que trabalha para um advogado do crime, relembra sua vida inteira como assassino de aluguel e seu relacionamento com o famoso líder sindical Jimmy Hoffa.',
    releaseYear: 2019,
    rating: 7.8,
    director: 'Martin Scorsese',
    cast: ['Robert De Niro', 'Al Pacino', 'Joe Pesci', 'Harvey Keitel'],
    durationMinutes: 209,
  ),
  const Movie(
    id: 5,
    title: 'Parasita',
    category: 'Thriller',
   imageUrl: 'https://image.tmdb.org/t/p/w500/7IiTTgloJzvGI1TAYymCfbfl3vT.jpg',
    description:
        'A família Kim vive em um porão miserável. Quando o filho Ki-woo consegue emprego como tutor de inglês na rica família Park, toda a sua família começa a se infiltrar sorrateiramente na vida dos ricos patrões.',
    releaseYear: 2019,
    rating: 8.5,
    director: 'Bong Joon-ho',
    cast: ['Song Kang-ho', 'Lee Sun-kyun', 'Cho Yeo-jeong', 'Choi Woo-shik'],
    durationMinutes: 132,
  ),
  const Movie(
    id: 6,
    title: 'Barbie',
    category: 'Comédia / Fantasia',
imageUrl: 'https://image.tmdb.org/t/p/w500/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg',
    description:
        'Barbie vive na Barbielândia perfeita, mas após uma crise existencial, ela e Ken embarcam numa jornada ao mundo real, onde ela descobre que ser humano é muito mais complexo do que parecia.',
    releaseYear: 2023,
    rating: 6.9,
    director: 'Greta Gerwig',
    cast: ['Margot Robbie', 'Ryan Gosling', 'America Ferrera', 'Kate McKinnon'],
    durationMinutes: 114,
  ),
  const Movie(
    id: 7,
    title: 'Poor Things',
    category: 'Drama / Fantasia',
 imageUrl: 'https://image.tmdb.org/t/p/w500/kCGlIMHnOm8JPXq3rXM6c5wMxcT.jpg',
    description:
        'Bella Baxter é trazida de volta à vida pelo excêntrico e progressista cientista Dr. Godwin Baxter. Sob a proteção de Baxter, Bella anseia por aprender. Seduzida pelo advogado Duncan Wedderburn, ela foge em uma aventura pelos continentes.',
    releaseYear: 2023,
    rating: 8.0,
    director: 'Yorgos Lanthimos',
    cast: ['Emma Stone', 'Mark Ruffalo', 'Willem Dafoe', 'Ramy Youssef'],
    durationMinutes: 141,
  ),
  const Movie(
    id: 8,
    title: 'Missão: Impossível - Acerto de Contas',
    category: 'Ação / Espionagem',
  imageUrl: 'https://image.tmdb.org/t/p/w500/NNxYkU70HPurnNCSiCjYAmacwm.jpg',
    description:
        'Ethan Hunt e sua equipe do IMF embarcam em sua missão mais perigosa até hoje: rastrear uma assustadora nova arma antes que ela caia em mãos erradas. Com o controle do futuro e o destino do mundo em jogo, e forças sombrias do passado de Ethan fechando o cerco.',
    releaseYear: 2023,
    rating: 7.7,
    director: 'Christopher McQuarrie',
    cast: ['Tom Cruise', 'Hayley Atwell', 'Ving Rhames', 'Simon Pegg'],
    durationMinutes: 163,
  ),
];
