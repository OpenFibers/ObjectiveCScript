#Objective-C Script Design

### Grammar

```
√ File = MultiClass
√ MultiClass = Class | Class MulClass
√ Class = ClassHeader ClassBody ClassFooter
√ ClassHeader = @interface id : id | @interface id <protocols> 
				{ ivar_list }
√ ClassBody = MethodList
√ ClassFooter = @end

```

```
MethodList = Method | Method MethodList
Method = MethodHeader MethodBody
MethodBody = Scope

```

### Operator precedence

<table cellspacing="1" cellpadding="5" border="0">
<tbody><tr align="center" bgcolor="#222">
<th>Operator</th>
<th>Description</th>
<th>Precedence</th>
<th>Associativity</th>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>[]</tt><br>
<tt>.</tt><br>
<tt>()</tt><br>
<tt>-&gt;</tt><br>
</p>
</td>
<td>
<p>access array element or message expression<br>
access object member or method<br>
invoke a method or function<br>
pointer to structure member<br>
</p>
</td>
<td>Highest</td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>++</tt><br>
<tt>--</tt><br>
<tt>+</tt><br>
<tt>-</tt><br>
<tt>!</tt><br>
<tt>~</tt><br>
<tt>*</tt><br>
<tt>&amp;</tt><br>
<tt>sizeof</tt><br>
<tt>(type)</tt>
</p>
</td>

<td>
<p>increment<br>
decrement<br>
unary plus<br>
unary minus<br>
logical NOT<br>
ones complement<br>
pointer reference<br>
address of<br>
size of object<br>
type cast
</p>
</td>
<td></td>
<td>right to left</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>*</tt><br>
<tt>/</tt><br>
<tt>%</tt>
</p>
</td>
<td>
<p>multiply<br>
divide<br>
modulus<br>
</p>
</td>
<td></td>
<td>left to right</td>
</tr>


<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>+</tt><br>
<tt>-</tt>
</p>
</td>
<td>
<p>add<br>
subtract
</p>
</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p>
<tt>&lt;&lt;</tt><br>
<tt>&gt;&gt;</tt>
</p>
</td>
<td>
<p>
bitwise shift left<br>
bitwise shift right
</p>
</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p>
<tt>&lt;</tt><br>
<tt>&lt;=</tt><br>
<tt>&gt;=</tt><br>
<tt>&gt;</tt>
</p>
</td>
<td>
<p>
less than<br>
less than or equal to<br>
greater than or equal to<br>
greater than
</p>
</td>
<td></td>
<td>left to right</td>
</tr>


<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>==</tt><br>
<tt>!=</tt>
</p>
</td>
<td>
<p>equality
inequality
</p>
</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>&amp;</tt></td>
<td>bitwise AND</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>^</tt></td>
<td>bitwise XOR</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>|</tt></td>
<td>bitwise OR</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>&amp;&amp;</tt></td>
<td>logical AND</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>||</tt></td>
<td>logical OR</td>
<td></td>
<td>left to right</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td><tt>?:</tt></td>
<td>conditional</td>
<td></td>
<td>right to left</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<pre>
=
+=
-=
*=
/=
%=
&amp;=
^=
|=
&lt;&lt;=
&gt;&gt;=
</pre>
</td>
<td align="align">
<p>assignment
</p>
</td>
<td></td>
<td>right to left</td>
</tr>

<tr align="center" bgcolor="#ebebeb">
<td>
<p><tt>,</tt>
</p>
</td>
<td align="align">
<p>comma
</p>
</td>
<td>Lowest</td>
<td>right to left</td>
</tr>

</tbody></table>