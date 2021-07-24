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
local builtinNamespace = 'builtinNamespace';
local namespaces = 'namespaces';
local use = 'use';

// TODO: local: up: storage.modifier

local builtinNamespaces = [
  'builtin',
  'e',
  'E',  // FIXME: storage.modifier
  'edit',
  'epm',
  'file',
  'local',
  'math',
  'path',
  'platform',
  're',
  'readline-binding',
  'store',
  'str',
  'unix',
];

textmate.repository.new(builtinNamespace)
.Pattern(
  textmate.pattern.new()
  .Match('(\\$?)(' + std.join('|', builtinNamespaces) + ')(:)')
  .Capture(
    textmate.capture.new(1)
    // FIXME: decide if this should be a constant or something else
    .Name(textmate.scope.constantLanguage + scope + ' ' +
          textmate.scope.entityNameNamespace + scope + ' ' +
          textmate.scope.punctuationDefinitionVariable + scope)
  )
  .Capture(
    textmate.capture.new(2)
    .Name(textmate.scope.constantLanguage + scope + ' ' +
          textmate.scope.entityNameNamespace + scope)
  )
  .Capture(
    textmate.capture.new(3)
    .Name(textmate.scope.punctuationAccessor + scope)
  )
)
+
textmate.repository.new(namespaces)
.Pattern(
  textmate.pattern.new()
  .Match('(\\$?)(' + common.bareWord + ')(:)')
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.entityNameNamespace + scope + ' ' +
          textmate.scope.punctuationDefinitionVariable + scope)
  )
  .Capture(
    textmate.capture.new(2)
    .Name(textmate.scope.entityNameNamespace + scope)
  )
  .Capture(
    textmate.capture.new(3)
    .Name(textmate.scope.punctuationAccessor + scope)
  )
)
+
textmate.repository.new(use)
.Pattern(
  textmate.pattern.new()
  //.Name(textmate.scope.metaStatementImport + scope)
  // FIXME:
  .Name(textmate.scope.meta + '.statement.import' + scope)
  .Match(
    common.negateBehind +
    '(use)\\s+' +
    /* Module import path */
    '(' + common.bareWord + ')' +
    /* Optional alias */
    '((?:\\s+)' + common.bareWord + ')?'
  )
  .Capture(
    textmate.capture.new(1)
    .Name(textmate.scope.keywordControlImport + scope)
  )
  .Capture(
    textmate.capture.new(2)
  )
  .Capture(
    textmate.capture.new(3)
  )
)
+
textmate.repository.new(common.id.modules)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(builtinNamespace))
  .Pattern(textmate.pattern.new().Include(namespaces))
  .Pattern(textmate.pattern.new().Include(use))
)
