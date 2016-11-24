##### Anonymous Functions
An anonymous function is created using the fn keyword.
```elixir
fn param-list -> body end
```
Anonymous functions have a __->__ separator.

sample code
```shell
iex(2)> sum = fn a, b -> a+b end
#Function<12.52032458/2 in :erl_eval.expr/5>
iex(3)> sum.(1,2)
3
iex(4)>
```
If your function takes no arguments, you still need the parentheses to call it:
``` shell
iex(4)> callme = fn -> IO.puts "john !!!" end
#Function<20.52032458/0 in :erl_eval.expr/5>
iex(5)> callme.()
john !!!
:ok
```
##### Anonymous Functions and Pattern Matching
In elixer you can create an anonymous function with multiple bodies.And elixir will use pattern matching to determine which body run

```elixir
iex(7)> habdle_open = fn
...(7)> {:ok, file} -> "Read data: #{IO.read(file,:line)}"
...(7)> {_,error} -> "Error: #{:file.format_error(error)}"
...(7)> end
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(8)> habdle_open.(File.open("hello.ex"))
"Error: no such file or directory"
iex(9)>
```
##### Functions Can Return Functions
Elixir function can return a function
```elixir
iex(10)> fun1 = fn -> fn ->"Hello kenya lang" end end
#Function<20.52032458/0 in :erl_eval.expr/5>
iex(11)> fun1.()
#Function<20.52032458/0 in :erl_eval.expr/5>
iex(12)> fun1.().()
"Hello kenya lang"
iex(13)>
```
For readerbility let spread it out

```elixir
fn1 = fn ->
    fn -> "Hello kenya lang" end
    end
```
can also be written as
```elixir
iex(1)> fn1 = fn -> fn -> "Hello kenya lang" end end
iex(2)> fn2 = fn1.()
iex(3)> fn2.()
"Hello kenya lang"
iex(4)>
```
##### Functions Remember Their Original Environment

```elixir
iex(3)> message = fn recipient ->   
...(3)> fn ->"Hello  #{recipient}"
...(3)> end
...(3)> end
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(4)> x = message.("john")
#Function<20.52032458/0 in :erl_eval.expr/5>
iex(5)> x.()
"Hello  john"
iex(6)>
```
The **recipient** variable is accessible by all inner functions
We can also also write a function with parameter in all inner function
```elixir
iex(12)> lovers = fn male -> fn female -> "#{male} loves #{female}" end end
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(13)> lovers.("Jane").("Doe")                                           
"Jane loves Doe"
iex(14)>
```

##### Passing Functions As Arguments
Functions are just values, so we can pass them to other functions.

```elixir
iex(24)> add_3 = fn n -> 3+n end
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(25)> apply = fn(fun,value) -> fun.(value) end
#Function<12.52032458/2 in :erl_eval.expr/5>
iex(26)> apply.(add_3,10)
13
iex(27)>
```
The second function takes in the first function and invokes by passing a value.

Elixir uses function argument heavly in order to solve some issues eg
Multiplying or manupulating each value in an enumulable object
```elixir
iex(28)> list = [1,2,3,4,5,6,7]
[1, 2, 3, 4, 5, 6, 7]
iex(29)> Enum.map(list,fn n -> n + 3 end)
[4, 5, 6, 7, 8, 9, 10]
iex(30)>
```
##### PINNED VALUES AND FUNCTION PARAMETERS
We can use pin(^) operator that allows us to use the current value of the variable with function parameters

>The source code is in the **pin.exs**

##### THE & NOTATION
Instead of writting full syntax of annoymous function you could use a & Notation shortcut
```elixir
iex(2)> add_one = &(&1 + 1) #same as fn n -> n+1 end
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(3)> add_one.(1)
2
iex(4)> square = &(&1 * &1)
#Function<6.52032458/1 in :erl_eval.expr/5>
iex(5)> square.(2)
4
iex(6)> mult = &(&1 * &2)
&:erlang.*/2
iex(7)> mult.(2,5)
10
iex(8)> speak = &(IO.puts &1)
&IO.puts/1
iex(9)> speak.("john")
john
:ok
iex(10)>
```
The & operator converts the expression that follows into a function. Inside that expression, the placeholders &1, &2, and so on correspond to the first, second, and subsequent parameters of the function. So &(&1 + &2) will be converted to fn p1, p2 -> p1 + p2 end.

Because [] and {} are operators in Elixir, literal lists and tuples can also be turned into functions. Here’s a function that returns a tuple containing the quotient and remainder of dividing two integers:

```elixir
iex(11)> divrem = &{div(&1,&2),rem(&1,&2)}
#Function<12.52032458/2 in :erl_eval.expr/5>
iex(12)> divrem.(13,5)
{2, 3}
iex(13)>
```

There’s a second form of the & function capture operator. You can give it the name and arity (number of parameters) of an existing function, and it will return an anonymous function that calls it. The arguments you pass to the anonymous function will in turn be passed to the named function. We’ve already seen this: when we entered &(IO.puts(&1)) into iex, it displayed the result as &IO.puts/1. In this case, puts is a function in the IO module, and it takes one argument. The Elixir way of naming this is IO.puts/1. If we place an & in front of this, we wrap it in a function. Here are some other examples:

```elixir
iex(13)> len = &Enum.count/1                                          &Enum.count/1
iex(14)> len.([1,2,3,4])
4
iex(15)>
```
Now using & Notation we can pass function arguments like
```elixir
iex(16)> Enum.map [1,2,3,4], &(&1 + 3)
[4, 5, 6, 7]
iex(17)> Enum.map [1,2,3,4], &(&1 * &1)
[1, 4, 9, 16]
iex(18)> Enum.map [1,2,3,4], &(&1 < 3)
[true, true, false, false]
iex(19)>
```
