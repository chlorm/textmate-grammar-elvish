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
local builtinVariables = 'builtinVariables';
local variableAccess = 'variableAccess';
local restArgs = 'restArgs';

local variables = [
  '_',
  'after-chdir',
  'args',
  'before-chdir',
  'ok',
  'nil',
  'num-bg-jobs',
  'notify-bg-job-access',
  'paths',
  'pid',
  'pwd',
  'value-out-indicator',
  'true',
  'false',
];

// FIXME: decide variable.other.constant or constant.language
textmate.repository.new(builtinVariables)
.Pattern(
  textmate.pattern.new()
  .Comment('Builtin variables')
  .Match('(\\$)(' + std.join('|', variables) + ')' + common.negateAhead)
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.constantLanguage + scope + ' ' +
          textmate.scope.punctuationDefinitionVariable + scope)
  )
  .Capture(
    textmate.capture.new(2)
    .Name(textmate.scope.constantLanguage + scope)
    //.Name(textmate.scope.variableOtherConstant + scope)
  )
)
+
textmate.repository.new(variableAccess)
.Pattern(
  textmate.pattern.new()
  .Match('(\\$)(@?)(' + common.bareWord + ')([~?]|[.][.][.])?')
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.punctuationDefinitionVariable + scope)
  )
  .Capture(
    textmate.capture.new(2)
    .Name(textmate.scope.variableLanguageArray + scope)
  )
  .Capture(
    textmate.capture.new(3)
    .Name(textmate.scope.variableOtherReadWrite + scope)
  )
  .Capture(
    textmate.capture.new(4)
    // FIXME:
    .Name('storage.modifier' + scope)
  )
)
+
textmate.repository.new(restArgs)
.Pattern(
  textmate.pattern.new()
  .Match('(@)(' + common.bareWord + ')')
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.variableLanguageArray + scope)
  )
  .Capture(
    textmate.capture.new(2)
    .Name(textmate.scope.variableOtherReadWrite + scope)
  )
)
+
textmate.repository.new(common.id.variables)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(builtinVariables))
  .Pattern(textmate.pattern.new().Include(variableAccess))
  .Pattern(textmate.pattern.new().Include(restArgs))
)
