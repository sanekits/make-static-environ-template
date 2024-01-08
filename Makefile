# Makefile for TODO
SHELL=/bin/bash
.ONESHELL:
.SUFFIXES:
.SHELLFLAGS = -uec
MAKEFLAGS += --no-builtin-rules --no-print-directory
Config:
absdir := $(dir $(realpath $(lastword $(MAKEFILE_LIST))))
.PHONY: .maincfg
# TODO: change FlagName to something more meaningful?
FlagName=.flag-tmp
CfgFile=$(HOME)/$(FlagName)/environ.mk
$(CfgFile): $(dir $(CfgFile)) .maincfg $(MAKEFILE_LIST)
# TODO: include files can add prereqs to $(CfgFile) if they need to append
# to the static config.

-include $(CfgFile)

# TODO: list or wildcard your include files here:
include inc/weasel.mk




##  Generic Config target support:
Config: $(CfgFile)
	@cat $<
$(dir $(CfgFile)):
	@mkdir -p $@
.maincfg:
	@
	echo "# Updated $$(date -Iseconds) from $(abspath $(lastword $(MAKEFILE_LIST)))" >$(CfgFile)
Makefile: ;
