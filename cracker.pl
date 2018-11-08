c:-['cracker.pl'].
% facts

%slots
:-dynamic slot/2.
slot(0,1).
slot(1,1).
slot(2,1).
slot(3,1).
slot(4,1).
slot(5,1).
slot(6,1).
slot(7,1).
slot(8,1).
slot(9,1).
slot(10,1).
slot(11,1).
slot(12,1).
slot(13,1).
slot(14,1).

% valid moves
move(0,1,3).
move(3,1,0).
move(0,2,5).
move(5,2,0).
move(1,3,6).
move(6,3,1).
move(1,4,8).
move(8,4,1).
move(2,4,7).
move(7,4,2).
move(2,5,9).
move(9,5,2).
move(3,6,10).
move(10,6,3).
move(3,7,12).
move(12,7,3).
move(4,7,11).
move(11,7,4).
move(4,8,13).
move(13,8,4).
move(5,8,12).
move(12,8,5).
move(5,9,14).
move(14,9,5).
move(3,4,5).
move(5,4,3).
move(6,7,8).
move(8,7,6).
move(7,8,9).
move(9,8,7).
move(10,11,12).
move(12,11,10).
move(11,12,13).
move(13,12,11).
move(12,13,14).
move(14,13,12).

% rules

valid_move(X,Y,Z):-
  move(X,Y,Z),slot(X,1),slot(Y,1),slot(Z,0),
  retract(slot(X,1)),retract(slot(Y,1)),retract(slot(Z,0)),
  assert(slot(X,0)),assert(slot(Y,0)),assert(slot(Z,1)).

test:-
  reset_board,
  writeln("=== 0 ==="),
  go(0);nl,reset_board,
  writeln("=== 1 ==="),
  go(1);nl,reset_board,
  writeln("=== 2 ==="),
  go(2);nl,reset_board,
  writeln("=== 3 ==="),
  go(3);nl,reset_board,
  writeln("=== 4 ==="),
  go(4);nl,reset_board.

go(X):-
  retract(slot(X,1)),
  assert(slot(X,0)),
  print_board,
  solve(X).

solve(X):-
  move(A,B,X),
  valid_move(A,B,X),
  print_board,
  slot(Y,0), solve(Y).

print_board:-
  write("    "), print_slot(0),nl,
  write("   "), print_slot(1),print_slot(2),nl,
  write("  "), print_slot(3),print_slot(4),print_slot(5),nl,
  write(" "), print_slot(6),print_slot(7),print_slot(8),print_slot(9),nl,
  print_slot(10),print_slot(11),print_slot(12),print_slot(13),print_slot(14),nl,nl.

print_slot(X):-
  slot(X,Y),
  ( Y =:= 0 -> write('. ')
  ; Y =:= 1 -> write('x ')
  ).

reset_board:-
  retractall(slot(X,0)),
  retractall(slot(X,1)),
  ['cracker'].
