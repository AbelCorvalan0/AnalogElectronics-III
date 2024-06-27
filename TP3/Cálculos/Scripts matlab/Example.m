%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Calculo de ejemplo

%clear all; close all; clc
%pkg load symbolic
%syms wn psita real
%syms t kd kv N t1 t2 real

%%%% Frecuencias

fmax= 1950e6
fmin= 1875e6
fr= 200e3

% Puede que tengan que ser en MAYUS (t1 y t2)
fmax_vco= 2200e6
fmin_vco= 1800e6
vmax_vco= 18
vmin_vco= 0.5

kd= 0.2865   %V/rad
kv= (fmax_vco-fmin_vco)*(2*pi)/(vmax_vco-vmin_vco) %rad/V
%N= 20
N= 9375

t= 1e-3 %1ms
psita= 0.7

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

%%%%%% Cálculo de componentes del filtro.
C= 100e-9

R1= t1/C
R2= t2/C


%%%%%% Función de transferencia del filtro.
s= tf('s')
FT_filtro= (1+s*t2)/(1+s*(t1+t2))

param= zpk(FT_filtro)

bode(FT_filtro)
grid on
title('Función transferencia del filtro')

%pzmap(FT_filtro)
%p1= pole(FT_filtro)/(2*pi)
%s=p1
%FT_filtro
%step(FT_filtro)

%%%%%%% Cálculo de división D

Dmax= fmax/fr
Dmin= fmin/fr

%%%%%%% Función transferencia del PLL

FT_VCO= kv/s
FT_detector= kd
FT_div= 1/Dmax

G_directa= FT_detector*FT_filtro*FT_VCO
zpk(G_directa)

% Funcion transferencia del PLL.
FT_PLL= G_directa/(1+G_directa*FT_div)
%FT_PLL= G_directa/(1+G_directa*FT_div)

step(FT_PLL, 6e-3)
%bode(FT_PLL)
minreal(FT_PLL)