% facts
hasSpareTire.
hasFlatTire.

% rules
needsToChangeTire :- hasFlatTire.

startChangingTire :-
    needsToChangeTire,
    write('Changing tire...'), nl,
    removeFlatTire,
    installSpareTire,
    tightenLugNuts.

removeFlatTire :-
    write('Removing flat tire...'), nl.

installSpareTire :-
    hasSpareTire,
    write('Installing spare tire...'), nl.

tightenLugNuts :-
    write('Tightening lug nuts...'), nl.