female(A).
female(B).
female(C).
female(D).
male(E).
male(F).
male(G).
male(H).
parent(E,F).
parent(E,B).
parent(A,F).
parent(A,B).
parent(B,C).
parent(B,G).
parent(F,H).
parent(F,D).
mother(E,B):-parent(E,B),male(E).
mother(A,B):-parent(A,B),female(A).
father(E,F):-parent(E,F),male(E).
father(A,F):-parent(A,F),female(A).
grandfather(E,G):-parent(B,G),parent(E,B).
grandfather(E,H):-parent(F,H),parent(E,F).
grandmother(E,C):-parent(B,C),parent(E,B),male(E).
grandmother(E,D):-parent(F,D),parent(E,F),male(E).