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
local stringQuotedSingle = 'stringQuotedSingle';
local stringQuotedDouble = 'stringQuotedDouble';

textmate.repository.new(stringQuotedSingle)
.Pattern(
  textmate.pattern.new()
  .Name(textmate.scope.metaString + scope + ' ' + textmate.scope.stringQuotedSingle + scope)
  .Begin("'")
  .BeginCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationDefinitionStringBegin + scope)
  )
  /* Double single quotes `''` is a builtin escape for a single quote. */
  .End("'(?!')")
  .EndCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationDefinitionStringEnd + scope)
  )
  /* Escapes sequence */
  .Pattern(
    textmate.pattern.new()
    .Name(textmate.scope.constantCharacterEscape + scope)
    .Match("''")
  )
)
+
textmate.repository.new(stringQuotedDouble)
.Pattern(
  textmate.pattern.new()
  .Name(textmate.scope.metaString + scope + ' ' + textmate.scope.stringQuotedDouble + scope)
  .Begin('"')
  .BeginCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationDefinitionStringBegin + scope)
  )
  .End('"')
  .EndCapture(
    textmate.capture.new(0)
    .Name(textmate.scope.punctuationDefinitionStringEnd + scope)
  )
  /* Escapes sequences */
  .Pattern(
    textmate.pattern.new()
    .Name(textmate.scope.constantCharacterEscape + scope)
    .Match(
      '\\\\(' + std.join('|', [
        /* Single character escapes */
        '[\\"\\\\abfnrtv]',
        /* Octal */
        '[0-7]{3}',
        /* Unicode code point */
        '[c^].',
        /* Unicode code point 2 digit hex */
        'x[0-9a-fA-F]{2}',
        /* Unicode code point 4 digit hex */
        'u[0-9a-fA-F]{4}',
        /* Unicode code point 8 digit hex */
        'U[0-9a-fA-F]{8}',
      ]) +
      ')'
    )
  )
)
+
textmate.repository.new(common.id.strings)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(stringQuotedSingle))
  .Pattern(textmate.pattern.new().Include(stringQuotedDouble))
)
