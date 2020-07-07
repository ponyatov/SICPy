# `.eval()` computation in [[context]]

```py
add = Op('+') // Integer(137) // Integer(349)
print(add)
```
```
<op:+> @7f5b203dc710
        0: <integer:137> @7f5b203dc748
        1: <integer:349> @7f5b203dc780
```
```py
ctx = Object('context')
print(add.eval(ctx))
```
```
<integer:486> @7f213eeca9b0
```
`metaL` follows functional languages paradigm: computation of a value does not affect on its source expression:
```py
print(add)
```
```
<op:+> @7f5b203dc710
        0: <integer:137> @7f5b203dc748
        1: <integer:349> @7f5b203dc780
```

## Tracing `.eval` with [[pdb]]

```py
add.eval(ctx)
```
The `.eval(self,ctx)` method goes to compute the given object in the computational [[context]]. Context holds variables bindings, also can run as a stack or message queue. `Object.eval` call results in [[Error]] exception, other node types override this method to do real computation. 
```py
class Op(Active):
    def eval(self, ctx):
        greedy = []
        for i in self.nest:
            greedy.append(i.eval(ctx))
```
Greedy computation used by default: all sub-operands must be eval()uated before computing the `Op`erator itself.
```py
        if self.val == '+':
            sum = greedy[0]
            for j in greedy[1:]:
                sum = sum.add(j, ctx)
            return sum
```
`Op.eval()` redirects computation to special `Object` methods, corresponds to operator `.val`: `+ ~> .add`
```py
class Integer(Primitive):
    def add(self, that, ctx):
        return Integer(self.val + that.val)
```
New `Integer` will be created by used number in left operand's `self.val` and value in right operand's `that.val`. Original operands stays unchanged.

