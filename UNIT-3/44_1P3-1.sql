CREATE TABLE publisher (
pub_id NUMBER(4),
pub_name VARCHAR2(40) NOT NULL,
city VARCHAR2(30),
country VARCHAR2(30),
CONSTRAINT pk_publisher PRIMARY KEY (pub_id)
);


CREATE TABLE book (
book_id NUMBER(5),
title VARCHAR2(60) NOT NULL,
category VARCHAR2(25),
price NUMBER(8,2),
stock NUMBER(4),
pub_id NUMBER(4),
CONSTRAINT pk_book PRIMARY KEY (book_id),
CONSTRAINT fk_book_pub FOREIGN KEY (pub_id)
REFERENCES publisher (pub_id)
);


CREATE TABLE lib_member (
member_id NUMBER(5),
member_name VARCHAR2(40) NOT NULL,
course VARCHAR2(20),
semester NUMBER(1),
join_date DATE,
CONSTRAINT pk_member PRIMARY KEY (member_id)
);


CREATE TABLE book_issue (
issue_id NUMBER(6),
book_id NUMBER(5),
member_id NUMBER(5),
issue_date DATE,
return_date DATE,
fine NUMBER(6,2) DEFAULT 0,
CONSTRAINT pk_issue PRIMARY KEY (issue_id),
CONSTRAINT fk_issue_book FOREIGN KEY (book_id)
REFERENCES book (book_id),
CONSTRAINT fk_issue_member FOREIGN KEY (member_id)
REFERENCES lib_member (member_id)
);