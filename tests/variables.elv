# SYNTAX TEST "source.elvish" "variables"

$nil
# <- constant.language.elvish punctuation.definition.variable.elvish
# <~--- constant.language.elvish
(
$nil
# <- meta.parens.elvish constant.language.elvish punctuation.definition.variable.elvish
# <~--- meta.parens.elvish constant.language.elvish
)
{
$nil
# <- meta.braces.elvish constant.language.elvish punctuation.definition.variable.elvish
# <~--- meta.braces.elvish constant.language.elvish
}

$nilx
# <---- - constant.language.elvish

x$nil
# <~- constant.language.elvish punctuation.definition.variable.elvish
# <~~--- constant.language.elvish

$E:ROOT
# <- constant.language.elvish punctuation.definition.variable.elvish
# <~- constant.language.elvish

$var
# <- punctuation.definition.variable.elvish
# <~--- variable.other.readwrite.elvish
(
$var
# <- punctuation.definition.variable.elvish
# <~--- variable.other.readwrite.elvish
)
{
$var
# <- punctuation.definition.variable.elvish
# <~--- variable.other.readwrite.elvish
}

$var~
# <~--- variable.other.readwrite.elvish
#   ^ storage.modifier.elvish
$~var
# <~~--- - variable.other.readwrite.elvish

@rest

$@rest

$true
$false
