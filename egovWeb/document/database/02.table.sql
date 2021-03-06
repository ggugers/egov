CREATE TABLE BOARD (
	IDX NUMBER NOT NULL,
	TITLE VARCHAR(200 BYTE) NOT NULL,
	CONTENT VARCHAR(4000 BYTE) NOT NULL,
	REG_ID VARCHAR(100 BYTE),
	ATCH_FILE_ID VARCHAR(30),
	READ_CNT NUMBER(30,0),
	REG_DATE DATE,
	UPD_ID VARCHAR(100 BYTE),
	UPD_DATE DATE,
	CONSTRAINT PK_BOARD PRIMARY KEY(IDX)
);

COMMENT ON TABLE BOARD IS '게시물';
COMMENT ON COLUMN BOARD.IDX IS '게시물고유번호';
COMMENT ON COLUMN BOARD.TITLE IS '제목';
COMMENT ON COLUMN BOARD.CONTENT IS '내용';
COMMENT ON COLUMN BOARD.ATCH_FILE_ID IS '첨부파일';
COMMENT ON COLUMN BOARD.READ_CNT IS '조회수';
COMMENT ON COLUMN BOARD.REG_ID IS '등록자';
COMMENT ON COLUMN BOARD.REG_DATE IS '등록일';
COMMENT ON COLUMN BOARD.UPD_ID IS '수정자';
COMMENT ON COLUMN BOARD.UPD_DATE IS '수정일';



CREATE TABLE IDS  (
  TABLE_NAME varchar2(20) NOT NULL,
  NEXT_ID number(30,0) DEFAULT 0 NOT NULL ,
  CONSTRAINT IDS_PK PRIMARY KEY (TABLE_NAME)
);
COMMENT ON TABLE IDS IS 'ID생성테이블';
COMMENT ON COLUMN IDS.TABLE_NAME IS '테이블명';
COMMENT ON COLUMN IDS.IDX IS '아이디';

