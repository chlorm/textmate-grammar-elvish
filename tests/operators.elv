# SYNTAX TEST "source.elvish" "operators"

var x
# <--- keyword.operator.assignment.elvish
set x
# <--- keyword.operator.assignment.elvish
x = x
# ^ keyword.operator.assignment.elvish

+
# <- keyword.operator.arithmetic.elvish
-
# <- keyword.operator.arithmetic.elvish
/
# <- keyword.operator.arithmetic.elvish
*
# <- keyword.operator.arithmetic.elvish
%
# <- keyword.operator.arithmetic.elvish

# FIXME:
{}+

and
# <--- keyword.operator.logical.elvish
or
# <-- keyword.operator.logical.elvish
not
# <--- keyword.operator.logical.elvish

is
# <- keyword.operator.comparison.elvish
not-eq
# <------ keyword.operator.comparison.elvish
>
# <- keyword.operator.comparison.elvish
>=
# <-- keyword.operator.comparison.elvish
>=s
# <--- keyword.operator.comparison.elvish
<
# <- keyword.operator.comparison.elvish
<=
# <-- keyword.operator.comparison.elvish
<=s
# <--- keyword.operator.comparison.elvish
!=
# <-- keyword.operator.comparison.elvish
!=s
# <--- keyword.operator.comparison.elvish
==
# <-- keyword.operator.comparison.elvish
==s
# <--- keyword.operator.comparison.elvish

module:is
#      ^^ - keyword.operator.comparison.elvish

~/.
# <~- - keyword.operator.comparison.elvish

~/*.elv
# ^ keyword.other.elvish

# FIXME:
https://
#     ^^ - keyword.operator.arithmetic.elvish

https://github.com
#     ^^ - keyword.operator.comparison.elvish

[*]
# <~- keyword.other.elvish

[*/ asdf]
# ^ - keyword.operator.arithmetic.elvish

()/
# ^ - keyword.operator.arithmetic.elvish
