all:

lint:
	@find apply push -type f -not -iname '*.*' | xargs shellcheck -s bash
	@find run lib -type f -not -iname '*.*' | xargs shellcheck -s dash
	@printf "\033[032mLINT OK\033[0m\n\n"

test: lint test-dash test-bash test-ksh

# Not included by default
test-ash:
	@echo "**************************************************"
	@echo "TEST BUSYBOX"
	@echo "Path is $$PATH"
	@cd test && busybox ash ./lib_test.sh
	@cd test && busybox ash ./run_test.sh

test-dash:
	@echo "**************************************************"
	@echo "TEST DASH"
	@cd test && dash ./lib_test.sh
	@cd test && dash ./run_test.sh

test-bash:
	@echo "**************************************************"
	@echo "TEST BASH"
	@cd test && bash ./lib_test.sh
	@cd test && bash ./run_test.sh

test-ksh:
	@echo "**************************************************"
	@echo "TEST KSH"
	@cd test && ksh ./lib_test.sh
	@cd test && ksh ./run_test.sh

.PHONY: lint test test-ash test-dash test-bash test-ksh
