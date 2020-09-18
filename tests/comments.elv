# SYNTAX TEST "source.elvish" "comments"

x # comment
# ^ comment.line.number-sign.elvish punctuation.definition.comment.elvish
#   ^^^^^^^ comment.line.number-sign.elvish

(
x # comment
# ^ meta.parens.elvish comment.line.number-sign.elvish punctuation.definition.comment.elvish
#   ^^^^^^^ meta.parens.elvish comment.line.number-sign.elvish
)

{
x # comment
# ^ meta.braces.elvish comment.line.number-sign.elvish punctuation.definition.comment.elvish
#   ^^^^^^^ meta.braces.elvish comment.line.number-sign.elvish
}