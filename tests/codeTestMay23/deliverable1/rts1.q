/RTS

\p 5010

h".u.sub[`;`]" 

if[not "w"=first string .z.o;system "sleep 1"];

.u.x:.z.x,(count .z.x)_(":5000";":5012");

update "J"$RA,"J"$R,"J"$P,"J"$Y,"J"$NP from `feed
feed:update pricer:(((R-RA)*NP*P)%(1*Y))*(1%(1+R*(P%Y))) from feed