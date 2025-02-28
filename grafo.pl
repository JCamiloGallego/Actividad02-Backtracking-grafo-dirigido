% Definir las conexiones del grafo con su costo
conexion(vancouver, edmonton, 16).
conexion(vancouver, calgary, 13).
conexion(edmonton, saskatoon, 12).
conexion(saskatoon, winnipeg, 20).
conexion(saskatoon, regina, 7).
conexion(calgary, regina, 14).
conexion(regina, winnipeg, 4).
conexion(regina, saskatoon, 7).

% Regla para verificar si hay una conexión directa entre dos nodos
conexion_directa(A, B) :- conexion(A, B, _).

% Regla para verificar si hay una conexión (directa o indirecta) entre dos nodos
conexion_indirecta(A, B) :- conexion(A, B, _).
conexion_indirecta(A, B) :- conexion(A, C, _), conexion_indirecta(C, B).

% Regla para saber las conexiones de un nodo con sus respectivos costos
% se usa el ya conocido functor y a la variable anónima se le pasa costo como nombre: 
% conexion(regina, X, Costo)

%regla para saber si un nodo tiene aristas

tieneAristas(A) :- conexion(A,_,_).

%regla para determinar cual es el costo de un nodo X a un nodo Z pasando por Y

costoDe_viaje(X,Y,Z,Costo) :- conexion(X,Z, Cost1), conexion(Z, Y, Cost2),
    Costo is Cost1 + Cost2.

