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
local builtinCommands = 'builtinCommands';
local functionDefinition = 'functionDefinition';

local commands = [
  'all',
  'assoc',
  'base',
  'bool',
  'cd',
  'constantly',
  'count',
  'del',
  'deprecate',
  'dir-history',
  'dissoc',
  'drop',
  'each',
  'eawk',
  'echo',
  'eval',
  'exec',
  'exit',
  'external',
  'fail',
  'fg',
  'float64',
  'from-json',
  'from-lines',
  'get-env',
  'has-env',
  'has-external',
  'has-key',
  'has-value',
  'keys',
  'kind-of',
  'make-map',
  'multi-error',
  'nop',
  'ns',
  'num',
  'one',
  'only-bytes',
  'only-values',
  'order',
  'peach',
  'pprint',
  'print',
  'printf',
  'put',
  'range',
  'rand',
  'randint',
  'read-line',
  'read-upto',
  'repeat',
  'repr',
  'resolve',
  'run-parallel',
  'search-external',
  'set-env',
  'show',
  'sleep',
  'slurp',
  'spawn',
  'styled',
  'styled-segment',
  'src',
  'take',
  'tilde-abbr',
  'time',
  'to-json',
  'to-lines',
  'to-string',
  'unset-env',
  'wcswidth',
  '-gc',
  '-ifaddrs',
  '-log',
  '-override-wcswidth',
  '-stack',
];

textmate.repository.new(builtinCommands)
.Pattern(
  textmate.pattern.new()
  .Match(
    common.negateBehind +
    '(' + std.join('|', commands) + ')' +
    common.negateAhead
  )
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.supportFunction + scope)
  )
)
+
textmate.repository.new(functionDefinition)
.Pattern(
  textmate.pattern.new()
  .Name(textmate.scope.metaFunction + scope)
  .Begin(common.negateBehind + '(fn)\\s+(' + common.bareWord + ')')
  .BeginCapture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordDeclarationFunction + scope)
  )
  .BeginCapture(
    textmate.capture.new(2)
    .Name(textmate.scope.entityNameFunction + scope)
  )
  .End('(?<=})')
  .Pattern(
    textmate.pattern.new()
    .Pattern(textmate.pattern.new().Include(common.id.map))
    .Pattern(textmate.pattern.new().Include(common.id.lambda))
  )
)
+
textmate.repository.new(common.id.functions)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(builtinCommands))
  .Pattern(textmate.pattern.new().Include(functionDefinition))
)
