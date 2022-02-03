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

d_hat(Q_0, [], [Q_0]).

d_hat(Q_0, [X | Xs], [Q_0 | Qs]) :-
    d(Q_0, X, Q_n),
    d_hat(Q_n, Xs, Qs).
