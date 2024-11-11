%1
member(X, [X|_]).
member(X, [_|T]) :- member(X, T).
%2
first(E, [E|_]).
%3
last(E, [E]).
last(E, [_|T]) :- last(E, T).
%4
penultimate(E, [E, _]).
penultimate(E, [_|T]) :- penultimate(E, T).
%5
del_k(X, [X|T], 1, T).
del_k(X, [H|T], K, [H|R]) :-
    K > 1,
    K1 is K - 1,
    del_k(X, T, K1, R).
% 6 i had a problem so i searched and i found to avoid conflict i can
% rename my predicate lenght to list_length.
list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.
%7
even(L) :- length(L, N), N mod 2 =:= 0.
%8
concat([], L, L).
concat([H|T], L, [H|R]) :- concat(T, L, R).
%9
palindrome(L) :- reverse(L, L).

reverse([], []).
reverse([H|T], R) :-
    reverse(T, RT),
    concat(RT, [H], R).



