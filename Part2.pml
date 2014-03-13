#define N 10
#define CAPACITY 10

int j = 0;
int sum1, sum2;
chan c=[CAPACITY] of {int}

active proctype Sender() {

	do
	::j <= N -> run Intermediate1(j); j++;
	::j <= N -> run Intermediate2(j); j++;
	od;
}

active proctype Receiver() {
  int i;
  
  do
  ::c?i -> printf("%d\n", i);
  od;
}

proctype Intermediate1(int i) {
  sum1 = sum1 + i;
  c!i;
}

proctype Intermediate2(int i) {
  sum2 = sum2 + i;
  c!i;
}
