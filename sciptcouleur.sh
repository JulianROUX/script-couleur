curl http://www.vendian.org/mncharity/dir3/blackbody/UnstableURLs/bbr_color.html>couleurs
tac couleurs |head -n -21|sed -n '1~2p' |tac|awk '{print $15}'|rev | cut -c 8- | rev>temp
tac couleurs |head -n -21|sed -n '1~2p' |tac|awk '{print $3}'>clr
nbligne=$(cat temp|wc -l)
while [ "$nbligne" != 0 ]; do
        v1=$(cat clr|tail -n $nbligne |head -n 1)
        v2=$(cat temp|tail -n $nbligne |head -n 1)
        echo "$v1 $v2">>tab
        ((nbligne--))
done
rm couleurs temp clr
