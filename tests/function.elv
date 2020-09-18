# SYNTAX TEST "source.elvish" "function"

fn func []{}
# <-- meta.function.elvish keyword.declaration.function.elvish
#  ^^^^ meta.function.elvish entity.name.function.elvish
#       ^ meta.function.elvish meta.brackets.elvish punctuation.section.brackets.begin.elvish
#        ^ meta.function.elvish meta.brackets.elvish punctuation.section.brackets.end.elvish
#         ^ meta.function.elvish meta.braces.elvish punctuation.section.braces.begin.elvish
#          ^ meta.function.elvish meta.braces.elvish punctuation.section.braces.end.elvish

fn func {
  fn func []{}
# ^^ meta.function.elvish keyword.declaration.function.elvish
}

-fn func []{}
# <~-- - meta.function.elvish keyword.declaration.function.elvish

all
# <--- support.function.elvish
(
all
# <--- meta.parens.elvish support.function.elvish
)
{
all
# <--- meta.braces.elvish support.function.elvish
}

(all)
# <~--- support.function.elvish

-all
# <~--- - support.function.elvish

all-
# <--- - support.function.elvish

xall
# <~--- - support.function.elvish

allx
# <--- - support.function.elvish

base64
# <------ - support.function.elvish

x=all
# ^^^ - support.function.elvish

-gc
## <--- support.function.elvish

--gc
# <~--- - support.function.elvish

-gc-
# <--- - support.function.elvish

to-json
# <------- support.function.elvish
