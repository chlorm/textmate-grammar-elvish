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

// https://macromates.com/manual/en/language_grammars
// https://www.sublimetext.com/docs/3/syntax.html
// https://sublime-text-unofficial-documentation.readthedocs.io/en/sublime-text-2/reference/syntaxdefs.html
{
  new(nameString):: {
    assert std.isString(nameString),
    name: nameString,

    FileType(s):: self {
      assert std.isString(s),
      fileTypes+: [s],
    },

    Name(s):: self {
      assert std.isString(s),
      name: s,
    },

    Pattern(patternObject):: self {
      assert std.isObject(patternObject),
      patterns+: [patternObject],
    },

    Repository(p):: self {
      assert std.isObject(p),
      repository+: p,
    },

    ScopeName(s):: self {
      assert std.isString(s),
      scopeName: s,
    },

    Uuid(s):: self {
      assert std.isString(s),
      uuid+: [s],
    },
  },

  capture:: {
    new(index):: {
      assert std.isNumber(index),

      Name(string):: self {
        assert std.isString(string),
        [std.toString(index)]: {
          name: string,
        },
      },
    },
  },

  pattern:: {
    new():: {
      Begin(s):: self {
        assert std.isString(s),
        begin: s,
      },

      BeginCapture(captureObject):: self {
        assert std.isObject(captureObject),
        beginCaptures+: captureObject,
      },

      Capture(captureObject):: self {
        assert std.isObject(captureObject),
        captures+: captureObject,
      },

      Comment(s):: self {
        assert std.isString(s),
        comment: s,
      },

      ContentName(s):: self {
        assert std.isString(s),
        contentName: s,
      },

      End(s):: self {
        assert std.isString(s),
        end: s,
      },

      EndCapture(captureObject):: self {
        assert std.isObject(captureObject),
        endCaptures+: captureObject,
      },

      Include(s):: self {
        assert std.isString(s),
        assert !std.startsWith(s, '#'),
        include: '#' + s,
      },

      Match(s):: self {
        assert std.isString(s),
        match: s,
      },

      // Scope
      Name(s):: self {
        assert std.isString(s),
        name: s,
      },

      Pattern(patternObject):: self {
        assert std.isObject(patternObject),
        patterns+: [patternObject],
      },
    },
  },

  repository:: {
    new(repositoryPropertyName):: {
      assert std.isString(repositoryPropertyName),

      Pattern(patternObject):: self {
        assert std.isObject(patternObject),
        [repositoryPropertyName]: patternObject,
      },
    },
  },

  // https://macromates.com/manual/en/language_grammars
  // https://www.sublimetext.com/docs/3/scope_naming.html
  scope:: {
    comment:: 'comment',
    commentLine:: self.comment + '.line',
    commentLineDoubleSlash:: self.commentLine + '.double-slash',
    commentLineDoubleDash:: self.commentLine + '.double-dash',
    commentLineNumberSign:: self.commentLine + '.number-sign',
    commentLinePercentage:: self.commentLine + '.percentage',
    commentBlock:: self.comment + '.block',
    commentBlockDocumentation:: self.commentBlock + '.documentation',
    constant:: 'constant',
    constantNumeric:: self.constant + '.numeric',
    constantNumericComplex:: self.constantNumeric + '.complex',
    constantNumericComplexImaginary:: self.constantNumericComplex + '.imaginary',
    constantNumericComplexReal:: self.constantNumericComplex + '.real',
    constantNumericFloat:: self.constantNumeric + '.float',
    constantNumericFloatBinary:: self.constantNumericFloat + '.binary',
    constantNumericFloatDecimal:: self.constantNumericFloat + '.decimal',
    constantNumericFloatHexidecimal:: self.constantNumericFloat + '.hexidecimal',
    constantNumericFloatOctal:: self.constantNumericFloat + '.octal',
    constantNumericFloatOther:: self.constantNumericFloat + '.other',
    constantNumericInteger:: self.constantNumeric + '.integer',
    constantNumericIntegerBinary:: self.constantNumericInteger + '.binary',
    constantNumericIntegerDecimal:: self.constantNumericInteger + '.decimal',
    constantNumericIntegerHexadecimal:: self.constantNumericInteger + '.hexidecimal',
    constantNumericIntegerOctal:: self.constantNumericInteger + '.octal',
    constantNumericIntegerOther:: self.constantNumericInteger + '.other',
    constantCharacter:: self.constant + '.character',
    constantCharacterEscape:: self.constantCharacter + '.escape',
    constantLanguage:: self.constant + '.language',
    constantOther:: self.constant + '.other',
    constantOtherPlaceholder:: self.constantOther + '.placeholder',
    entity:: 'entity',
    entityName:: self.entity + '.name',
    entityNameClass:: self.entityName + '.class',
    entityNameClassForwardDecl:: self.entityNameClass + '.forward-decl',
    entityNameConstant:: self.entityName + '.constant',
    entityNameEnum:: self.entityName + '.enum',
    entityNameFunction:: self.entityName + '.function',
    entityNameFunctionConstructor:: self.entityNameFunction + '.constructor',
    entityNameFunctionDeconstructor:: self.entityNameFunction + '.deconstructor',
    entityNameImpl:: self.entityName + '.impl',
    entityNameInterface:: self.entityName + '.interface',
    entityNameLabel:: self.entityName + '.label',
    entityNameNamespace:: self.entityName + '.namespace',
    entityNameSection:: self.entityName + '.section',
    entityNameStruct:: self.entityName + '.struct',
    entityNameTag:: self.entityName + '.tag',
    entityNameTrait:: self.entityName + '.trait',
    entityNameType:: self.entityName + '.type',
    entityNameUnion:: self.entityName + '.union',
    entityOther:: self.entity + '.other',
    entityOtherInheritedClass:: self.entityOther + '.inherited-class',
    entityOtherAttributeName:: self.entityOther + '.attribute-name',
    invalid:: 'invalid',
    invalidIllegal:: self.invalid + '.illegal',
    invalidDeprecated:: self.invalid + '.deprecated',
    keyword:: 'keyword',
    keywordControl:: self.keyword + '.control',
    keywordControlConditional:: self.keywordControl + '.conditional',
    keywordControlImport:: self.keywordControl + '.import',
    keywordDeclaration:: self.keyword + '.declaration',
    keywordDeclarationClass:: self.keywordDeclaration + '.class',
    keywordDeclarationEnum:: self.keywordDeclaration + '.enum',
    keywordDeclarationFunction:: self.keywordDeclaration + '.function',
    keywordDeclarationImpl:: self.keywordDeclaration + '.impl',
    keywordDeclarationInterface:: self.keywordDeclaration + '.interface',
    keywordDeclarationStruct:: self.keywordDeclaration + '.struct',
    keywordDeclarationTrait:: self.keywordDeclaration + '.trait',
    keywordDeclarationType:: self.keywordDeclaration + '.type',
    keywordDeclarationUnion:: self.keywordDeclaration + '.union',
    keywordOperator:: self.keyword + '.operator',
    keywordOperatorArithmetic:: self.keywordOperator + '.arithmetic',
    keywordOperatorAssignment:: self.keywordOperator + '.assignment',
    keywordOperatorBitwise:: self.keywordOperator + '.bitwise',
    keywordOperatorComparison:: self.keywordOperator + '.comparison',  // unofficial
    keywordOperatorLogical:: self.keywordOperator + '.logical',
    keywordOperatorWord:: self.keywordOperator + '.word',
    keywordOther:: self.keyword + '.other',
    markup:: 'markup',
    markupDeleted:: self.markup + '.deleted',
    markupUnderline:: self.markup + '.underline',
    markupUnderlineLink:: self.markupUnderline + '.link',
    markupBold:: self.markup + '.bold',
    markupHeading:: self.markup + '.heading',
    markupInserted:: self.markup + '.inserted',
    markupItalic:: self.markup + '.italic',
    markupList:: self.markup + '.list',
    markupListNumbered:: self.markupList + '.numbered',
    markupListUnnumbered:: self.markupList + '.unnumbered',
    markupQuote:: self.markup + '.quote',
    markupRaw:: self.markup + '.raw',
    markupRawBlock:: self.markupRaw + '.block',
    markupRawInline:: self.markupRaw + '.inline',
    markupOther:: self.markup + '.other',
    meta:: 'meta',
    metaAnnotation:: self.meta + '.annotation',
    metaAnnotationIdentifier:: self.metaAnnotation + '.identifier',
    metaAnnotationPrameters:: self.metaAnnotation + '.parameters',
    metaBlock:: self.meta + '.block',
    metaBraces:: self.meta + '.braces',
    metaBrackets:: self.meta + '.brackets',
    metaClass:: self.meta + '.class',
    metaEnum:: self.meta + '.enum',
    metaFunction:: self.meta + '.function',
    metaFunctionCall:: self.meta + '.function-call',
    metaFunctionParameters:: self.metaFunction + '.parameters',
    metaFunctionReturnType:: self.metaFunction + '.return-type',
    metaGroup:: self.meta + '.group',
    metaImpl:: self.meta + '.impl',
    metaInterface:: self.meta + '.interface',
    metaInterploation:: self.meta + '.interpolation',
    metaNamespace:: self.meta + '.namespace',
    metaParagraph:: self.meta + '.paragraph',
    metaParens:: self.meta + '.parens',
    metaPath:: self.meta + '.path',
    metaPreprocessor:: self.meta + '.preprocessor',
    metaString:: self.meta + '.string',
    metaStruct:: self.meta + '.struct',
    metaTag:: self.meta + '.tag',
    metaTocList:: self.meta + '.toc-list',
    metaTrait:: self.meta + '.trait',
    metaType:: self.meta + '.type',
    metaUnion:: self.meta + '.union',
    punctuation:: 'punctuation',
    punctuationAccessor:: self.punctuation + '.accessor',
    punctuationDefinition:: self.punctuation + '.definition',
    punctuationDefinitionAnnotation:: self.punctuationDefinition + '.annotation',
    punctuationDefinitionComment:: self.punctuationDefinition + '.comment',
    punctuationDefinitionKeyword:: self.punctuationDefinition + '.keyword',
    punctuationDefinitionString:: self.punctuationDefinition + '.string',
    punctuationDefinitionStringBegin:: self.punctuationDefinitionString + '.begin',
    punctuationDefinitionStringEnd:: self.punctuationDefinitionString + '.end',
    punctuationDefinitionVariable:: self.punctuationDefinition + '.variable',
    punctuationSection:: self.punctuation + '.section',
    punctuationSectionBlock:: self.punctuationSection + '.block',
    punctuationSectionBlockBegin:: self.punctuationSectionBlock + '.begin',
    punctuationSectionBlockEnd:: self.punctuationSectionBlock + '.end',
    punctuationSectionBraces:: self.punctuationSection + '.braces',
    punctuationSectionBracesBegin:: self.punctuationSectionBraces + '.begin',
    punctuationSectionBracesEnd:: self.punctuationSectionBraces + '.end',
    punctuationSectionBrackets:: self.punctuationSection + '.brackets',
    punctuationSectionBracketsBegin:: self.punctuationSectionBrackets + '.begin',
    punctuationSectionBracketsEnd:: self.punctuationSectionBrackets + '.end',
    punctuationSectionGroup:: self.punctuationSection + '.group',
    punctuationSectionGroupBegin:: self.punctuationSectionGroup + '.begin',
    punctuationSectionGroupEnd:: self.punctuationSectionGroup + '.end',
    punctuationSectionParens:: self.punctuationSection + '.parens',
    punctuationSectionParensBegin:: self.punctuationSectionParens + '.begin',
    punctuationSectionParensEnd:: self.punctuationSectionParens + '.end',
    punctuationSeparator:: self.punctuation + '.separator',
    punctuationSeparatorContinuation:: self.punctuationSeparator + '.continuation',
    punctuationSeparatorDecimal:: self.punctuationSeparator + '.decimal',
    punctuationTerminator:: self.punctuation + '.terminator',
    source:: 'source',
    //source.<language-suffix>.embedded
    storage:: 'storage',
    storageType:: self.storage + '.type',
    storageTypeClass:: self.storageType + '.class',
    storageTypeEnum:: self.storageType + '.enum',
    storageTypeFunction:: self.storageType + '.function',
    storageTypeImpl:: self.storageType + '.impl',
    storageTypeInterface:: self.storageType + '.interface',
    storageTypeKeyword:: self.storageType + '.keyword',
    storageTypeStruct:: self.storageType + '.struct',
    storageTypeTrait:: self.storageType + '.trait',
    storageTypeUnion:: self.storageType + '.union',
    storageModifier:: self.storage + '.modifier',
    string:: 'string',
    stringQuoted:: self.string + '.quoted',
    stringQuotedDouble:: self.stringQuoted + '.double',
    stringQuotedOther:: self.stringQuoted + '.other',
    stringQuotedSingle:: self.stringQuoted + '.single',
    stringQuotedTriple:: self.stringQuoted + '.triple',
    stringRegexp:: self.string + '.regexp',
    support:: 'support',
    supportClass:: self.support + '.class',
    supportConstant:: self.support + '.constant',
    supportFunction:: self.support + '.function',
    supportModule:: self.support + '.module',
    supportNSApp:: self.support + '.NSApp',
    supportNSLog:: self.support + '.NSLog',
    supportOther:: self.support + '.other',
    supportType:: self.support + '.type',
    supportVariable:: self.support + '.variable',
    text:: 'text',
    textHtml:: self.text + '.html',
    textXml:: self.text + '.xml',
    variable:: 'variable',
    variableAnnotation:: self.variable + '.annotation',
    variableFunction:: self.variable + '.function',
    variableLanguage:: self.variable + '.language',
    variableLanguageArray:: self.variableLanguage + '.array',
    variableOther:: self.variable + '.other',
    variableOtherConstant:: self.variableOther + '.constant',
    variableOtherLanguage:: self.variableOther + '.language',
    variableOtherMember:: self.variableOther + '.member',
    variableOtherParameter:: self.variableOther + '.parameter',
    variableOtherReadWrite:: self.variableOther + '.readwrite',
    variableParameter:: self.variable + '.parameter',
  },
}
