# Study — JSP/Servlet 게시판으로 배우는 자바

자바 처음인 프론트엔드 개발자가 **라이브 코딩으로 게시판을 만들면서** 꼭 알아야 할
자바 언어 기능을 익히기 위한 학습 폴더. 기준 교재는 **자바의 정석**.

## 어떻게 진행하나

- **이슈 1개 = PR 1개 = 스터디 노트 1개**. 한 PR에서 자바 개념 하나에 집중한다.
- 작업 순서: 이슈 선택 → 노트의 "알아야 할 것 / 고민할 것"을 **코딩 전에 먼저 적고** →
  라이브 코딩하며 갱신 → PR → squash merge → "회고" 채움.
- 노트 템플릿은 [`_template.md`](./_template.md). 복사해서 `notes/issue-NN-<slug>.md`로 만든다.
- 장별 핵심 자바 요약은 [`java-essentials.md`](./java-essentials.md)에 누적한다.

## 이슈 ↔ 노트 ↔ 자바의 정석 매핑

| # | 이슈 | 자바의 정석 장 | 핵심 자바 | 노트 |
|---|------|---------------|-----------|------|
| 1 | DB 스키마 + DDL | (SQL) | 자료형↔컬럼, PK/FK | |
| 2 | DB 연결 정리 | 8장 예외처리 | try-with-resources, static/final | |
| 3 | VO 클래스 | 6장 OOP I | 클래스·생성자·캡슐화 | |
| 4 | DAO 목록 조회 | 11·12·4장 | List, 제네릭, while 반복 | |
| 5 | 목록 화면 | 4장 반복문 | forward, JSTL forEach, String 자르기 | |
| 6 | 검색 | 9장 String | PreparedStatement, 동적 쿼리 | |
| 7 | 페이징 | 3·4장 | 나눗셈/나머지, 페이지 번호 반복 | |
| 8 | 등록 + 유효성검증 | 9장 정규식 | Pattern/matches, 메서드 분리 | |
| 9 | 보기 + 조회수 | 10장 날짜·형식화 | LocalDateTime, 포맷 | |
| 10 | 비번 확인 + 수정 | 9장 String | equals vs ==, UPDATE | |
| 11 | 삭제 | 8장 예외 | 트랜잭션 맛보기, DELETE | |
| 12 | 댓글 | 11·10장 | 1:N, 컬렉션 반복 | |
| 13 | 파일 업로드/다운로드 | 15장 I/O | 스트림, Part API | |
| 14 | (리팩터) FrontController | 7·12장 | 인터페이스·다형성, Map 라우팅 | |

> 노트를 만들 때마다 위 "노트" 칸에 `[issue-NN](./notes/issue-NN-...md)` 링크를 채운다.

## 환경

환경 셋업(Gradle / Tomcat / MySQL Docker / `run.sh`) 정리는 [`00-setup.md`](./00-setup.md).
