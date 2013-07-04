LOCAL_PATH := $(call my-dir)

## libkadm5srv_mit
include $(CLEAR_VARS)
LOCAL_MODULE := libkadm5srv_mit
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libkadm5srv_mit.a
include $(PREBUILT_STATIC_LIBRARY)

## libkdb5 
include $(CLEAR_VARS)
LOCAL_MODULE := libkdb5
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libkdb5.a
include $(PREBUILT_STATIC_LIBRARY)

## libkrb5_db2
include $(CLEAR_VARS)
LOCAL_MODULE := libkrb5_db2
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libkrb5_db2.a
include $(PREBUILT_STATIC_LIBRARY)

## libgssrpc
include $(CLEAR_VARS)
LOCAL_MODULE := libgssrpc
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libgssrpc.a
include $(PREBUILT_STATIC_LIBRARY)

## libgssapi_krb5
include $(CLEAR_VARS)
LOCAL_MODULE := libgssapi_krb5
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libgssapi_krb5.a
include $(PREBUILT_STATIC_LIBRARY)

## libkrb5
include $(CLEAR_VARS)
LOCAL_MODULE := libkrb5
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libkrb5.a
include $(PREBUILT_STATIC_LIBRARY)

## libk5crypto
include $(CLEAR_VARS)
LOCAL_MODULE := libk5crypto
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libk5crypto.a
include $(PREBUILT_STATIC_LIBRARY)

## libcom_err
include $(CLEAR_VARS)
LOCAL_MODULE := libcom_err
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libcom_err.a
include $(PREBUILT_STATIC_LIBRARY)

## libkrb5support
include $(CLEAR_VARS)
LOCAL_MODULE := libkrb5support
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libkrb5support.a
include $(PREBUILT_STATIC_LIBRARY)

## libcyassl
include $(CLEAR_VARS)
LOCAL_MODULE := libcyassl
LOCAL_SRC_FILES := ../kerberos-library/jni/lib/libcyassl.a
include $(PREBUILT_STATIC_LIBRARY)

## Kerberos 
include $(CLEAR_VARS)

LOCAL_MODULE     := kerberosapp
LOCAL_MODULE_FILENAME := libkerberosapp
LOCAL_C_INCLUDES := $(LOCAL_PATH) \
                    $(LOCAL_PATH)/../kerberos-library/jni/ \
                    $(LOCAL_PATH)/../kerberos-library/jni/include \
                    $(LOCAL_PATH)/../kerberos-library/jni/kinit \
                    $(LOCAL_PATH)/../kerberos-library/jni/kinit/include \
                    $(LOCAL_PATH)/../kerberos-library/jni/klist/include \
                    $(LOCAL_PATH)/../kerberos-gssapi/native
LOCAL_SRC_FILES  := ../kerberos-library/jni/kerberosapp.c \
                    ../kerberos-library/jni/kinit/kinit.c \
                    ../kerberos-library/jni/kinit/kinit_kdb.c \
                    ../kerberos-library/jni/klist/klist.c \
                    ../kerberos-library/jni/kvno/kvno.c \
                    ../kerberos-library/jni/kdestroy/kdestroy.c \
                    ../kerberos-gssapi/native/gsswrapper_wrap.c

#LOCAL_CFLAGS     := -DHAVE_CONFIG_H -DNO_MAIN_DRIVER -DNDEBUG -DNO_HC128 -DNO_PSK -Wall -Wno-unused -DTHREAD_SAFE
## For additional shadow warnings, use -Wshadow -Wmissing-format-attribute
LOCAL_CFLAGS     := -DKRB5_DEPRECATED=1 -DKRB5_PRIVATE -DANDROID -fno-common -Wall -Wcast-align -Wmissing-prototypes -Wno-format-zero-length -Woverflow -Wstrict-overflow -Wmissing-prototypes -Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-function -Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas -Wsign-compare -Werror=uninitialized -Werror=declaration-after-statement -Werror=variadic-macros -Werror-implicit-function-declaration -Wstrict-aliasing -Wpointer-arith -Waddress
LOCAL_LDLIBS     := -llog

##LOCAL_STATIC_LIBRARIES := libkrb5 libcom_err libkadm5srv libkdb5 libk5crypto libkrb5support
LOCAL_STATIC_LIBRARIES := libkadm5srv_mit libkdb5 libkrb5_db2 libgssrpc libgssapi_krb5 libkrb5 libk5crypto libcom_err libkrb5support libcyassl

LOCAL_SHARED_LIBRARIES := kerberosapp

include $(BUILD_SHARED_LIBRARY)