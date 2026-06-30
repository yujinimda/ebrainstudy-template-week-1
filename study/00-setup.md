# 00 — 환경 셋업 정리

게시판 기능을 만들기 전, 프로젝트가 어떤 조각으로 돌아가는지 정리.

## 기술 스택
- **JDK 17** / **Gradle 8.14.3**(Wrapper 포함, `./gradlew`)
- **Jakarta Servlet 6.0** (Tomcat 10.1+ 필요, `javax.servlet` 아님 → `jakarta.servlet`)
- **Apache Tomcat 10.1+** (WAR 배포 대상)
- **MySQL 8.0** (Docker, 포트 3308) / **MySQL Connector/J 9.3.0**

## 빌드 산출물
`./gradlew build` → `build/libs/eb-study-template-1week-1.0-SNAPSHOT.war`
이 WAR를 Tomcat `webapps/`에 넣으면 웹앱이 뜬다.

## MySQL 띄우기
```bash
cd docker && docker-compose up -d
```
| 항목 | 값 |
|---|---|
| Host / Port | `localhost` / `3308` |
| Database | `ebrainsoft_study` |
| User / Pass | `ebsoft` / `ebsoft` |

## 로컬 실행 (run.sh)
`./run.sh` = 빌드 → 톰캣 정지 → WAR 배포 → 톰캣 시작 을 한 번에.
- 배포 후 접속: `http://localhost:8080/study/`
- 톰캣 경로는 스크립트 상단 `TOMCAT_HOME`에서 조정(현재 `/opt/homebrew/opt/tomcat/libexec`).

## 프론트와 다른 점 (개념 정리)
- Node 서버 대신 **Tomcat(서블릿 컨테이너)** 이 요청을 받는다.
- 라우트 핸들러 대신 **Servlet** 클래스가 요청을 처리하고, **JSP** 가 화면을 그린다(서버 렌더).
- ORM/SDK 대신 **JDBC**(날 SQL)로 MySQL에 직접 붙는다 → 그래서 예외처리·자원반납을 직접 한다.

## 다음
[`README.md`](./README.md) 매핑 표의 이슈 #1(DB 스키마)부터 시작.
