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

// These are top-level includes for elements that make up the elvish language.
textmate.repository.new(common.id.expression)
.Pattern(
  textmate.pattern.new()
  .Pattern(textmate.pattern.new().Include(common.id.commandSubstitution))
  .Pattern(textmate.pattern.new().Include(common.id.comments))
  .Pattern(textmate.pattern.new().Include(common.id.controlFlow))
  .Pattern(textmate.pattern.new().Include(common.id.functions))
  .Pattern(textmate.pattern.new().Include(common.id.lambda))
  .Pattern(textmate.pattern.new().Include(common.id.lineContinuation))
  .Pattern(textmate.pattern.new().Include(common.id.map))
  .Pattern(textmate.pattern.new().Include(common.id.mapKeyValue))
  .Pattern(textmate.pattern.new().Include(common.id.modules))
  .Pattern(textmate.pattern.new().Include(common.id.numbers))
  .Pattern(textmate.pattern.new().Include(common.id.operators))
  .Pattern(textmate.pattern.new().Include(common.id.redirections))
  .Pattern(textmate.pattern.new().Include(common.id.strings))
  .Pattern(textmate.pattern.new().Include(common.id.variables))
)
