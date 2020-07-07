# `Object`

* [[Primitive]]
* [[Active]]
* [[Meta]]
* [[IO]]

`Object` is the base class for [[object graph]] nodes -- the universal data container, which can hold any scalar value, and work as any well-known data container including AST structure well-known in compiler design. This universality provides an ability to represent code in any programming languages, and object graph as a universal program/data representation ([homoiconicity](https://en.wikipedia.org/wiki/Homoiconicity)).

```py
class Object:
    def __init__(self, V):
        self.val = V
        self.slot = {}
        self.nest = []
    def _type(self): return self.__class__.__name__.lower()
    def _val(self): return '%s' % self.val
```

## [[dump]]
## [[operators]]
