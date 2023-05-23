/RTS

\p 6010

h".u.sub[`;`]" 

if[not "w"=first string .z.o;system "sleep 1"];

.u.x:.z.x,(count .z.x)_(":6000";":6012");

djsonFunc:{.j.k x}
feed:![feed; (); 0b; ] (cols feed) ! {$[x in cols feed; (each; djsonFunc; x); x]} each cols feed
update "J"$RA,"J"$R,"J"$P,"J"$Y,"J"$NP from `feed
feed:update pricer:(((R-RA)*NP*P)%(1*Y))*(1%(1+R*(P%Y))) from feed