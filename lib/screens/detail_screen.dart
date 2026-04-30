// Recebe um objeto Movie completo via construtor (passagem de parâmetros).

import 'package:flutter/material.dart';
import '../models/movie.dart';

class DetailScreen extends StatefulWidget {
  // Parâmetro obrigatório: recebe o objeto Movie completo da tela anterior
  final Movie movie;

  const DetailScreen({super.key, required this.movie});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  // --- Estado em memória (sem banco de dados) ---
  bool _isLiked = false;

  // Animação do botão de curtir
  late AnimationController _heartController;
  late Animation<double> _heartScale;

  @override
  void initState() {
    super.initState();
    _heartController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _heartScale = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.4), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.4, end: 1.0), weight: 50),
    ]).animate(CurvedAnimation(
      parent: _heartController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _heartController.dispose();
    super.dispose();
  }

  // Alterna o estado de curtido e dispara a animação
  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
    _heartController.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final movie = widget.movie;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0A0A),
      body: CustomScrollView(
        slivers: [
          // --- AppBar com imagem de fundo e botão Voltar nativo ---
          SliverAppBar(
            expandedHeight: 320,
            pinned: true,
            backgroundColor: const Color(0xFF141414),
            // Botão de voltar nativo (AppBar)
            leading: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded,
                    color: Colors.white, size: 18),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            // Botão de curtir na AppBar
            actions: [
              Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  shape: BoxShape.circle,
                ),
                child: ScaleTransition(
                  scale: _heartScale,
                  child: IconButton(
                    icon: Icon(
                      _isLiked ? Icons.favorite_rounded : Icons.favorite_border_rounded,
                      color: _isLiked ? const Color(0xFFE50914) : Colors.white,
                      size: 22,
                    ),
                    onPressed: _toggleLike,
                    tooltip: _isLiked ? 'Remover dos favoritos' : 'Adicionar aos favoritos',
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagem de fundo
                  Image.network(
                    movie.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFF1A1A1A),
                      child: const Icon(Icons.movie_outlined,
                          color: Color(0xFF333333), size: 80),
                    ),
                  ),
                  // Gradiente para legibilidade
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.3),
                          const Color(0xFF0A0A0A),
                        ],
                        stops: const [0.4, 0.75, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // --- Conteúdo da tela de detalhes ---
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge da categoria
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE50914).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: const Color(0xFFE50914).withOpacity(0.5),
                      ),
                    ),
                    child: Text(
                      movie.category.toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFFE50914),
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Título do filme
                  Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      height: 1.2,
                      letterSpacing: 0.3,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Metadados em linha
                  Wrap(
                    spacing: 16,
                    runSpacing: 8,
                    children: [
                      _MetaChip(
                        icon: Icons.star_rounded,
                        label: '${movie.rating}/10',
                        iconColor: const Color(0xFFFFC107),
                      ),
                      _MetaChip(
                        icon: Icons.calendar_today_outlined,
                        label: '${movie.releaseYear}',
                      ),
                      _MetaChip(
                        icon: Icons.schedule_outlined,
                        label: '${movie.durationMinutes} min',
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // --- Botão de Curtir (Desafio - StatefulWidget) ---
                  SizedBox(
                    width: double.infinity,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      decoration: BoxDecoration(
                        color: _isLiked
                            ? const Color(0xFFE50914)
                            : const Color(0xFF1E1E1E),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _isLiked
                              ? const Color(0xFFE50914)
                              : const Color(0xFF333333),
                        ),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: _toggleLike,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ScaleTransition(
                                  scale: _heartScale,
                                  child: Icon(
                                    _isLiked
                                        ? Icons.favorite_rounded
                                        : Icons.favorite_border_rounded,
                                    color: _isLiked
                                        ? Colors.white
                                        : const Color(0xFFE50914),
                                    size: 22,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  _isLiked
                                      ? 'Adicionado aos Favoritos!'
                                      : 'Curtir este Filme',
                                  style: TextStyle(
                                    color: _isLiked
                                        ? Colors.white
                                        : const Color(0xFFCCCCCC),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Divisor
                  const Divider(color: Color(0xFF222222)),

                  const SizedBox(height: 20),

                  // Sinopse
                  const Text(
                    'Sinopse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    movie.description,
                    style: const TextStyle(
                      color: Color(0xFFAAAAAA),
                      fontSize: 14,
                      height: 1.7,
                    ),
                  ),

                  const SizedBox(height: 28),

                  // Diretor
                  _InfoRow(
                    label: 'Direção',
                    value: movie.director,
                  ),

                  const SizedBox(height: 20),

                  // Elenco
                  const Text(
                    'Elenco Principal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: movie.cast
                        .map(
                          (actor) => Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF1E1E1E),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0xFF333333)),
                            ),
                            child: Text(
                              actor,
                              style: const TextStyle(
                                color: Color(0xFFCCCCCC),
                                fontSize: 13,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),

                  const SizedBox(height: 32),

                  // Botão Voltar alternativo (além do AppBar)
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back_rounded, size: 18),
                      label: const Text('Voltar para a lista'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: const Color(0xFF888888),
                        side: const BorderSide(color: Color(0xFF333333)),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget auxiliar para metadados (ícone + texto)
class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  const _MetaChip({
    required this.icon,
    required this.label,
    this.iconColor = const Color(0xFF888888),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, color: iconColor, size: 15),
        const SizedBox(width: 5),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF999999),
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

// Widget auxiliar para linha de informação (label + valor)
class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                color: Color(0xFF666666),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Color(0xFFCCCCCC),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
