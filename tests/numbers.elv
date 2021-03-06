# SYNTAX TEST "source.elvish" "numbers"

1
# <- constant.numeric.integer.decimal.elvish
(
1
# <- constant.numeric.integer.decimal.elvish
)
{
1
# <- constant.numeric.integer.decimal.elvish
}

-1
# <-- constant.numeric.integer.decimal.elvish

+1
# <-- constant.numeric.integer.decimal.elvish

[1..2]
# <~- constant.numeric.integer.decimal.elvish
# <~~~~- constant.numeric.integer.decimal.elvish
[-1..-2]
# <~-- constant.numeric.integer.decimal.elvish
# <~~~~~- constant.numeric.integer.decimal.elvish

1.2
# <--- constant.numeric.float.decimal.elvish
(
1.2
# <--- constant.numeric.float.decimal.elvish
)
{
1.2
# <--- constant.numeric.float.decimal.elvish
}

-1.2
# <---- constant.numeric.float.decimal.elvish

+1.2
# <---- constant.numeric.float.decimal.elvish

1.
# <-- constant.numeric.float.decimal.elvish

.2
# <-- constant.numeric.float.decimal.elvish

8.8.8.8
# <------- - constant.numeric.float.decimal.elvish

pkcs11
#   ^^ - constant.numeric.integer.decimal.elvish

0xaaaa
# <------ constant.numeric.integer.hexidecimal.elvish
(0xaaaa)
# <~------ constant.numeric.integer.hexidecimal.elvish
{0xaaaa}
# <~------ constant.numeric.integer.hexidecimal.elvish

0o072
# <----- constant.numeric.integer.octal.elvish

0b0110
# <------ constant.numeric.integer.binary.elvish

10_00
# <----- constant.numeric.integer.decimal.elvish

_
# <- - constant.numeric.integer.decimal.elvish

3_
# <-- - constant.numeric.integer.decimal.elvish

_3
# <-- - constant.numeric.integer.decimal.elvish