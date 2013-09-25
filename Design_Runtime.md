#Objective-C Script Design

##Features
#####1.Create class.

```
Class mySubclass = objc_allocateClassPair(
[NSObject class], 	//super class
"MySubclass",		//new class name
0);					//size for per-class storage
```

#####2.Add methods.

```
class_addMethod(
class,			//class to add method
selector,		//selector to add
IMP,			//adding IMP
encoding);		//
```
Can pass different count of params to IMP?

#####3.Add ivars.

```
class_addIvar(
mySubclass,					//class to add ivar
"foo", 						//ivar name
sizeof(id), 				//size of ivar. just use sizeof(type)
rint(log2(sizeof(id))), 	//alignment. just use rint(log2(sizeof(type)))
@encode(id));				//encoding. just use @encode(type))
```

Add a dealloc method to release ivars.

#####4.READ/WRITE ivar(need memory management by hand).

```
//READ
id currentValue;
object_getInstanceVariable(obj, "foo", &currentValue);
// it will be replaced, so autorelease
[currentValue autorelease];
//WRITE
id newValue = ...;
[newValue retain]; // runtime won't retain for us
object_setInstanceVariable(obj, "foo", newValue);
```

#####5.Add protocol.

```
class_addProtocol

```

#####6.Register class. Register class after setup it before use.

```
objc_registerClassPair(mySubclass);
```