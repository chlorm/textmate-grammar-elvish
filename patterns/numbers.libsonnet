// Copyright (c) 2020, Cody Opel <cwopel@chlorm.net>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

local common = import '../common.libsonnet';
local textmate = import 'github.com/chlorm/jsonnet-textmate-grammar/textmate.libsonnet';

local scope = '.elvish';
local constantNumericFloatDecimal = 'constantNumericFloatDecimal';
local constantNumericIntegerBinary = 'constantNumericIntegerBinary';
local constantNumericIntegerDecimal = 'constantNumericIntegerDecimal';
local constantNumericIntegerHexadecimal = 'constantNumericIntegerHexadecimal';
local constantNumericIntegerOctal = 'constantNumericIntegerOctal';

local behind =
  '(?:' +
  '(?<=[.]{2})' +
  '|' +
  '(?<!' + common.bareChar + ')' +
  ')';
// Elvish range uses `..` so negate matching float, then double negate
// a second range period so that integers still work in ranges.
local ahead = '(?!' + '[.](?![.])' + '|' + std.strReplace(common.bareChar, '.', '') + '|[>])';
local sign = '[+-]?';
// Disallow leading and trailing underscores.
local digit = '(?:[\\d]|(?<=[\\d])[_](?=[\\d]))+';

// TODO: scientific, Inf, NaN, underscores

textmate.repository.new(constantNumericFloatDecimal)
.Pattern(
  textmate.pattern.new()
  .Match(
    behind +
    '(' +
    sign + '(?:' +
    /* ?.0 */
    '(?:' + digit + ')?\\.' + digit +
    '|' +
    /* 0.? */
    digit + '\\.(?:' + digit + ')?' +
    ')' +
    ')' + ahead
  )
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantNumericFloatDecimal + scope)
  )
)
+
textmate.repository.new(constantNumericIntegerBinary)
.Pattern(
  textmate.pattern.new()
  .Match(behind + '(' + sign + '0[bB][0-1]+)' + ahead)
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantNumericIntegerBinary + scope)
  )
)
+
textmate.repository.new(constantNumericIntegerDecimal)
.Pattern(
  textmate.pattern.new()
  .Match(behind + '(' + sign + digit + ')' + ahead)
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantNumericIntegerDecimal + scope)
  )
)
+
textmate.repository.new(constantNumericIntegerHexadecimal)
.Pattern(
  textmate.pattern.new()
  .Match(behind + '(' + sign + '0[xX][0-9a-fA-F]+)' + ahead)
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantNumericIntegerHexadecimal + scope)
  )
)
+
textmate.repository.new(constantNumericIntegerOctal)
.Pattern(
  textmate.pattern.new()
  .Match(behind + '(' + sign + '0[oO][0-7]{3})' + ahead)
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantNumericIntegerOctal + scope)
  )
)
+
textmate.repository.new(common.id.numbers)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(constantNumericIntegerBinary))
  .Pattern(textmate.pattern.new().Include(constantNumericIntegerHexadecimal))
  .Pattern(textmate.pattern.new().Include(constantNumericIntegerOctal))
  .Pattern(textmate.pattern.new().Include(constantNumericFloatDecimal))
  .Pattern(textmate.pattern.new().Include(constantNumericIntegerDecimal))
)
