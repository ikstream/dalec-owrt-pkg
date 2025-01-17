include $(TOPDIR)/rules.mk

PKG_NAME:=dalec
PKG_VERSION:=0.1.0
PKG_RELEASE:=1
PKG_MAINTAINER:=Stefan Venz <stefan.venz@protonmail.com>
PKG_LICENSE:=GPL-3.0+
PKG_LICENSE_FILES:=LICENSE

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=https://github.com/ikstream/dalec/archive/refs/tags/$(PKG_VERSION).tar.gz
PKG_HASH:=06e95bf4c181416351638dba98fbbfb36b10cf914d410296343179d030692338

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/dalec
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Data collection and transmission tool for usage statistics
  DEPENDS:=
  MAINTAINER:=Stefan Venz <stefan.venz@protonmail.com>
  PKGARCH:=all
endef

define Package/dalec/description
  Collects non personal identifiable data and transmitts them
  encrypted over the domain name system to remove sender information
endef

define Package/dalec/install
  $(INSTALL_DIR) $(1)/usr/sbin/dalec
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/dalec $(1)/usr/bin/
  $(INSTALL_BIN) $(PKG_BUILD_DIR)/tranmitt_data $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,dalec))
