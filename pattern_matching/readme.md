### Pattern Matching

In Elixir, the = sign doesn’t necessarily mean “set this variable equal to something else”. Instead, it means “match the left hand side to the right hand side”. Usually you can declare things like x = 2 and never notice a difference. At some point though, you’ll start to notice something is quite a bit different.

```shell
iex> x = 2
2
iex> y = 3
3
iex> 2 = x
2 # waaaat?
iex> 2 = y
** (MatchError) no match of right hand side value: 3
```
This blog here explain more 
https://quickleft.com/blog/pattern-matching-elixir/

Elixir pattern matching, A pattern (the left side) is matched if the values (the right side) have the same structure and if each term in the pattern can be matched to the corresponding term in the values. A literal value in the pattern matches that exact value, and a variable in the pattern matches by taking on the corresponding value.
ie
```shell
iex> list = [1, 2, [ 3, 4, 5 ] ]
	[1, 2, [3, 4, 5]]
	iex> [a, b, c ] = list
	[1, 2, [3, 4, 5]]
 	iex> a
 	1
 	iex> b
	2
 	iex> c
 	[3, 4, 5]
```
**When using variables**
```shell
iex> list = [1, 2, 3]
	[1, 2, 3]
	iex> [a, 2, b ] = list
 	[1, 2, 3]
 	iex> a
 	1
 	iex> b
 	3
```

```shell
iex> list = [1, 2, 3]
	[1, 2, 3]
	iex> [a, 1, b ] = list
 	** (MatchError) no match of right hand side value: [1, 2, 3]
```

Here the 1 (the second term in the list) cannot be matched against the corresponding element on the right side, so no variables are set and the match fails. This gives us a way of matching a list that meets certain criteria—in this case a length of 3, with 1 as its second element.

##### Ignoring a Value with _ (Underscore)
In case you want to match a value with a particular structure and length but you are not interested in all values you would use a **_** on the values you dont need 
ie
```shell
iex(7)> [a,b,_] = [20,10,34]
[20, 10, 34]
iex(8)> b
10
iex(9)> a
20
iex(10)> 
```
In the case above the use is interested to match a list with three items but he/she not interested by the third value hence use of underscore(_)

##### Variables Bind Once (per Match)
During matching a variable cant be matched to different values
ie
```shell
iex(19)> [x,x,x] = [1,1,1] 
[1, 1, 1]
iex(20)> [a,a,a] = [1,2,3]
** (MatchError) no match of right hand side value: [1, 2, 3]
    
iex(20)> 
```
**[x,x,x]** will match since the first 1 in the list on the right side binds it value to the first **x** and now X will be x=1 until matching is over
the above can be translated as x=1 = x=1 x=1 hence matching

The secord list will not match to the right side since **a** is bound to  1 and cant be matched to any other value, can be translated to a = 1, 1 = 2, 1 = 3

Varable in elixir can be rebound to other value ie
``` shell
iex(21)> a = 1
1
iex(22)> a = 2
2
```
But you can decide to use the existing value, and prevent rebinding using **^**(pin operator)
```shell
iex(21)> a = 1
1
iex(22)> a = 2
2
iex(23)> ^a = 4
** (MatchError) no match of right hand side value: 4
iex(23)> 
```
^a can be rebound to 4 because use ^ forces it to use 2, hence will not match ie 2 = 4

##### Another Way of Looking at the Equals Sign
Joe Armstrong, Erlang’s creator, compares the equals sign in Erlang to that used in algebra. When you write the equation x = a + 1, you are not assigning the value of a + 1 to x. Instead you’re simply asserting that the expressions x and a + 1 have the same value. If you know the value of x, you can work out the value of a, and vice versa.
