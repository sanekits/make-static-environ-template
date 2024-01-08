inc/weasel.mk: ;
# Sample include file with static environ support.

#  HOWTO: this is how we hook into the static environment update.
#   1. Add a phony prereq for $(CfgFile)
#   2. Emit content and append to $(CfgFile)
#
#  When make reloads after updating the (flag)/environ.mk, anything
#  defined there will be stable and need not be recalculated, which
#  is why we call it 'static environment'.
$(CfgFile): .wzlcfg
.PHONY: .wzlcfg
.wzlcfg:
	@{
		echo "Hello=world"
		echo "Goodbye=again"
	} >> $(CfgFile)

FooTest:
	echo Static Hello=$(Hello)
