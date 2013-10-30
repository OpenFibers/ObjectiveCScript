#Objective-C Script Design

```
√ File = MulClass
√ MulClass = Class | Class MulClass
√ Class = ClassHeader ClassBodyAndFooter
√ ClassBodyAndFooter = ClassFooter | ClassBody ClassFooter

√ ClassFooter = @end

ClassHeader = @interface id : id | @interface id <protocols> #unfinished
ClassBody = MemberList PropertyList MethodList

```


```
MethodList = Method | Method MethodList
Method = MethodHeader MethodBody
```

```
MethodBody = CodeBlock

```