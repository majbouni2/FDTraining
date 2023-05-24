/realtime average price for 5 min intervals for instruments per accountGroup in US Dollars


\p 8010

h".u.sub[`;`]" 

if[not "w"=first string .z.o;system "sleep 1"];
/add log messages
.u.x:.z.x,(count .z.x)_(":7000";":7012");

select avg pricer by accountGroup from feed