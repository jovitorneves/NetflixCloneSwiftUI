# Create build directory if it doesn't exist
mkdir -p "${PROJECT_DIR}/build"

# Generate device framework
xcodebuild archive -project "${PROJECT_DIR}/${PROJECT_NAME}.xcodeproj" \
-scheme "${PROJECT_NAME}" \
-archivePath "${PROJECT_DIR}/build/${PROJECT_NAME}-iphoneos.xcarchive" \
-sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
OTHER_SWIFT_FLAGS="-Onone -Xfrontend -empty-abi-descriptor"

# Generate simulator framework
xcodebuild archive -project "${PROJECT_DIR}/${PROJECT_NAME}.xcodeproj" \
-scheme "${PROJECT_NAME}" \
-archivePath "${PROJECT_DIR}/build/${PROJECT_NAME}-iossimulator.xcarchive" \
-sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
OTHER_SWIFT_FLAGS="-Onone -Xfrontend -empty-abi-descriptor"

# Generate xcframework for both architectures
xcodebuild -create-xcframework \
-framework "${PROJECT_DIR}/build/${PROJECT_NAME}-iphoneos.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" \
-debug-symbols "${PROJECT_DIR}/build/${PROJECT_NAME}-iphoneos.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" \
-framework "${PROJECT_DIR}/build/${PROJECT_NAME}-iossimulator.xcarchive/Products/Library/Frameworks/${PROJECT_NAME}.framework" \
-debug-symbols "${PROJECT_DIR}/build/${PROJECT_NAME}-iossimulator.xcarchive/dSYMs/${PROJECT_NAME}.framework.dSYM" \
-output "${PROJECT_DIR}/build/${PROJECT_NAME}-xcframework.xcframework"

# Open directory where xcframework was generated
open "${PROJECT_DIR}/build"
