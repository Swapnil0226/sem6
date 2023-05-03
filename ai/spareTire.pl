tire(spare).
tire(flat).

place(axle).
place(trunk).
place(ground).

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

action(State, remove(Tire)) :-
tire(Tire),
member(on(axle, Tire), State).

action(State, put_in(Tire, Trunk)) :-
tire(Tire),
place(Trunk),
member(on(ground, Tire), State),
free(State, Trunk).

action(State, take_out(Tire)) :-
tire(Tire),
member(in(Trunk, Tire), State).

action(State, move(Place1, Place2)) :-
place(Place1),
place(Place2),
Place1 = Place2,
member(on(Place1, Tire), State),
free(State, Place2).

free(State, Place) :-
place(Place),
+ member(on(Place, _), State),
+ member(in(Place, _), State).

perform(Source, remove(Tire), Target) :-
substitute(on(axle, Tire), Source, on(axle, flat), Target).

perform(Source, put_in(Tire, Trunk), Target) :-
substitute(on(ground, Tire), Source, in(Trunk, Tire), Target).

perform(Source, take_out(Tire), Target) :-
substitute(in(Trunk, Tire), Source, on(ground, Tire), Target).

perform(Source, move(Place1, Place2), Target) :-
select(on(Place1, Tire), Source, Intermediate),
substitute(on(Place2, Tire), Intermediate, on(Place1, ground), Target).

substitute(_, [], _, []).
substitute(A, [A|As], B, [B|Bs]) :-
substitute(A, As, B, Bs), !.
substitute(A, [X|As], B, [X|Bs]) :-
substitute(A, As, B, Bs).