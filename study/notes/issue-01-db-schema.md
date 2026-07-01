# Issue 01 — DB 스키마 설계 + DDL

> 관련 이슈: #3 · 자바의 정석 (SQL 위주, 자바 코드 없음)

## 무엇을 만드나
게시판 데이터를 담을 테이블 구조(스키마)를 설계하고 `CREATE TABLE` SQL(DDL)로 작성.
`docker/initdb/01-schema.sql` 로 두고, docker-compose가 최초 기동 시 자동 실행하게 마운트.

## 알아야 할 개념
- **스키마** = 데이터를 어떻게 저장할지 정의한 설계도. 어떤 테이블 / 각 컬럼의 타입·제약 / 테이블 간 관계(FK)까지.
  - MySQL에선 "schema"가 "database"와 같은 뜻으로도 쓰임 (우리 `ebrainsoft_study`).
- **관계형 vs NoSQL**: Mongo/Firebase는 스키마리스(문서에 아무 필드나). 관계형은 구조를 미리 확정하고 그 틀에 맞는 데이터만.
- **PK(기본키)** = 각 행의 고유 번호(board_id). `AUTO_INCREMENT`로 자동 부여.
- **FK(외래키)** = 다른 테이블의 PK를 가리키는 컬럼. 관계를 "컬럼 값"으로 표현. board.category_id → category.category_id.
- **1:N 관계** = 한 글에 댓글·첨부가 여러 개 → 별도 테이블로 분리하고 board_id로 연결. (한 컬럼에 여러 개 못 담음)
- **첨부파일 이름 2개**: original_name(사용자 원본, 표시·다운로드용) / stored_name(서버 저장용 고유이름, 충돌·보안 방지).
- **타입 매핑**: INT(정수), BIGINT(큰 정수·파일크기), VARCHAR(n)(가변 문자열), DATETIME(일시).

## 고민해봐야 할 것 (함정)
- **"인덱스"라는 말이 두 가지**: PK(행 식별) vs 검색 인덱스(성능). 이번엔 PK만, 성능 인덱스는 나중.
- **비밀번호 평문 저장**: 스터디라 평문. 실무는 해시(BCrypt) → 그래서 password는 VARCHAR(100)로 여유.
- **updated_at 자동갱신 함정**: MySQL `ON UPDATE CURRENT_TIMESTAMP`를 걸면 조회수 +1(UPDATE)에도 수정일이 바뀜. 그래서 자동 안 걸고, 글 수정 때만 직접 갱신할 것.
- **initdb는 최초 1회만**: `/docker-entrypoint-initdb.d`의 스크립트는 데이터 폴더가 비었을 때(=DB 첫 생성)만 실행됨. 이미 뜬 컨테이너엔 안 먹힘 → 스키마 바꾸면 `docker-compose down && up`으로 재생성하거나 수동 적용.

## 막히면 볼 것
```bash
cd docker && docker-compose up -d                 # DB 기동(최초 시 스키마 자동생성)
docker exec study-db mysql -uebsoft -pebsoft ebrainsoft_study -e "SHOW TABLES;"
docker-compose down && docker-compose up -d        # 스키마 바꾼 뒤 재생성
```

## 회고
- 테이블 4개 + FK 3개 + 카테고리 기본값 5개까지 자동 생성 확인.
- 내 초안에서 고친 것: 모든 테이블에 PK 추가 / 게시글에 category_id로 카테고리 연결 / 첨부는 게시글 컬럼이 아니라 별도 테이블.
- 첨부는 실무라면 클라우드+링크지만, 이번 과제는 "바이너리 다운로드" 요구라 서버 저장 + 메타데이터 방식(이슈 #13에서 I/O로 구현).
