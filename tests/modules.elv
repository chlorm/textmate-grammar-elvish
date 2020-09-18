# SYNTAX TEST "source.elvish" "modules"

use github.com/org/repo/mod-ule alias asdf
# <--- keyword.control.import.elvish
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.import.elvish
#                               ^^^^^ meta.statement.import.elvish
#                                    ^^^^ - meta.statement.import.elvish

-use a
# <~--- - keyword.control.import.elvish

{
use github.com/org/repo/mod-ule alias asdf
# <--- keyword.control.import.elvish
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.statement.import.elvish
#                               ^^^^^ meta.statement.import.elvish
#                                    ^^^^ - meta.statement.import.elvish
}

module:func
# <------ entity.name.namespace.elvish
#     ^ punctuation.accessor.elvish

$module:var
# <- punctuation.definition.variable.elvish
# <~------ entity.name.namespace.elvish
#      ^ punctuation.accessor.elvish

# FIXME:
$E:HOME