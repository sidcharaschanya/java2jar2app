# No spaces
MAIN_CLASS="MainClass"

# No spaces (.jar)
JAR_NAME="JarName.jar"

# Spaces are allowed
APP_NAME="App Name"

# Spaces are allowed, must be .icns file
ICON_FILE="Icon File.icns"




JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

# https://docs.oracle.com/javase/8/docs/technotes/tools/unix/javapackager.html
echo ""
${JAVA_HOME}/bin/javapackager \
  -deploy -Bruntime=${JAVA_HOME} \
  -Bicon="${ICON_FILE}" \
  -native image \
  -srcdir . \
  -srcfiles $JAR_NAME \
  -outdir 2release \
  -outfile "${APP_NAME}.app" \
  -appclass $MAIN_CLASS \
  -name "${APP_NAME}" \
  -title "${APP_NAME}" \
  -nosign \
  -v
echo ""
echo "If that succeeded, it created \"2release/bundles/${APP_NAME}.app\""
echo ""
