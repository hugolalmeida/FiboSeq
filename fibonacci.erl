-module(fibonacci).
-export([start/0, generate/1, print_list/1, filter_even/1, search/2, range/1, is_empty/1]).

%% ---------------------------
%% Main Function
%% ---------------------------

%% initiates the Fibonacci sequence generation and provides a menu for user interaction.
%% It prompts the user for the number of Fibonacci numbers to generate and handles various operations on the
start() ->
    io:format("Enter how many Fibonacci numbers to generate: "),
    {ok, [N]} = io:fread("", "~d"),  % read user input
    N = max(N, 0),  % ensure N is non-negative
    List = generate(N),
    case is_empty(List) of
        true ->
            io:format("List is empty. Generate again.~n"),
            start();
        false ->
            print_list(List),
            menu(List)
    end.

%% ---------------------------
%% interactive menu for user operations
%% ---------------------------

menu(List) ->
    io:format("Choose option:~n"),
    io:format("1 - Filter even numbers~n"),
    io:format("2 - Search for a number~n"),
    io:format("3 - Show range (first and last)~n"),
    io:format("4 - Generate new sequence~n"),
    io:format("5 - Exit~n"),
    {ok, [Option]} = io:fread("", "~d"),
    case Option of
        1 ->
            io:format("Even numbers: ~p~n", [filter_even(List)]),
            menu(List);
        2 ->
            io:format("Enter number to search: "),
            {ok, [Num]} = io:fread("", "~d"),
            search(Num, List),
            menu(List);
        3 ->
            io:format("Range: ~p~n", [range(List)]),
            menu(List);
        4 ->
            start(); % restart the Fibonacci sequence generation
        5 ->
            io:format("Bye!~n"),
            ok;
        _ ->
            io:format("Invalid option.~n"),
            menu(List)
    end.

%% ---------------------------
%% generate Fibonacci sequence
%% ---------------------------

generate(N) when is_integer(N) > 0 ->
    generate_seq(N, 0, 1, []);
generate(_) ->
    [].

generate_seq(0, _, _, Acc) ->
    lists:reverse(Acc); % reverses the accumulated list to maintain order
generate_seq(N, A, B, Acc) ->
    generate_seq(N-1, B, A+B, [A|Acc]).

%% ---------------------------
%% Print the Fibonacci sequence
%% ---------------------------

print_list(List) ->
    io:format("Fibonacci Sequence: ~p~n", [List]).

%% ---------------------------
%% Filter even numbers from the list
%% ---------------------------

filter_even(List) ->
    lists:filter(fun(X) -> X rem 2 =:= 0 end, List).

%% ---------------------------
%% Search for a number in the list
%% ---------------------------

search(Num, List) ->
    case lists:member(Num, List) of
        true -> io:format("Number ~p found!~n", [Num]);
        false -> io:format("Number ~p not found.~n", [Num])
    end.

%% ---------------------------
%% Get the range of the list (first and last elements)
%% ---------------------------

range(List) when List =/= [] ->
    {hd(List), lists:last(List)}.

%% ---------------------------
%% Check if the list is empty
%% ---------------------------

is_empty(List) ->
    List =:= [].
