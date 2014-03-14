#define N 10
#define CAPACITY 10

int j = 0;
int sum1, sum2;

chan sendInt1 = [CAPACITY] of {int}
chan sendInt2 = [CAPACITY] of {int}
chan receive = [CAPACITY] of {int}

active proctype Sender() {

	do
	::j <= N -> sendInt1!j; j++;
	::j <= N -> sendInt2!j; j++;
	od;
}

active proctype Receiver() {
  int i;
  
  do
  ::receive?i -> printf("%d\n", i);
  od;
}

active proctype Intermediate1() {
  int i;

  do
  ::sendInt1?i -> sum1 = sum1 + i; receive!i;
  od;
}

active proctype Intermediate2() {
  int i;

  do
  ::sendInt2?i -> sum2 = sum2 + i; receive!i;
  od;
}
