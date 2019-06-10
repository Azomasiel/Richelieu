#!/bin/bash

cipher=$(head -n 1 ./motDePasseGPG.hex.txt.enc)
while read e; do
    while read modulus; do
        #for file in ./prime1generated/*
        #do
            while read line; do
                prime1=$(bc <<< "obase=16; ibase=16; $line")
                prime2=$(bc <<< "obase=16; ibase=16; $modulus / $line")
                if [ $(bc <<< "obase=16; ibase=16; $modulus % $line != 0 || $prime2 % 2 == 0 || $prime2 % 3 == 0") -eq 0 ]
                then
                    phi=$(bc <<< "obase=16; ibase=16; ($prime1 - 1) * ($prime2 - 1)")
                    a=$e
                    b=$phi
                    x=0
                    y=1
                    u=1
                    v=0
                    while [ $(bc <<< "obase=16; ibase=16; $a!=0") -eq 1 ]; do
                        q=$(bc <<< "obase=16; ibase=16; $b/$a")
                        #echo "q: $q"
                        remainder=$(bc <<< "obase=16; ibase=16; $b%$a")
                        #echo "r: $remainder"

                        m=$(bc <<< "obase=16; ibase=16; $x-($u*$q)")
                        #echo "m: $m"
                        n=$(bc <<< "obase=16; ibase=16; $y-($v*$q)")
                        #echo "n: $n"
                        b=$a
                        #echo "b: $b"
                        a=$remainder
                        #echo "a: $a"
                        x=$u
                        #echo "x: $x"
                        y=$v
                        #echo "y: $y"
                        u=$m
                        #echo "u: $u"
                        v=$n
                        #echo "v: $v"
                    done
                    gcd=$b
                    if [ $(bc <<< "obase=16; ibase=16; $gcd!=1") -eq 1 ] 
                    then
                        echo "modular inverse error"
                    else
                        d=$(bc <<< "obase=16; ibase=16; $x%$phi")

                        echo "p: $(bc <<< "obase=16; ibase=16; $prime1")" > privatekeyinfohex.txt
                        echo "q: $(bc <<< "obase=16; ibase=16; $prime2")" >> privatekeyinfohex.txt

                        
                        echo "modulu: $(bc <<< "obase=16; ibase=16; $modulus")" >> privatekeyinfohex.txt

                        echo "d: $(bc <<< "obase=16; ibase=16; $d")" >> privatekeyinfohex.txt


                        echo "e: $(bc <<< "obase=16; ibase=16; $e")" >> privatekeyinfohex.txt


                        echo "phi: $(bc <<< "obase=16; ibase=16; $phi")" >> privatekeyinfohex.txt

                    fi
                    
                    a=$e
                    b=$(bc <<< "obase=16; ibase=16; $prime1 - 1")
                    x=0
                    y=1
                    u=1
                    v=0
                    while [ $(bc <<< "obase=16; ibase=16; $a!=0") -eq 1 ]; do
                        q=$(bc <<< "obase=16; ibase=16; $b/$a")
                        #echo "q: $q"
                        remainder=$(bc <<< "obase=16; ibase=16; $b%$a")
                        #echo "r: $remainder"

                        m=$(bc <<< "obase=16; ibase=16; $x-($u*$q)")
                        #echo "m: $m"
                        n=$(bc <<< "obase=16; ibase=16; $y-($v*$q)")
                        #echo "n: $n"
                        b=$a
                        #echo "b: $b"
                        a=$remainder
                        #echo "a: $a"
                        x=$u
                        #echo "x: $x"
                        y=$v
                        #echo "y: $y"
                        u=$m
                        #echo "u: $u"
                        v=$n
                        #echo "v: $v"
                    done
                    gcd=$b
                    if [ $(bc <<< "obase=16; ibase=16; $gcd!=1") -eq 1 ] 
                    then
                        echo "modular inverse error"
                    else
                        dp=$(bc <<< "obase=16; ibase=16; $x%($prime1-1)")

                        echo "dp: $d"

                    fi


                    a=$e
                    b=$(bc <<< "obase=16; ibase=16; $prime2 - 1")
                    x=0
                    y=1
                    u=1
                    v=0
                    while [ $(bc <<< "obase=16; ibase=16; $a!=0") -eq 1 ]; do
                        q=$(bc <<< "obase=16; ibase=16; $b/$a")
                        #echo "q: $q"
                        remainder=$(bc <<< "obase=16; ibase=16; $b%$a")
                        #echo "r: $remainder"

                        m=$(bc <<< "obase=16; ibase=16; $x-($u*$q)")
                        #echo "m: $m"
                        n=$(bc <<< "obase=16; ibase=16; $y-($v*$q)")
                        #echo "n: $n"
                        b=$a
                        #echo "b: $b"
                        a=$remainder
                        #echo "a: $a"
                        x=$u
                        #echo "x: $x"
                        y=$v
                        #echo "y: $y"
                        u=$m
                        #echo "u: $u"
                        v=$n
                        #echo "v: $v"
                    done
                    gcd=$b
                    if [ $(bc <<< "obase=16; ibase=16; $gcd!=1") -eq 1 ] 
                    then
                        echo "modular inverse error"
                    else
                        dq=$(bc <<< "obase=16; ibase=16; $x%($prime2-1)")

                        echo "dq: $d"

                    fi


                    a=$prime2
                    b=$prime1
                    x=0
                    y=1
                    u=1
                    v=0
                    while [ $(bc <<< "obase=16; ibase=16; $a!=0") -eq 1 ]; do
                        q=$(bc <<< "obase=16; ibase=16; $b/$a")
                        #echo "q: $q"
                        remainder=$(bc <<< "obase=16; ibase=16; $b%$a")
                        #echo "r: $remainder"

                        m=$(bc <<< "obase=16; ibase=16; $x-($u*$q)")
                        #echo "m: $m"
                        n=$(bc <<< "obase=16; ibase=16; $y-($v*$q)")
                        #echo "n: $n"
                        b=$a
                        #echo "b: $b"
                        a=$remainder
                        #echo "a: $a"
                        x=$u
                        #echo "x: $x"
                        y=$v
                        #echo "y: $y"
                        u=$m
                        #echo "u: $u"
                        v=$n
                        #echo "v: $v"
                    done
                    gcd=$b
                    if [ $(bc <<< "obase=16; ibase=16; $gcd!=1") -eq 1 ] 
                    then
                        echo "modular inverse error"
                    else
                        qi=$(bc <<< "obase=16; ibase=16; $x%$prime1")

                        echo "qi: $d"

                    fi
                echo 

                echo "dp: $(bc <<< "obase=16; ibase=16; $dp")" >> privatekeyinfohex.txt
                echo "dq: $(bc <<< "obase=16; ibase=16; $dq")" >> privatekeyinfohex.txt
                echo "qi: $(bc <<< "obase=16; ibase=16; $qi")" >> privatekeyinfohex.txt


                messageHex=$(bc <<< "obase=16; ibase=16; ($cipher ^ $d) % $modulus")

                echo $messageHex > ./messageHex.txt

                xxd -r -p ./messageHex.txt

                else
                    echo "skipped $file"
            fi

            done < ./prime1generated/81712
        #done
    done < ./modulus.txt
done < ./publicexponent.txt
