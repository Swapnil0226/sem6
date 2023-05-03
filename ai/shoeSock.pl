sock(left).
sock(right).
shoe(left).
shoe(right).

place(floor).
place(table).

solve(Initial, Final, Plan) :- strips(Initial, Final, Plan).

strips(Initial, Final, Plan) :- strips(Initial, Final, [Initial], Plan).

strips(Initial, Final, Visited, Plan) :-
deepening_strips(1, Initial, Final, Visited, Plan).

deepening_strips(Bound, Initial, Final, Visited, Plan) :-
bounded_strips(Bound, Initial, Final, Visited, Plan).

deepening_strips(Bound, Initial, Final, Visited, Plan) :-
succ(Bound, Successor),
deepening_strips(Successor, Initial, Final, Visited, Plan).

bounded_strips(_, Final, Final, _, []).

bounded_strips(Bound, Initial, Final, Visited, [Action|Actions]) :-
succ(Predecessor, Bound),
action(Initial, Action),
perform(Initial, Action, Intermediate),
+ member(Intermediate, Visited),
bounded_strips(Predecessor, Intermediate, Final, [Intermediate|Visited], Actions).

action(State, put_on(Sock, Shoe)) :-
sock(Sock),
shoe(Shoe),
free(State, Sock),
free(State, Shoe),
Sock = Shoe.

free(State, Thing) :-
thing(Thing),
+ member(on(_, Thing), State).

thing(Sock) :- sock(Sock).
thing(Shoe) :- shoe(Shoe).
thing(Place) :- place(Place).

perform(Source, put_on(Sock, Shoe), Target) :-
substitute(on(Sock, floor), Source, on(Sock, Shoe), Intermediate),
substitute(on(Shoe, floor), Intermediate, on(Shoe, Sock), Target).

substitute(_, [], _, []).
substitute(A, [A|As], B, [B|Bs]) :-
substitute(A, As, B, Bs), !.
substitute(A, [X|As], B, [X|Bs]) :-
substitute(A, As, B, Bs).