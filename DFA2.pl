%% Deterministic Finite Automaton
%
% Brady Neeb <bneeb@mail.smcvt.edu>
%
% Use the numbers on the state labels as shown 
% (in code numbers 0-5) to represent each of the
% five states. Rewrite the transition function to 
% represent this DFA. Keep in mind that q and sigma
% are implicit in the transition function.
%
% Modified dfa1.pl to include predicated for the 
% two accept states, and write a predicate which
% determines if a given string (represented as a list of 
% symbols) is a language of this DFA.
%
% DFA is a tuple: (Q, sig, d_hat, q_0, F) 
% Q = set of states
% sig = alphabet
% d_hat = Q x sig -> Q is the transition function
% q_0 in Q = start state
% F = set of accept states

% Transition Functions:
d(0, a, 1).
d(0, b, 3).
d(1, a, 1).
d(1, b, 2).
d(2, b, 2).
d(2, a, 1).
d(3, b, 3).
d(3, a, 4).
d(4, b, 3).

% Start and end states
start(0).
end(1).
end(3).

% Call accept([ ... ]) to test finite state machine.
% Starts at 0, end states ate 1 or 3.
accept(Q) :-
    start(S),
    d_hat(S, Q).


% d_hat is the transitions state. 
d_hat(X, [A|B]) :-
    d(X, A, Y),
    d_hat(Y, B).

% Once list is empty, see if it is an ending state or not
d_hat(X, []) :-
    end(X).



