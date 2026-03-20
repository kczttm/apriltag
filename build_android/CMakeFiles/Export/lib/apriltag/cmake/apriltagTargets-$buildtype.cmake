#----------------------------------------------------------------
# Generated CMake target import file for configuration "$BuildType".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "apriltag::apriltag" for configuration "$BuildType"
set_property(TARGET apriltag::apriltag APPEND PROPERTY IMPORTED_CONFIGURATIONS $BUILDTYPE)
set_target_properties(apriltag::apriltag PROPERTIES
  IMPORTED_LOCATION_$BUILDTYPE "${_IMPORT_PREFIX}/lib/libapriltag.so"
  IMPORTED_SONAME_$BUILDTYPE "libapriltag.so"
  )

list(APPEND _IMPORT_CHECK_TARGETS apriltag::apriltag )
list(APPEND _IMPORT_CHECK_FILES_FOR_apriltag::apriltag "${_IMPORT_PREFIX}/lib/libapriltag.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
