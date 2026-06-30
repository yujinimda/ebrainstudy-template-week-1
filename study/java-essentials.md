# 자바 핵심 (자바의 정석 장별, 이 프로젝트에서 쓰는 것만)

> 작업하면서 실제로 쓴 개념을 장별로 한 줄씩 누적한다. 교재 전체 요약이 아니라
> "게시판 만들 때 이건 꼭 알아야 했다"는 것만 모은다.

## 3장 — 연산자
- (페이징에서) `/`와 `%`로 총 페이지 수, offset 계산. 정수 나눗셈 주의.

## 4장 — 조건문과 반복문
- `while (rs.next())` 로 DB 결과를 한 줄씩 읽는다.
- 페이지 번호 출력, 검색 조건 분기 등에 `for`/`if`.

## 6장 — 객체지향 I (클래스)
- VO = 데이터 한 줄을 담는 클래스. 필드 + 생성자 + getter/setter.
- 캡슐화: 필드는 `private`, 접근은 메서드로.

## 7장 — 객체지향 II (상속·다형성·인터페이스)
- (리팩터에서) `Command` 인터페이스 + 구현체들을 다형성으로 한 곳에서 실행.

## 8장 — 예외처리
- JDBC는 `SQLException`을 던진다. `try-catch`, `try-with-resources`로 자원 자동 반납.
- `throws` 로 호출자에게 예외를 넘길지, 여기서 처리할지 판단.

## 9장 — java.lang / String
- `String` 비교는 `==`(주소) 아니라 `.equals()`(내용). 비번 검증의 함정.
- 제목 자르기, 검색어 처리에 `substring`, `length`, `trim`.
- 정규식 `Pattern` / `matches` 로 비번 규칙 검증.

## 10장 — 날짜와 시간 / 형식화
- `LocalDateTime`, 출력은 `DateTimeFormatter`(또는 `SimpleDateFormat`)로 포맷.

## 11장 — 컬렉션 프레임웍
- DAO 조회 결과는 `List<BoardVO>`(`ArrayList`)로 모은다.

## 12장 — 제네릭 / 열거형 / 애너테이션
- `List<BoardVO>` 의 `<>`가 제네릭. `@WebServlet` 이 애너테이션.
- 카테고리를 `enum`으로 둘지 고민(이슈 #1/#8).

## 15장 — 입출력(I/O)
- 파일 업로드/다운로드는 `InputStream`/`OutputStream` 바이트 스트림으로.
