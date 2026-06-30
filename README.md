# eBrainSoft 포트폴리오 스터디 — 1주차 게시판 (JSP/Servlet)

프론트엔드 개발자가 **풀스택으로 넘어가기 위해** 백엔드를 바닥부터 직접 만들어 보는 회사 스터디.
1주차는 JSP/Servlet + Model-2 MVC + JDBC로 게시판을 구현한다.
요구사항: 리포 루트의 `[eBrainSoft] Study - Board Wireframe V1.1.pdf`.

## 이 스터디에 임하는 방식

저는 React/Next 기반 프론트엔드 개발자입니다. DB(Firebase·Supabase·MongoDB)와 API 연동은
다뤄봤지만, **서버 단을 자바로 직접 작성하는 건 처음**입니다. 그래서 이번 스터디는
"동작하는 걸 만든다"보다 **백엔드와 자바 언어 자체를 제대로 이해하는 것**에 무게를 둡니다.

- **라이브 코딩으로 배우며 진행** — 프레임워크의 자동화에 기대지 않고 Servlet·JDBC를 손으로 작성해
  요청 → 처리 → DB → 응답의 흐름을 직접 겪는다.
- **자바의 정석을 기준으로** 꼭 필요한 자바 기능(반복문·예외처리·컬렉션·제네릭·I/O 등)을
  기능 구현과 엮어 익힌다.
- **이슈 1개 = PR 1개 = 학습 노트 1개.** 한 PR에서 자바 개념 하나에 집중하고,
  배운 것과 고민한 것을 [`study/`](./study) 폴더에 기록한다.
- MVC는 화면별 서블릿으로 시작해 마지막에 FrontController(Command 패턴)로 리팩터링하면서
  인터페이스·다형성을 체득한다.

진행 현황과 이슈↔자바 개념 매핑은 [`study/README.md`](./study/README.md) 참고.

## 풀스택 로드맵 (스터디 전체)

| 주차 | 주제 | 스택 |
|---|---|---|
| **1주차 (현재)** | JSP/Servlet 게시판, Model-2 MVC | Servlet, JSP, JDBC, MySQL |
| 2주차 | SpringBoot 게시판 | SpringBoot, MyBatis, MySQL |
| 3주차 | API + 프론트 분리 | SpringBoot REST API, React(Next), nginx |
| 4주차 | 게시판 포털 서비스 | SpringBoot MPA / React(Next) SPA |

같은 게시판을 스택을 바꿔 가며 여러 번 만들면서, 프론트에서 백엔드까지 한 줄기로 잇는 것이 목표.

---

## 기술 스택 (1주차)

- **JDK 17**
- **Jakarta Servlet API 6.0** (Jakarta EE 10)
- **Apache Tomcat 10.1+** (Tomcat 9 이하 불가 — `jakarta.servlet` 패키지 사용)
- **Gradle 8.14.3** (Wrapper 포함)
- **MySQL 8.0** (Docker)
- **MySQL Connector/J 9.3.0**
- **JUnit 5.12.2**

## 사전 준비

### 1. JDK 17 설치
### 2. Docker Desktop 설치
https://www.docker.com/products/docker-desktop/

### 3. Apache Tomcat 10.1+ 설치
https://tomcat.apache.org/download-10.cgi

## MySQL 실행 (Docker Compose)

```bash
cd docker
docker-compose up -d
```

| 항목 | 값 |
|---|---|
| Host | `localhost` |
| Port | `3308` (컨테이너 내부 3306 매핑) |
| Database | `ebrainsoft_study` |
| User / Password | `ebsoft` / `ebsoft` |
| Root Password | `admin!32` |
| Charset | `utf8mb4` / `utf8mb4_unicode_ci` |

## 빌드 & 실행

```bash
# WAR 빌드 → build/libs/eb-study-template-1week-1.0-SNAPSHOT.war
./gradlew build

# 테스트
./gradlew test

# 클린
./gradlew clean
```

생성된 WAR를 Tomcat 10.1+ `webapps/`에 배포하거나, 로컬에서는 `./run.sh`로
빌드 → 배포 → 톰캣 재시작을 한 번에 실행한다 (`http://localhost:8080/study/`).
