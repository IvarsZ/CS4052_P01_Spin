byte x=1;
byte y=0;

active proctype P1(){
  do
  ::x=x+2
  od;
  }

active proctype P2(){
  do
  ::x=x+1
  od;
}

active proctype P3(){
  do
  ::y<x ->y=x
  od;
}

ltl prop1 {<>(x != 10)}
ltl prop2 {[](<> (x % 2 == 0)) }
ltl prop3 {<>([] (x % 2 == 0)) }
ltl prop4 {[] y <= x }
ltl prop5 {[] (y == x -> <>(y != x))}
