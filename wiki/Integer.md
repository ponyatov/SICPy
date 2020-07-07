# `Integer`

* [[Primitive]]
  * [[Number]]
    * [[Integer]]
      * [[Hex]]
      * [[Bin]]

```py
class Integer(Primitive):
    def __init__(self, V):
        Primitive.__init__(self, int(V))

    def add(self, that, ctx):
        assert isinstance(that,Integer)
        return Integer(self.val + that.val)
    def sub(self, that, ctx):
        assert isinstance(that,Integer)
        return Integer(self.val - that.val)
```
