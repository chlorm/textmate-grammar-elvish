# SYNTAX TEST "source.elvish" "strings"

'x'
# <- meta.string.elvish string.quoted.single.elvish punctuation.definition.string.begin.elvish
# <~- meta.string.elvish string.quoted.single.elvish
# ^ meta.string.elvish string.quoted.single.elvish punctuation.definition.string.end.elvish

'x''x'
# ^^ meta.string.elvish string.quoted.single.elvish constant.character.escape.elvish

"x"
# <- meta.string.elvish string.quoted.double.elvish punctuation.definition.string.begin.elvish
# <~- meta.string.elvish string.quoted.double.elvish
# ^ meta.string.elvish string.quoted.double.elvish punctuation.definition.string.end.elvish

"x\c@x"
# ^^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\^@x"
# ^^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\"x"
# ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\\x"
# ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\ax"
# ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\nx"
# ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\040x"
# ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\x32x"
# ^^^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\u0020x"
# ^^^^^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\U00000020x"
# ^^^^^^^^^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

# FIXME: is this a valid escape
"x\e]0;"
## ^^ meta.string.elvish string.quoted.double.elvish constant.character.escape.elvish

"x\yx"
# ^^ - constant.character.escape.elvish
