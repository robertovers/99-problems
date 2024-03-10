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

% tail-recursive version
my_length_tr(List, N) :-
  my_length_aux(List, 0, N).
my_length_aux([], N, N).
my_length_aux([_|T], I, N) :-
  Ii is I+1,
  my_length_aux(T, Ii, N).


% Problem 5
% Reverse a list.

my_reverse([], []).
my_reverse([H|T], Reversed) :-
  append(Tr, [H], Reversed),
  my_reverse(T, Tr).


% Problem 6
% Find out whether a list is a palindrome.

is_palindrome([]).
is_palindrome([_]).
is_palindrome(List) :-
  append([H|T], [H], List),
  is_palindrome(T).
