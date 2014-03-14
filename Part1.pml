#define N 3

byte a[N];
int next = 0; // Which entry of the array to increment next.

active [N] proctype increment() {
  do
  ::(next == _pid) -> // A process increments only its entry of a.
    if
    ::a[next] < 10 -> 
        a[next]++;
        next = (next + 1) % N; // Make sure next stays in bounds of the array.
    ::else -> break;
    fi;
  od;
}
