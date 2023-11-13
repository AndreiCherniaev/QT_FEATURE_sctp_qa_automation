cmake_minimum_required(VERSION 3.18)
include_guard(GLOBAL)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR i386) #https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html

# set MyBaseDir to FULL PATH to QT_QEMU_qa_automation/Qt_themself/
cmake_path(SET MyBaseDir "${CMAKE_CURRENT_LIST_DIR}")

cmake_path(SET TARGET_SYSROOT  ${MyBaseDir}/../myBuildroot/buildroot/output/host/i586-buildroot-linux-gnu/sysroot/ NORMALIZE)


set(CMAKE_SYSROOT ${TARGET_SYSROOT})

#set(ENV{PKG_CONFIG_PATH} $PKG_CONFIG_PATH:/usr/lib/x86_64-linux-gnu/pkgconfig)  #set(ENV{PKG_CONFIG_PATH} $PKG_CONFIG_PATH:/usr/lib/pkgconfig) 
#set(ENV{PKG_CONFIG_LIBDIR} /usr/lib/pkgconfig:/usr/share/pkgconfig/:${TARGET_SYSROOT}/usr/lib/x86_64-linux-gnu/pkgconfig:${TARGET_SYSROOT}/usr/lib/pkgconfig)
#set(ENV{PKG_CONFIG_SYSROOT_DIR} ${CMAKE_SYSROOT})

cmake_path(SET CMAKE_C_COMPILER ${MyBaseDir}/../myBuildroot/buildroot/output/host/bin/i586-buildroot-linux-gnu-gcc NORMALIZE)
# set(CMAKE_C_COMPILER  ${MyBaseDir}/../myBuildroot/buildroot/output/host/bin/i586-buildroot-linux-gnu-gcc)

cmake_path(SET CMAKE_CXX_COMPILER ${MyBaseDir}/../myBuildroot/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++ NORMALIZE)
# set(CMAKE_CXX_COMPILER ${MyBaseDir}/../myBuildroot/buildroot/output/host/bin/i586-buildroot-linux-gnu-g++)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -I${TARGET_SYSROOT}/usr/include") #no effect with/without: -mno-sse2
set(CMAKE_CXX_FLAGS "${CMAKE_C_FLAGS}") #no effect with/without: -mno-sse2


