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

textmate.repository.new(common.id.mapKeyValue)
.Pattern(
  textmate.pattern.new()
  .Begin('(&)(?=' + common.bareChar + "|['\"\\$])")
  .BeginCapture(
    textmate.capture.new(1)
    // FIXME: determine correct scope
    .Name(textmate.scope.keywordOther + scope)
    //.Name(textmate.scope.punctuationDefinitionKeyword + scope)
  )
  .End('(?<=' + common.bareChar + "|['\"])(=?)")
  .EndCapture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordOperatorAssignment + scope)
  )
  /* NOTE: this re-implements a subset of strings */
  .Pattern(
    textmate.pattern.new()
    .Name(textmate.scope.variableParameter + scope)
    .Begin("'")
    .End("'(?!')")
    .Pattern(
      textmate.pattern.new()
      .Name(textmate.scope.constantCharacterEscape + scope)
      .Match("''")
    )
  )
  .Pattern(
    textmate.pattern.new()
    .Name(textmate.scope.variableParameter + scope)
    .Begin('"')
    .End('"')
    .Pattern(
      textmate.pattern.new()
      .Name(textmate.scope.constantCharacterEscape + scope)
      .Match('\\\\"')
    )
  )
  // Bare word
  .Pattern(
    textmate.pattern.new()
    .Name(textmate.scope.variableParameter + scope)
    .Match('(\\$)?' + common.bareWord)
  )
)
+
textmate.repository.new(common.id.map)
.Pattern(
  textmate.pattern.new()
  .Name(textmate.scope.metaBrackets + scope)
  .Begin('\\[')
  .BeginCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationSectionBracketsBegin + scope)
  )
  .End('\\]')
  .EndCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationSectionBracketsEnd + scope)
  )
  // Match K/V before initialization character
  .Pattern(textmate.pattern.new().Include(common.id.mapKeyValue))
  // Initialize empty map
  .Pattern(
    textmate.pattern.new()
    .Match('(&)')
    .Capture(
      textmate.capture.new(1)
      .Name(textmate.scope.keywordOther + scope)
    )
  )
  // Range
  .Pattern(
    textmate.pattern.new()
    .Match('(\\.\\.)(?=' + common.bareChar + '|[\\]])')
    .Capture(
      textmate.capture.new(1)
      .Name(textmate.scope.keywordOther + scope)
    )
  )
  .Pattern(textmate.pattern.new().Include(common.id.map))  // self
  .Pattern(textmate.pattern.new().Include(common.id.commandSubstitution))
  .Pattern(textmate.pattern.new().Include(common.id.lambda))
  .Pattern(textmate.pattern.new().Include(common.id.numbers))
  .Pattern(textmate.pattern.new().Include(common.id.operators))
  .Pattern(textmate.pattern.new().Include(common.id.strings))
  .Pattern(textmate.pattern.new().Include(common.id.variables))
)
