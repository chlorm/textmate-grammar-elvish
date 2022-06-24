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
local keywordOperatorArithmetic = 'keywordOperatorArithmetic';
local keywordOperatorComparison = 'keywordOperatorComparison';
local keywordOperatorLogical = 'keywordOperatorLogical';
local keywordOther = 'keywordOther';
local keywordOperatorAssignment = 'keywordOperatorAssignment';

local operatorCommand(a) =
  '(?<!' + common.bareChar + '|[+*/&)\\]}])' + '(' + std.join('|', a) + ')\\s';

local operatorChar(a) = '(' + std.join('|', a) + ')';

textmate.repository.new(keywordOperatorArithmetic)
.Pattern(
  textmate.pattern.new()
  .Match(operatorCommand([
    '\\+',
    '\\-',
    '\\/',
    '\\*',
    '\\%',
  ]) + '(?![\\]})])')
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOperatorArithmetic + scope)
  )
)
+
textmate.repository.new(keywordOperatorComparison)
.Pattern(
  textmate.pattern.new()
  .Match(operatorCommand([
    'eq',
    'is',
    'not-eq',
    '<s?',
    '>s?',
    '<=s?',
    '>=s?',
    '\\!=s?',
    '==s?',
  ]))
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOperatorComparison + scope)
  )
)
+
textmate.repository.new(keywordOperatorLogical)
.Pattern(
  textmate.pattern.new()
  .Match(operatorCommand([
    'and',
    'coalesce',
    'or',
    'not',
  ]))
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOperatorLogical + scope)
  )
)
+
// FIXME: some are not operators
textmate.repository.new(keywordOther)
.Pattern(
  textmate.pattern.new()
  .Match(operatorChar([
    ';',  // FIXME: move to control flow
    '\\|',
    '\\?',
    '&',
    '\\*',
  ]))
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOther + scope)
  )
)
+
textmate.repository.new(keywordOperatorAssignment)
.Pattern(
  textmate.pattern.new()
  .Match(
    '(' + operatorCommand(['set', 'var']) + '|' + operatorChar(['='],) + ')'
  )
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOperatorAssignment + scope)
  )
)
+
textmate.repository.new(common.id.operators)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(keywordOperatorArithmetic))
  .Pattern(textmate.pattern.new().Include(keywordOperatorComparison))
  .Pattern(textmate.pattern.new().Include(keywordOperatorLogical))
  .Pattern(textmate.pattern.new().Include(keywordOther))
  // NOTE: must come after comparison operators
  .Pattern(textmate.pattern.new().Include(keywordOperatorAssignment))
)
