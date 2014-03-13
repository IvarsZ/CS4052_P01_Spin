#define N 3

byte a[N];
int next = 0;

active [N] proctype incrementN() {
  do
  ::(next == _pid) ->  
    if
    :: a[next] < 10 -> 
    atomic {
      a[next]++;
      next = (next + 1) % N;
    }
    :: else -> break;
    fi;
  od;
}
