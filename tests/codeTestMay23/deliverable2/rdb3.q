\p 7012
upd:insert;
h: hopen 6000
h ".u.sub[`;`]"

/if[not "w"=first string .z.o;system "sleep 1"];


/ get the ticker plant and history ports
/.u.x:.z.x,(count .z.x)_(":7000";":7012");

/ end of day: save, clear, hdb reload
/.u.end:{t:tables`.;t@:where `g=attr each t@\:`sym;.Q.hdpf[`$":",.u.x 1;`:.;x;`sym];@[;`sym;`g#] each t;};

/ init schema and sync up from log file;cd to hdb(so client save can run)
/.u.rep:{(.[;();:;].)each x;if[null first y;:()];-11!y;system "cd ",1_-10_string first reverse y};
/ HARDCODE \cd if other than logdir/db

/ connect to ticker plant for (schema;(logcount;log))
/.u.rep .(hopen `$":",.u.x 0)"(.u.sub[`;`];`.u `i`L)";