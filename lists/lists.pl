% Problem 1
% Find the last element of a list.

my_last([L], L).
my_last([_|T], L) :-
  my_last(T, L).


% Problem 2
% Find the last-but-one (or second-last) element of a list.

my_but_last([K,_], K). 
my_but_last([_|T], K) :-
  my_but_last(T, K).


% Problem 3
% Find the Kth element of a list.

element_at([H|_], 1, H).
element_at([_|T], K, H) :-
  Ki is K-1,
  element_at(T, Ki, H).


% Problem 4
% Find the number of elements in a list.

my_length([], 0).
my_length([_|T], N) :-
  my_length(T, Ni),
  N is Ni+1.
