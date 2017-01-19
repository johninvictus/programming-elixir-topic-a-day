### Elixir Basics
Here we will look at some of the Elixir types and some simple operations

#### Build in Types
These includes
 * Value types:
    * Arbitrary-sized integers
    * Floating-point numbers
     * Atoms
     * Ranges
    * Regular expressions
 * System types:
    * PIDs and ports
    * References
 * Collection types:
    * Tuples
    * Lists
    * Maps
    * Binaries
    
##### INTEGERS
Integer literals can be written as decimal (1234), hexadecimal (0xcafe), octal (0o765), and binary (0b1010).

Decimal numbers may contain underscores—these are often used to separate groups of three digits when writing large numbers, so one million could be written 1_000_000.

##### FLOATING-POINT NUMBERS
Floating-point numbers are written using a decimal point. There must be at least one digit before and after the decimal point.

##### ATOMS
Atoms are constants that represent something’s name. We write them using a leading colon (:), which can be followed by an atom word or an Elixir operator. An atom word is a sequence of letters, digits, underscores, and at signs (@). It may end with an exclamation point or a question mark. You can also create atoms containing arbitrary characters by enclosing the characters following the colon in double quotes. These are all atoms:

``` diff
:fred  :is_binary?  :var@2  :<>  :===  :"func/3" :"long john silver"
```

##### RANGES
Ranges are represented as start..end, where start and end are integers.
ie 1..9 

##### REGULAR EXPRESSIONS
Regular expression in elixir are written in **~r{ ... }** but you can replace {} with // or any none nonalphanumeric characters , ie, **~r<...>**, **~r/.../**

The Regex module gives us the following methods:
* run
* scan
* split
* replace

**run** 

Runs the regular expression against the given string until the first match.
```shell
iex(6)> Regex.run ~r{[a-zA-Z]}, "john"
["j"]
iex(7)> Regex.run ~r{[a-zA-Z]}, "123" 
nil
iex(8)> 
```
**scan**

scan performs run several times collecting all matches of the regular expression.
ie
```shell
iex(9)> Regex.scan ~r{[a-zA-Z]}, "john"
[["j"], ["o"], ["h"], ["n"]]
iex(10)> Regex.scan ~r{[a-zA-Z]}, "123" 
[]
iex(11)> 
```

**replace**

It takes in a Regex string ,a sring to match and an a replace symbol
```shell
iex(11)> Regex.replace ~r{[a-zA-Z]}, "john", "*"
"****"
iex(12)> Regex.replace ~r{[a-zA-Z]}, "john", "X"
"XXXX"
iex(13)> Regex.replace ~r{[a-j]}, "john", "X"   
"XoXn"
```
**split**

It will split a string at the occurence of the regex symbol
ie
```shell
iex(19)> Regex.split ~r{[" "]}, "john invictus"       
["john", "invictus"]
iex(20)> 
```
##### PIDS AND PORTS
A PID is a reference to a local or remote process, and a port is a reference to a resource (typically external to the application) that you’ll be reading or writing.

The PID of the current process is available by calling self. A new PID is created when you spawn a new process.
```shell
iex(20)> self
#PID<0.81.0>
iex(21)> 
```

##### TUPLES
Tuples are unordered list of items,which are enclosed in curry braces and separated by a comma.
Tuple element are immutable.
An they mostly contain 2 - 4 items
```diff
{1,2,3} {:ok, "raising"} {:error, "can not happen", 404}
``` 
They can be used in pattern matching like
```shell
iex(22)> {status, message, code} = {:ok, "Transaction was a success", 200}
{:ok, "Transaction was a success", 200}
iex(23)> status
:ok
iex(24)> message
"Transaction was a success"
iex(25)> code
200
iex(26)> {:ok, message, code} = {:error, "Transaction was a success", 200}
** (MatchError) no match of right hand side value: {:error, "Transaction was a success", 200}
iex(26)>
```

##### LISTS 
List are elements enclose in **[]** and separated by a comma.
List are linked structures and they are immutable
Operation on list are very expensive since to get an element at a given index you have to loop (n-1) time to get there.
```shell
iex(29)> names =["john", "invictus"]
["john", "invictus"]
iex(30)> [head|_] = names
["john", "invictus"]
iex(31)> head
"john"
iex(32)> 
```

##### Keyword Lists
Because we often need simple lists of key/value pairs, Elixir gives us a shortcut. If we write
```shell
[ name: "Dave", city: "Dallas", likes: "Programming"]
```
Elixir converts it into a list of two-value tuples:
```shell
	[ {:name, "Dave"}, {:city, "Dallas"}, {:likes, "Programming"} ]
```

Elixir allows us to leave off the square brackets if a keyword list is the last argument in a function call. Thus,

```shell
DB.save record, [ {:use_transaction, true}, {:logging, "HIGH"} ]
```
can be written more cleanly as
``` shell
DB.save record, use_transaction: true, logging: "HIGH"
```
We can also leave off the brackets if a keyword list appears as the last item in any context where a list of values is expected.

##### Maps
A map is a collection of key/value pairs

The sysntax of a map looks like
```diff
%{key => value, key => value}
```
ie
```shell
iex(2)> %{:L => "lake",:KE => "kenya", :US => "united states"}
%{KE: "kenya", L: "lake", US: "united states"}
iex(3)> 
```
When using atoms as the key,you can use a short cut ie
```shell
iex(3)> %{KE: "kenya", L: "lake", US: "united states"}
%{KE: "kenya", L: "lake", US: "united states"}
iex(4)> 
```
When keys are mixed of atoms and strings
```shell
iex(5)> %{"L" => "lake",:KE => "kenya", :US => "united states"}
%{:KE => "kenya", :US => "united states", "L" => "lake"}
iex(6)> 
```

##### THE WITH EXPRESSION

read this
