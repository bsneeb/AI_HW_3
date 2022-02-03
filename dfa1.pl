%% DFA example / finite state machine
%
% Clayton Cafiero <ccafiero@smcvt.edu>
%
% Here we define the transition function.
% Read these as δ(q_0, σ) = q_1
d(1, a, 2).
d(1, b, 2).
d(2, a, 3).
d(2, b, 3).
d(3, a, 1).
d(3, b, 1).
% Notice that definition of Sigma (the alphabet)
% and Q (the set of all states) is implicit.
% Sigma is the set formed by taking the union of
% of the second arguments. Q is the set formed by
% taking the union of all the first and third
% arguments.
% Here is our multi-step transition function.
% One rule to handle the empty word...
d_hat(Q_0, [], [Q_0]).
% ...and one rule for the others.
d_hat(Q_0, [X | Xs], [Q_0 | Qs]) :-
    d(Q_0, X, Q_n),
    d_hat(Q_n, Xs, Qs).
% Query like this:
%
% ?- d_hat(1, [a, b, b, a, a, b], X).
%
% That is, given the start state 1, what is the
% sequence of states that results from consuming
% the word "abbaab"?
%
% Then it is up to us to check if the last
% state in the sequence is an accepting state.