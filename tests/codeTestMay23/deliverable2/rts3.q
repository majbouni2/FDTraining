/RTS

\p 7010

h".u.sub[`;`]" 


if[not "w"=first string .z.o;system "sleep 1"];

.u.x:.z.x,(count .z.x)_(":7000";":7012");
/add log messages

f:{"," vs x} each feed
t1:([]batchId:1_f[;0];executionTime:1_f[;1];accountRef:1_f[;2];uniqueId:1_f[;3];marketName:1_f[;4];instrumentType:1_f[;5])
t2:([]clientName:1_f[;6];modifiedData:1_f[;7];billingCurrency:1_f[;8];accountGroup:1_f[;9])
t3:([]RA:1_f[;10];R:1_f[;11];P:1_f[;12];Y:1_f[;13];NP:1_f[;14])
feed:t1 uj t2 uj t3

update "E"$RA,"E"$R,"E"$P,"E"$Y,"E"$NP from `feed
feed:update pricer:(((R-RA)*NP*P)%(1*Y))*(1%(1+R*(P%Y))) from feed

save `feed