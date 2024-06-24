%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calculo de parametros de Filtro Pasa Bajo.

clear all; close all; clc
pkg load symbolic
syms wn psita real
syms kd kv N t1 t2 real

% Puede que tengan que ser en MAYUS (t1 y t2)

kd= 10
kv= 10
N= 10
t1= 10
t2= 10

% Calculo la frecuencia natural
wn= sqrt((kd*kv)/(N*(t1+t2)))

% Factor de amortiguamiento
%psita= (wn/2)*(t2+(N/(kd*kv)))
t2= ((2*psita)/(wn))-(N/(kd*kv))

