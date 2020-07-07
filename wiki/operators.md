# operators

There is a set of generic operators for a graph structure construction. They can be overridden in inherited node classes to provide specialized behavior.

```py
# A[B]
    def __getitem__(self, key):
        return self.slot[key]
# A[B]=C
    def __setitem__(self, key, that):
        self.slot[key] = that
        return self
# A<<B ~> A[B.type]=B
    def __lshift__(self, that):
        return self.__setitem__(that._type(), that)
# A>>B ~> A[B.val]=B
    def __rshift__(self, that):
        return self.__setitem__(that.val, that)
# A//B ~> A.push(B)
    def __floordiv__(self, that):
        if isinstance(that, str):
            return self // String(that)
        if isinstance(that, list):
            for i in that:
                self // i
            return self
        self.nest.append(that)
        return self

```
