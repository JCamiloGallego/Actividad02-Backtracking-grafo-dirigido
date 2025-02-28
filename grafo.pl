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
