# No spaces
MAIN_CLASS="MainClass"

# No spaces (.java)
MAIN_FILE="MainFile.java"

# No spaces (.jar)
JAR_NAME="JarName.jar"

# Spaces are allowed
APP_NAME="App Name"

# Spaces are allowed, must be .icns file
ICON_FILE="Icon File.icns"




JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

${JAVA_HOME}/bin/javac $MAIN_FILE
echo ""
echo "compiled ${MAIN_FILE}"

${JAVA_HOME}/bin/jar cmf 2manifest.mf $JAR_NAME *
echo ""
echo "created ${JAR_NAME} from all files in folder and 2manifest.mf"
echo ""

# https://docs.oracle.com/javase/8/docs/technotes/tools/unix/javapackager.html
${JAVA_HOME}/bin/javapackager \
  -deploy -Bruntime=${JAVA_HOME} \
  -Bicon="${ICON_FILE}" \
  -native image \
  -srcdir . \
  -srcfiles $JAR_NAME \
  -outdir 3release \
  -outfile "${APP_NAME}.app" \
  -appclass $MAIN_CLASS \
  -name "${APP_NAME}" \
  -title "${APP_NAME}" \
  -nosign \
  -v
echo ""
echo "If that succeeded, it created \"3release/bundles/${APP_NAME}.app\""
echo ""
