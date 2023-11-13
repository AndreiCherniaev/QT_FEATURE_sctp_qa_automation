################################################################################
#
# smilebrd_serv
#
################################################################################

SMILEBRD_SERV_VERSION = v2.0
LIBFOO_SITE = http://www.foosoftware.org/download

define SMILEBRD_SERV_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)
endef

define SMILEBRD_SERV_INSTALL_TARGET_CMDS
	# on SBC there is root only so NO chmod rules are needed $(INSTALL) -D -m 0755 $(@D)/smilebrd_serv $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
