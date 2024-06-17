% Problem 54 (*)
% Check whether a given term represents a binary tree.

istree(nil).
istree(t(_, L, R)) :-
  istree(L),
  istree(R).


% Problem 55 (*)
% Construct completely balanced binary trees.

cbal_tree(0, nil).
cbal_tree(K, T) :-
  T = t(x, L, R),
  mod(K, 2) =:= 1,
  Kh is (K-1) // 2,
  cbal_tree(Kh, L),
  cbal_tree(Kh, R).
cbal_tree(K, T) :-
  T = t(x, L, R),
  Kl is K // 2,
  Kr is K // 2 - 1,
  cbal_tree(Kl, L),
  cbal_tree(Kr, R).
cbal_tree(K, T) :-
  T = t(x, L, R),
  Kl is K // 2 - 1,
  Kr is K // 2,
  cbal_tree(Kl, L),
  cbal_tree(Kr, R).


% Problem 56 (**)
% Symmetric binary trees.

mirror(nil, nil).
mirror(t(_, L1, R1), t(_, L2, R2)) :-
  mirror(L1, L2),
  mirror(R1, R2).

symmetric(nil).
symmetric(t(_, L, R)) :-
  mirror(L, R).


% Problem 57 (**)
% Binary search trees.

construct([], nil).
construct(List, t(X, L, R)) :-
  construct(ListL, L),
  construct(ListR, R),
  append(ListL, [H|ListR], List).