#set(QT_COMPILER_FLAGS "-march=i386 -mno-sse2 -mfpmath=387")
#set(QT_COMPILER_FLAGS_RELEASE "-O2 -pipe -march=i386 -mno-sse2 ")
set(QT_COMPILER_FLAGS "-march=i386 -mno-sse2") #no effect with/without: -mno-sse -mfpmath=387  -mno-sse3 -mno-sse4 -mno-sse4.1 -mno-sse4.2 -mno-sse4a -mno-ssse3 -mno-avx -mno-sse2
set(QT_COMPILER_FLAGS_RELEASE "-O2 -pipe")
set(QT_LINKER_FLAGS "-Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
set(CMAKE_BUILD_RPATH ${TARGET_SYSROOT})

#set(CMAKE_GENERATOR "Ninja")
#can't off this set(FEATURE_pcre2 OFF)
set(FEATURE_opengl OFF)
set(FEATURE_ico OFF)
set(FEATURE_xcb OFF)
set(FEATURE_xcb_xlib OFF)
set(QT_FEATURE_network ON)
set(FEATURE_sctp ON) # sudo apt install libsctp-dev https://stackoverflow.com/questions/53137250/netinet-sctp-h-no-such-file-or-directory
set(QT_FEATURE_widgets OFF)
set(QT_FEATURE_dbus OFF)
set(QT_FEATURE_dbus_linked OFF)
set(QT_FEATURE_gui OFF)
set(FEATURE_sqlmodel OFF)
set(FEATURE_sql OFF)
#new in _host.cmake file
set(FEATURE_androiddeployqt OFF)
set(testlib OFF)
set(X11_SUPPORTED OFF) # more https://bugreports.qt.io/browse/QTBUG-109028
set(FEATURE_c89 OFF)
set(FEATURE_c99 OFF)
set(FEATURE_c11 OFF)
set(FEATURE_pkg_config OFF)
set(FEATURE_testlib OFF)
set(FEATURE_translation OFF)
set(FEATURE_xml OFF)
set(FEATURE_backtrace ON)
#new new
set(FEATURE_animation OFF)
set(FEATURE_intelcet OFF)
set(BUILD_WITH_PCH OFF)
#set(FEATURE_x86intrin OFF)
#build static Qt 
set(BUILD_SHARED_LIBS OFF) #Build Qt statically (OFF) or dynamically (ON)
set(FEATURE_static ON)
#no qmake
set(FEATURE_qmake OFF)

#dummy old PC like>>>
set(FEATURE_sse2 OFF)
set(FEATURE_sse3 OFF)
set(FEATURE_ssse3 OFF)
set(FEATURE_sse4_1 OFF)
set(FEATURE_sse4_2 OFF)

set(FEATURE_avx OFF)
set(FEATURE_avx2 OFF)
set(FEATURE_avx512bw OFF)
set(FEATURE_avx512cd OFF)
set(FEATURE_avx512dq OFF)
set(FEATURE_avx512er OFF)
set(FEATURE_avx512f OFF)
set(FEATURE_avx512ifma OFF)
set(FEATURE_avx512pf OFF)
set(FEATURE_avx512vbmi OFF)
set(FEATURE_avx512vbmi2 OFF)
set(FEATURE_avx512vl OFF)

#set(FEATURE_shani OFF)
#set(FEATURE_sha3_fast OFF)
#set(QT_FEATURE_f16c OFF)
#set(FEATURE_rdrnd OFF)


#set(FEATURE_cxx2b ON)
#set(FEATURE_std_atomic64 OFF)
set(BUILD_WITH_PCH ON)
#set(FEATURE_cborstreamreader OFF)
#set(FEATURE_cborstreamwriter OFF)
#set(FEATURE_clock_gettime OFF)
#set(FEATURE_clock_monotonic OFF)
#set(FEATURE_commandlineparser OFF)
#set(FEATURE_concatenatetablesproxymodel OFF)
#set(FEATURE_concurrent OFF)

#set(FEATURE_datestring OFF)
#set(FEATURE_datetimeparser OFF)
#set(FEATURE_doubleconversion OFF)
#set(FEATURE_easingcurve OFF)
#set(FEATURE_enable_new_dtags OFF)
#set(FEATURE_eventfd OFF)
#set(FEATURE_filesystemiterator OFF)
#set(FEATURE_filesystemwatcher OFF)

#set(FEATURE_forkfd_pidfd OFF)
#set(FEATURE_futimens OFF)
#set(FEATURE_future OFF)
#set(FEATURE_gc_binaries OFF)
#set(FEATURE_gestures OFF)
#set(FEATURE_getauxval OFF)
#set(FEATURE_getentropy OFF)

#set(FEATURE_glib OFF)
#set(FEATURE_glibc OFF)

#set(FEATURE_hijricalendar OFF)
set(FEATURE_icu OFF)
#set(FEATURE_identityproxymodel OFF)
#set(FEATURE_inotify OFF)
#set(FEATURE_islamiccivilcalendar OFF)
#set(FEATURE_itemmodel OFF)
#set(FEATURE_jalalicalendar OFF)
#set(FEATURE_largefile OFF)
#set(FEATURE_linkat OFF)
#set(FEATURE_mimetype OFF)
#set(FEATURE_mimetype_database OFF)
#set(FEATURE_pcre2 OFF)
#set(FEATURE_poll_ppoll OFF)
#set(FEATURE_posix_fallocate OFF)
#set(FEATURE_process OFF)
#set(FEATURE_processenvironment OFF)
set(FEATURE_proxymodel OFF)
#set(FEATURE_rdseed OFF)
#set(FEATURE_reduce_exports OFF)
#set(FEATURE_reduce_relocations OFF)
#set(FEATURE_regularexpression OFF)
#set(FEATURE_renameat2 OFF)
#set(FEATURE_settings OFF)
#set(FEATURE_sharedmemory OFF)
#set(FEATURE_shortcut OFF)
#set(FEATURE_signaling_nan OFF)
#set(FEATURE_sortfilterproxymodel OFF)
#set(FEATURE_stack_protector_strong ON)

#set(FEATURE_statx OFF)
#set(FEATURE_stringlistmodel OFF)
#set(FEATURE_system_zlib OFF)
#set(FEATURE_systemsemaphore OFF)
#set(FEATURE_temporaryfile OFF)
#set(FEATURE_textdate OFF)
#set(FEATURE_thread OFF)
#set(FEATURE_threadsafe_cloexec OFF)
#set(FEATURE_timezone OFF)
#set(FEATURE_transposeproxymodel OFF)
#set(FEATURE_xmlstream OFF)
#set(FEATURE_xmlstreamreader OFF)
#set(FEATURE_xmlstreamwriter OFF)

#set(FEATURE_futimes OFF)

#set(QT_FEATURE_alloca OFF)
#set(QT_FEATURE_alloca_h OFF)
#set(QT_FEATURE_dladdr OFF)
#set(QT_FEATURE_dlopen OFF) #helps to understand about sse2
set(QT_FEATURE_easingcurve OFF)
#dummy old PC like<<<


set(CMAKE_C_FLAGS_INIT "static")
set(CMAKE_CXX_FLAGS_INIT "static")
set(CMAKE_BUILD_TYPE "Release")
#prefix_path_add(PREFIX /usr/lib/x86_64-linux-gnu/cmake GLOB_RECURSE '*.cmake') 
set(HOST_TOOLSPATH ${MyBaseDir}/build_host/qtbase/lib/cmake/) 
set(Qt6HostInfo_DIR ${HOST_TOOLSPATH}/Qt6HostInfo)
set(Qt6CoreTools_DIR ${HOST_TOOLSPATH}/Qt6CoreTools)
#set(md4c_DIR /usr/lib/x86_64-linux-gnu/cmake/md4c)
set(Qt6WidgetsTools_DIR ${HOST_TOOLSPATH}/Qt6WidgetsTools)
set(Qt6GuiTools_DIR ${HOST_TOOLSPATH}/Qt6GuiTools)
#i disable gut and widgets, why they throw warning???
#set(Qt6Gui_DIR ${HOST_TOOLSPATH}/Qt6Gui)
#set(Qt6Widgets_DIR ${HOST_TOOLSPATH}/Qt6Widgets)

#set(Qt6HostInfo_DIR /home/a/QtFromGit/build_host/qtbase/lib/cmake/)
set(QT_HOST_PATH ${MyBaseDir}/build_artifacts_host/bin/)

include(CMakeInitializeConfigs)

function(cmake_initialize_per_config_variable _PREFIX _DOCSTRING)
  if (_PREFIX MATCHES "CMAKE_(C|CXX|ASM)_FLAGS")
    set(CMAKE_${CMAKE_MATCH_1}_FLAGS_INIT "${QT_COMPILER_FLAGS}")
        
    foreach (config DEBUG RELEASE MINSIZEREL RELWITHDEBINFO)
      if (DEFINED QT_COMPILER_FLAGS_${config})
        set(CMAKE_${CMAKE_MATCH_1}_FLAGS_${config}_INIT "${QT_COMPILER_FLAGS_${config}}")
      endif()
    endforeach()
  endif()


  if (_PREFIX MATCHES "CMAKE_(SHARED|MODULE|EXE)_LINKER_FLAGS")
    foreach (config SHARED MODULE EXE)
      set(CMAKE_${config}_LINKER_FLAGS_INIT "${QT_LINKER_FLAGS}")
    endforeach()
  endif()

  _cmake_initialize_per_config_variable(${ARGV})
endfunction()
