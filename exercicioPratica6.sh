#!/bin/bash

calculoDiagonal (){
    echo "Digite os lados do paralelepípedo: " 
    read a b c
    D=$(((a*a)+(b*b)+(c*c))) 
    echo "A diagonal do paralelepípedo é: "
    echo "scale=2;sqrt($D)" |bc -l
}
calculoMDC (){
    echo "Digite os números cujo MDC deseja saber: " 
    read x y z
    menorNum=$x
    if [ "$menorNum" -gt "$y" ]
        then
        menorNum=$y
    fi
    if [ "$menorNum" -gt "$z" ]
        then
        menorNum=$z
    fi
    for C in $(seq 1 $menorNum)
    do
    MOD1=$((x - (x / C) * C))    
    MOD2=$((y - (y / C) * C))   
    MOD3=$((z - (z / C) * C)) 

    comp=$((MOD1 + MOD2 + MOD3))

    if [ "$comp" -eq 0 ]
        then
        MDC=$C
    fi
    done

    
    echo "O MDC de $x, $y e $z é:"
    echo "$MDC"
}

select funcaoDesejada in Paralelepípedo MDC
do
case $funcaoDesejada in
Paralelepípedo) 
    calculoDiagonal
;;
MDC) 
    calculoMDC 
;;
esac
break;
done