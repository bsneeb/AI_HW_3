:- use_module(library(clpfd)).

start :-
        % Restrict domains to the finite set [1, 2, 3, 4]
	[Mayer, Hoover, Miller, Smith] ins 1..4,
	[German, English, Math, Physics] ins 1..4,

        % Add the constraint that all must be different
	all_different([Mayer, Hoover, Miller, Smith]),
	all_different([German, English, Math, Physics]),

        % Assign labels, 1--4, to these variables...
	label([Mayer, Hoover, Miller, Smith]),

        % ...subject to these constraints:
	Mayer #\= 4,                 % Mayer not in room 4
	Miller #= German,            % Miller teaches German
	abs(Miller - Smith) #>= 2,   % Miller/Smith not adj. rooms
	Hoover #= Math,              % Hoover teaches math
	Physics #= 4,                % Physics in room 4
	German #\= 1,                % German not in room 1
	English #\= 1,               % English not in room 1

        % Display the result
	nl,
	write([Mayer, Hoover, Miller, Smith]),
	nl,
	write([German, English, Math, Physics]),
	nl.