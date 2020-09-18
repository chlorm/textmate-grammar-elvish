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

{
  bareChar:: '[a-zA-Z0-9_!%+,/@\\:.-]',
  bareWord:: self.bareChar + '+',
  // FIXME: try to drop equals here
  negateBehind:: '(?<!' + self.bareChar + '|[=])',
  negateAhead:: '(?!' + self.bareChar + ')',

  id:: {
    commandSubstitution:: 'commandSubstitution',
    comments:: 'comments',
    controlFlow:: 'controlFlow',
    expression:: 'expression',
    functions:: 'functions',
    lambda:: 'lambda',
    lineContinuation:: 'lineContinuation',
    map:: 'map',
    mapKeyValue:: 'mapKeyValue',
    modules:: 'modules',
    numbers:: 'numbers',
    operators:: 'operators',
    redirections:: 'redirections',
    strings:: 'strings',
    variables:: 'variables',
  },
}
