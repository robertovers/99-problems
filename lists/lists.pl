% Problem 1 (*)
% Find the last element of a list.

my_last([L], L).
my_last([_|Rest], L) :-
  my_last(Rest, L).


% Problem 2 (*)
% Find the last-but-one (or second-last) element of a list.

my_but_last([K,_], K). 
my_but_last([_|Rest], K) :-
  my_but_last(Rest, K).


% Problem 3 (*)
% Find the Kth element of a list.

element_at([H|_], 1, H).
element_at([_|Rest], K, H) :-
  Ki is K-1,
  element_at(Rest, Ki, H).


% Problem 4 (*)
% Find the number of elements in a list.

my_length([], 0).
my_length([_|Rest], N) :-
  my_length(Rest, Ni),
  N is Ni+1.


% Problem 5 (*)
% Reverse a list.

my_reverse(List, Reversed) :-
  my_reverse_aux(List, [], Reversed).
my_reverse_aux([], Acc, Acc).
my_reverse_aux([H|Rest], Acc, Reversed) :-
  my_reverse_aux(Rest, [H|Acc], Reversed).


% Problem 6 (*)
% Find out whether a list is a palindrome.

is_palindrome([]).
is_palindrome([_]).
is_palindrome(List) :-
  append([H|Mid], [H], List),
  is_palindrome(Mid).


% Problem 7 (*)
% Flatten a nested list.

my_flatten([], []).
my_flatten([H|Rest], Flattened) :-
  append(H, RestF, Flattened),
  my_flatten(Rest, RestF).


% Problem 8 (**)
% Eliminate consecutive duplicates of list elements.

compress([], []).
compress([X], [X]).
compress([H,H|Rest], Compressed) :-
  compress([H|Rest], Compressed).
compress([X,Y|Rest], Compressed) :-
  X =\= Y,
  append([X], RestC, Compressed),
  compress([Y|Rest], RestC).


% Problem 9 (**)
% Pack consecutive duplicates of list elements into sublists.

pack(List, Packed) :-
  pack_aux(List, [], Packed).

pack_aux([], Acc, Packed) :-
  reverse(Acc, Packed).
pack_aux([H|Rest], [], Packed) :-
  pack_aux(Rest, [[H]], Packed).
pack_aux([H|Rest], [[H|RestH]|RestA], Packed) :-
  append([H], [H|RestH], Extended),
  pack_aux(Rest, [Extended|RestA], Packed).
pack_aux([H|Rest], [[X|RestH]|RestA], Packed) :-
  X =\= H,
  Acc = [[X|RestH]|RestA],
  pack_aux(Rest, [[H]|Acc], Packed).


% Problem 10 (*)
% Compute the run-length encoding of a list.

encode([], []).
encode([X], [[X,1]]).
encode([X|Rest], [[X,K]|RestE]) :-
  encode(Rest, [[X,KI]|RestE]),
  K is KI+1.
encode([X|Rest], [[X,1],[Y,K]|RestE]) :-
  encode(Rest, [[Y,K]|RestE]),
  X =\= Y.
