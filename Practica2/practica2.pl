% Hechos
% Definimos las instancias y subclases
instancia_de(super_mario, plataforma).
instancia_de(mario_kart, carreras).
instancia_de(zelda, aventura).
instancia_de(pokemon, rpg).
instancia_de(call_of_duty, fps).
instancia_de(fortnite, battle_royale).
instancia_de(overwatch, fps).
instancia_de(minecraft, sandbox).
instancia_de(the_sims, simulacion).
instancia_de(civilization, estrategia).
instancia_de(plataforma, videojuegos).
instancia_de(carreras, videojuegos).
instancia_de(aventura, videojuegos).
instancia_de(rpg, videojuegos).
instancia_de(fps, videojuegos).
instancia_de(battle_royale, videojuegos).
instancia_de(sandbox, videojuegos).
instancia_de(simulacion, videojuegos).
instancia_de(estrategia, videojuegos).

% Definimos las propiedades
tiene_propiedad(super_mario, plataforma, nintendo).
tiene_propiedad(super_mario, lanzado, 1985).
tiene_propiedad(mario_kart, plataforma, nintendo).
tiene_propiedad(mario_kart, lanzado, 1992).
tiene_propiedad(zelda, plataforma, nintendo).
tiene_propiedad(zelda, lanzado, 1986).
tiene_propiedad(pokemon, plataforma, nintendo).
tiene_propiedad(pokemon, lanzado, 1996).
tiene_propiedad(call_of_duty, plataforma, multiplataforma).
tiene_propiedad(call_of_duty, lanzado, 2003).
tiene_propiedad(fortnite, plataforma, multiplataforma).
tiene_propiedad(fortnite, lanzado, 2017).
tiene_propiedad(overwatch, plataforma, multiplataforma).
tiene_propiedad(overwatch, lanzado, 2016).
tiene_propiedad(minecraft, plataforma, multiplataforma).
tiene_propiedad(minecraft, lanzado, 2011).
tiene_propiedad(the_sims, plataforma, multiplataforma).
tiene_propiedad(the_sims, lanzado, 2000).
tiene_propiedad(civilization, plataforma, multiplataforma).
tiene_propiedad(civilization, lanzado, 1991).

% Regla para saber si un objeto es una instancia de una clase
es_instancia_de(Instancia, Clase) :-
    instancia_de(Instancia, Clase).
es_instancia_de(Instancia, Clase) :-
    instancia_de(Instancia, SubClase),
    es_instancia_de(SubClase, Clase).

% Regla para conocer todas las propiedades que posee una instancia
propiedades_de(Instancia, Propiedad, Valor) :-
    tiene_propiedad(Instancia, Propiedad, Valor).

% Regla para saber si una clase es subclase de otra
es_subclase_de(SubClase, Clase) :-
    instancia_de(SubClase, Clase).
es_subclase_de(SubClase, Clase) :-
    instancia_de(SubClase, Intermedia),
    es_subclase_de(Intermedia, Clase).

% Consultas de ejemplo
% ¿Super Mario es una instancia de Videojuegos?
% es_instancia_de(super_mario, videojuegos).

% ¿En qué plataforma fue lanzado Super Mario?
% propiedades_de(super_mario, plataforma, Valor).

% ¿Plataforma es una subclase de Videojuegos?
% es_subclase_de(plataforma, videojuegos).
