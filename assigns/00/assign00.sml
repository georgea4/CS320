(* ****** ****** *)
(*
Assign00: Warmup!
*)
(* ****** ****** *)

(*
fun fact(x: int): int =
  if x > 0 then x * fact(x-1) else 1
*)

(*
Assign00-01: 10 points
Please find the first integer N such that the
evaluation of fact(N) in SML/NJ yields an Overflow
exception.
*)

(* ****** ****** *)

(*
Assign00-02: 10 points
Please implement a function that tests whether a
given natural number is a prime:
fun isPrime(n0: int): bool
*)
fun is_num(n : int, currentDivisor : int) =
    if currentDivisor <= n - 1 then
        n mod currentDivisor = 0 orelse is_num(n, currentDivisor + 1)
    else
        false;

fun isPrime(n0 : int) : bool =
    if n0 = 2 then
        true
    else
        not(is_num(n, 2));

(* ****** ****** *)

(*
Assign00-03: 10 points
Please implement a function that converts a given
integer to a string that represents the integer:
fun int2str(i0: int): string
*)
fun int2str(n:int) : string = 
if n=0 
then "0" 
else if n =1 
then "1" 
else if n =2 
then "2" 
else if n =3 
then "3" 
else if n =4 
then "4" 
else if n =5 
then "5" 
else if n =6 
then "6" 
else if n =7
 then "7" 
else if n =8 
then "8" 
else if n =9 
then "9" 
else int2str(n div 10)^int2str(n mod 10);

(* ****** ****** *)

(*
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
*)

fun pow10(n)=
  if n=0 then 1 else 10 * pow10(n-1);

fun str2listneg (L,n) =
  if null L then 0
  else ~(ord(hd L)-48) * pow10(n) + str2listneg(tl L, n-1);

fun str2list (L,n) =
  if null L then 0
  else if ord(hd L) = 126 then str2listneg(tl L, n-1)
  else (ord(hd L)-48) * pow10(n) + str2list(tl L, n-1);

fun str2int (string) =
  str2list(explode(string), size(string) - 1);

(*
Assign00-05: 10 points
Please implement a function that returns the reverse of
a given string:
fun stringrev(cs: string): string
*)
fun reverseAux(s:string, i:int) : string = 
    if i = 1 then str(String.sub(s, 0)) 
    else str(String.sub(s, i-1)) ^ reverseAux(s, i-1);

fun stringrev(s:string) : string = 
    reverseAux(s, size(s));
(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00.sml] *)
