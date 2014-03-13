#define N 3

byte a[N];
chan nextProcess=[0] of {int};

active [N] proctype incrementN() provided {
  int n;

  do
  ::nextProcess?n ->
    if
    :: a[n] < 3 -> a[n]++; nextProcess!((n+1) % N);
    :: else -> break;
    fi;
  od;
}

init {
  nextProcess!0;
}
