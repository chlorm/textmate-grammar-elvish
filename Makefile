JSONNET_CMD ?= jsonnet
VSCODE_TMGRAMMAR_TEST_CMD ?= "./node_modules/.bin/vscode-tmgrammar-test"
GRAMMAR_FILE ?= elvish.tmLanguage

build-deps:
	test -x $$(type -P jsonnet)

build: build-deps
	$(JSONNET_CMD) \
		--jpath vendor/ \
		--multi . \
		--string \
		elvish.jsonnet

test-deps:
	test -x $$(type -P ./node_modules/.bin/vscode-tmgrammar-test)

test-deps-install:
	npm install --global-style vscode-tmgrammar-test

tests: build test-deps
	$(VSCODE_TMGRAMMAR_TEST_CMD) \
		--grammar elvish.tmLanguage.json \
		--scope source.elvish \
		--testcases 'tests/*.elv'
