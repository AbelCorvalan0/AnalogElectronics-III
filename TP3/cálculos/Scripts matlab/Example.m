%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calculo de ejemplo

clear all; close all; clc
pkg load symbolic
syms wn psita real
syms t kd kv N t1 t2 real

% Puede que tengan que ser en MAYUS (t1 y t2)

kd= 10
kv= 10
N= 10
t1= 10
t2= 10
t= 10e-3 %10ms

% Del gráfico del video PLL 2-3
% https://drive.google.com/file/d/1EBDC_qdF5e1PHstlxqqsMATuQzLPqohK/view
% se obtiene wn*t= 4.5 rad, se selecciona psita= 0.5

% Se calcula la frecuencia natural
wn_t= 4.5 %rad

wn= (wn_t)/t % [rad/seg]

% Se despeja de la fórmula de psita
t2= (2*psita/wn)-(N/(kd*kv))

% Se despeja de wn
t1= (kd*kv/(N*(wn)^2))-t2