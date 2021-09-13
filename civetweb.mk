# This file is part of MXE. See LICENSE.md for licensing information.

PKG             		 := civetweb
$(PKG)_WEBSITE  		 := https://github.com/civetweb/civetweb
$(PKG)_DESCR    		 := Embedded C/C++ web server
$(PKG)_IGNORE   		 :=
$(PKG)_VERSION  		 := 1.15
$(PKG)_CHECKSUM 		 := 90a533422944ab327a4fbb9969f0845d0dba05354f9cacce3a5005fa59f593b9
$(PKG)_GH_CONF  		 := civetweb/civetweb/tags,v
$(PKG)_DEPS			     := zlib
#$(PKG)_DEPS_$(BUILD) := cmake

define $(PKG)_BUILD
		cd '$(1)' && \
			$(MAKE) -C '$(1)' lib WITH_IPV6=1 WITH_ZLIB=1 COPT="-DNDEBUG -DNO_CGI -DNO_SSL -DUSE_ZLIB" -j $(JOBS) && \
			$(MAKE) -C '$(1)' install-lib PREFIX='$(PREFIX)/$(TARGET)'
endef
