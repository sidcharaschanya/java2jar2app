# No spaces (.java)
MAIN_FILE="MainFile.java"

# No spaces (.jar)
JAR_NAME="JarName.jar"




JAVA_HOME=`/usr/libexec/java_home -v 1.8.0`

${JAVA_HOME}/bin/javac $MAIN_FILE
echo ""
echo "compiled ${MAIN_FILE}"

${JAVA_HOME}/bin/jar cmf 2manifest.mf $JAR_NAME *
echo ""
echo "created ${JAR_NAME} from all files in folder and 2manifest.mf"
echo ""
