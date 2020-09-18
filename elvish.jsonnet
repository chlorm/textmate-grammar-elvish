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

local common = import 'common.libsonnet';
local textmate = import 'github.com/chlorm/jsonnet-textmate-grammar/textmate.libsonnet';

local elvishSyntax =
  textmate.new('Elvish')
  .FileType('elv')
  .ScopeName('source.elvish')
  .Pattern(
    textmate.pattern.new()
    .Include(common.id.expression)
  )
  .Repository(import 'patterns/command-substitution.libsonnet')
  .Repository(import 'patterns/comments.libsonnet')
  .Repository(import 'patterns/control-flow.libsonnet')
  .Repository(import 'patterns/expression.libsonnet')
  .Repository(import 'patterns/functions.libsonnet')
  .Repository(import 'patterns/lambda.libsonnet')
  .Repository(import 'patterns/line-continuation.libsonnet')
  .Repository(import 'patterns/map.libsonnet')
  .Repository(import 'patterns/modules.libsonnet')
  .Repository(import 'patterns/numbers.libsonnet')
  .Repository(import 'patterns/operators.libsonnet')
  .Repository(import 'patterns/redirections.libsonnet')
  .Repository(import 'patterns/strings.libsonnet')
  .Repository(import 'patterns/variables.libsonnet');

{
  'elvish.tmLanguage.json': std.manifestJson(elvishSyntax),
  // FIXME: I don't think anything consumes yaml textmate files.
  //'elvish.tmLanguage.yaml': std.manifestYamlDoc(elvishSyntax),
}
