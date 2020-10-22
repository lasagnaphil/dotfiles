# usage for debugging with gdb:
# gdb -x gdb_prettyprinter.py bin/*your_executable*
# (gdb) break *linenumber*
# (gdb) run
# (gdb) print *name_of_the_variable*

import gdb.printing

_type_letters = {
    gdb.TYPE_CODE_FLT: "f",
    gdb.TYPE_CODE_INT: "i",
    gdb.TYPE_CODE_BOOL: "b"
}

_vec_fields = ['x', 'y', 'z', 'w']

def _vec_info(v):
    T = v.type.template_argument(1)
    letter = _type_letters.get(T.code, "t")
    length = v.type.sizeof // T.sizeof
    V = v.address.cast(T.array(length-1).pointer()).dereference()
    items = list(float(V[i]) for i in range(length))
    return letter, length, items

class VecPrinter:
    def __init__(self, v):
        self.v = v
        self.letter, self.length, self.items = _vec_info(self.v)

    def children(self):
        for i, item in enumerate(self.items):
            yield (_vec_fields[i], item)

class MatPrinter:
    def __init__(self, v):
        self.v = v

    def children(self):
        V = self.v["value"]
        for i in range(V.type.range()[1] + 1):
            yield ("[{}]".format(i), V[i])

def build_pretty_printer():
    pp = gdb.printing.RegexpCollectionPrettyPrinter("glm")
    pp.add_printer("glm::vec", "^glm::vec<\d, [^<>]*, \(glm::qualifier\)0>", VecPrinter)
    pp.add_printer("glm::mat", "^glm::mat<\d, \d, [^<>]*, \(glm::qualifier\)0>", MatPrinter)
    return pp

gdb.printing.register_pretty_printer(gdb.current_objfile(), build_pretty_printer())

