:- use_module(library(clpfd)).

start :-
    [Audi, Jaguar, Ford, Honda, Toyota] ins 1.. 5,
    [Shep, Mona, Desmond, Thelma, Wim] ins 1..5,

    all_different([Shep, Mona, Desmond, Thelma, Wim]),
    all_different([Audi, Jaguar, Ford, Honda, Toyota]),

    label([Shep, Mona, Desmond, Thelma, Wim]),

    Desmond #= Audi,                % Desmond can only work on Audis
    abs(Desmond - Shep) #>= 2,      % Desmond and Shep can not work next to each other
    Mona #= Ford,                   % Mona works on fords
    abs(Mona - Wim) #>= 2,          % Mona and Wim cant work next to each other
    Wim #\= Jaguar,                 % Wim does not work on Jaguars
    Wim #\= 1,                  % Wim does not work in Bay 1
    Shep #\= 4,                 % Shep does not work in bay 4
    Thelma #= 5,                % Themla must work in bay 5
    Audi #\= 1,                 % Audis cannot be in bay 1
    Jaguar #\= 1,               % Jags not services in bay 1 
    Jaguar #\= 3,               % or bay 3
    Honda #= 4,                 % Hondas are serviced in bay 4

    nl,
    nl,
    write("Mechanic: "),
    write([Shep, Mona, Desmond, Thelma, Wim]),
    nl,
    write("Car: "),
    write([Audi, Jaguar, Ford, Honda, Toyota]).

