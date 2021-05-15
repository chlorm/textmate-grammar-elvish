# SYNTAX TEST "source.elvish" "map"

[]
# <- meta.brackets.elvish punctuation.section.brackets.begin.elvish
# <~- meta.brackets.elvish punctuation.section.brackets.end.elvish
(
[]
# <- meta.brackets.elvish punctuation.section.brackets.begin.elvish
# <~- meta.brackets.elvish punctuation.section.brackets.end.elvish
)
{
[]
# <- meta.brackets.elvish punctuation.section.brackets.begin.elvish
# <~- meta.brackets.elvish punctuation.section.brackets.end.elvish
}

[&]
# <~- meta.brackets.elvish keyword.other.elvish

@rest
# <- variable.language.array.elvish
# <~---- variable.other.readwrite.elvish
[@rest]
# <~- variable.language.array.elvish
# ^^^^ variable.other.readwrite.elvish

[&key=value]
# <~-meta.brackets.elvish keyword.other.elvish
# ^^^ meta.brackets.elvish variable.parameter.elvish
#    ^ meta.brackets.elvish keyword.operator.assignment.elvish
[
  # Comment
# ^ meta.brackets.elvish comment.line.number-sign.elvish punctuation.definition.comment.elvish
#  ^^^^^^^^ meta.brackets.elvish comment.line.number-sign.elvish
]

&test
# <- keyword.other.elvish
# <~---- variable.parameter.elvish
&x-x
# <- keyword.other.elvish
# <~--- variable.parameter.elvish
&x='[=x'
# <- keyword.other.elvish
# <~- variable.parameter.elvish
# ^ keyword.operator.assignment.elvish
&'x'='x'
# <- keyword.other.elvish
# <~--- variable.parameter.elvish
#   ^ keyword.operator.assignment.elvish
&"x"='x'
# <- keyword.other.elvish
# <~--- variable.parameter.elvish
#   ^ keyword.operator.assignment.elvish
&''''='x'
# <- keyword.other.elvish
# <~---- variable.parameter.elvish
#    ^ keyword.operator.assignment.elvish
&"\""='x'
# <- keyword.other.elvish
# <~---- variable.parameter.elvish
#    ^ keyword.operator.assignment.elvish
&x-x='x'
# <- keyword.other.elvish
# <~--- variable.parameter.elvish
#   ^ keyword.operator.assignment.elvish
&$true='x'
# <- keyword.other.elvish
# <~----- variable.parameter.elvish
#     ^ keyword.operator.assignment.elvish
&-x-='x'
# <- keyword.other.elvish
# <~--- variable.parameter.elvish
#   ^ keyword.operator.assignment.elvish
&!!float64='x'
# <- keyword.other.elvish
# <~--------- variable.parameter.elvish
#         ^ keyword.operator.assignment.elvish

[&y=[&z=w]]
# <~- keyword.other.elvish
# ^ variable.parameter.elvish
#  ^ keyword.operator.assignment.elvish
#    ^ keyword.other.elvish
#     ^ variable.parameter.elvish
#      ^ keyword.operator.assignment.elvish

[..]
# <~-- meta.brackets.elvish keyword.other.elvish

[1..]
# <~~-- meta.brackets.elvish keyword.other.elvish

[1..2]
# <~~-- meta.brackets.elvish keyword.other.elvish

[..2]
# <~-- meta.brackets.elvish keyword.other.elvish

[..-1]
# <~-- meta.brackets.elvish keyword.other.elvish

[-1..]
# <~~~-- meta.brackets.elvish keyword.other.elvish
