

byte x = 0;
byte y = 0;
byte z = 0;

chan toY=[0] of {bool};
chan toX=[0] of {bool};

active proctype incrementX() {
  do
  ::toX?true ->
    if
    :: x < 3 -> x++; toY!true;
    :: else -> break;
    fi;
  od;
}

active proctype incrementY() {
  do
  ::toY?true ->
    if
    :: y < 3 -> y++; toX!true;
    :: else -> break;
    fi;
  od;
}

init {
  toX!true
}


