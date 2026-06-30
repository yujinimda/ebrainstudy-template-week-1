#!/bin/bash
# 빌드 → WAR 배포 → 톰캣 재시작을 한 번에 실행하는 스크립트
# 사용법:  ./run.sh
set -e

PROJECT_DIR="$(cd "$(dirname "$0")" && pwd)"
TOMCAT_HOME="/opt/homebrew/opt/tomcat/libexec"
WAR_NAME="study"   # → http://localhost:8080/study/

cd "$PROJECT_DIR"

echo "1/4  WAR 빌드 중..."
./gradlew build -q

echo "2/4  톰캣 정지(켜져 있으면)..."
"$TOMCAT_HOME/bin/catalina.sh" stop 2>/dev/null || true
sleep 2

echo "3/4  WAR 배포..."
WAR_FILE=$(ls build/libs/*.war | head -1)
rm -rf "$TOMCAT_HOME/webapps/${WAR_NAME}" "$TOMCAT_HOME/webapps/${WAR_NAME}.war"
cp "$WAR_FILE" "$TOMCAT_HOME/webapps/${WAR_NAME}.war"

echo "4/4  톰캣 시작..."
"$TOMCAT_HOME/bin/catalina.sh" start

echo ""
echo "✅ 완료!  →  http://localhost:8080/${WAR_NAME}/"
echo "   (끄려면:  $TOMCAT_HOME/bin/catalina.sh stop )"
