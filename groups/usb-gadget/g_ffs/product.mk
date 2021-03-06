# Set default USB interface
ifeq ($(TARGET_BUILD_VARIANT),user)
# Enable Secure Debugging
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
ifeq ($(BUILD_FOR_CTS_AUTOMATION),true)
# Build for automated CTS
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
endif #BUILD_FOR_CTS_AUTOMATION == true
endif #TARGET_BUILD_VARIANT == user

# Add Intel adb keys for userdebug/eng builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_COPY_FILES += $(INTEL_PATH_COMMON)/usb-gadget/adb_keys:root/adb_keys
# Enable Secure Debugging for userdebug
ifeq ($(TARGET_BUILD_VARIANT),userdebug) #userdebug
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif #userdebug
endif #userdebug/eng
