# `Object` dump

This subset of `Object` methods is required to show any subgraph in a human-readable form. The most compact and easy to read form is tabbed tree, with cycles marked with ` _/` suffix. As you can see below, every graph node is represented by a `<T:V>` header marked with hex id to differ nodes with the same type and value.

```py
class Object:

    def __repr__(self): return self.dump()

    def dump(self, done=[], depth=0, prefix=''):
        # header
        tree = self._pad(depth) + self.head(prefix)
        # cycles
        if not depth:
            done = []
        if self in done:
            return tree + ' _/'
        else:
            done.append(self)
        # slot{}s
        for i in self.slot:
            tree += self.slot[i].dump(done, depth + 1, '%s = ' % i)
        # nest[]ed
        idx = 0
        for j in self.nest:
            tree += j.dump(done, depth + 1, '%s: ' % idx)
            idx += 1
        # subtree
        return tree

    def _pad(self, depth): return '\n' + '\t' * depth

    def head(self, prefix=''):
        return '%s<%s:%s> @%x' % (
            prefix, self._type(), self._val(), id(self))

    def _type(self): return self.__class__.__name__.lower()
    def _val(self): return '%s' % self.val
```


```
<module:metaL> @7fd612bcd6a0
        0: <file:README.md> @7fd612bcd6d8
                0: <string:#  metaL> @7fd612bcd710
                1: <string:## [meta]programming [L]anguage> @7fd612bcd748
                2: <string:> @7fd612bcd780
                3: <string:homoiconic metaprogramming system> @7fd612bcd7b8
                4: <string:> @7fd612bcd7f0
                5: <string:(c) Dmitry Ponyatov <<dponyatov@gmail.com>> 2020 MIT> @7fd612bcd828
                6: <string:> @7fd612bcd860
        1: <file:Makefile> @7fd612bcd898
        2: <file:metaL.ini> @7fd612bcd8d0
        3: <file:.gitignore> @7fd612bcd908
        4: <file:metaL.py> @7fd612bcd940
                0: <section:graph> @7fd612bcd978
                        0: <class:Object> @7fd612bcd9b0
                                0: <class:Primitive> @7fd612bcd9e8
                                        0: <class:String> @7fd612bcda58
                        1: <section:primitive> @7fd612bcda20
                                0: <class:Primitive> @7fd612bcd9e8 _/
```