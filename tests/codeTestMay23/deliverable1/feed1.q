/feed one data
\p 5000
h:hopen 4000;

dataCount:360

batchId1:{"batch0",string x} each til 10
batchId2:{"batch",string x} each 10 + til (dataCount-10)
batchId:batchId1,batchId2;

executionTime: dataCount#(enlist .z.t)

accountRef1:{r:count last x;(9-r)#"0"} each til dataCount
accountRef2:{string last x} each til dataCount
accountRef:accountRef1,'accountRef2

uniqueId:{((8?.Q.A),string x)} each til dataCount

marketName:dataCount?enlist each`NA`EMEA`APAC`LAD

instrumentType:dataCount# enlist "EUR"
\P 2
RA:dataCount?3.5
R:dataCount#4
P:dataCount#(til 1+360)
Y:dataCount#enlist 360
feed:([]batchId;executionTime;accountRef;uniqueId;marketName;instrumentType;RA;R;P;Y)

update NP:{$[x like "NA";string 200;x like "EMEA";string 300;100]} each `marketName from `feed
/update NP:string `feedSchema[`NP] from `feedSchema
/update pricer:(((R-RA)*NP*P)%(1*Y))*(1%(1+R*(P%Y))) from `feed

/converting all records to string
strFields:exec c from (meta feed) where not t in "C"
stringFunc:{string x}
feed:![feed; (); 0b; ] (cols feed) ! {$[x in strFields; (each; stringFunc; x); x]} each cols feed
feed
