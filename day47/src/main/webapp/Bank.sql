CREATE TABLE BANK1(
	BID INT PRIMARY KEY,
	BNAME VARCHAR(20) NOT NULL,
	BALANCE INT NOT NULL
);
CREATE TABLE BANK2(
	BID INT PRIMARY KEY,
	BNAME VARCHAR(20) NOT NULL,
	BALANCE INT NOT NULL
);

INSERT INTO BANK1 VALUES(101, '앙티모', 10000);
INSERT INTO BANK2 VALUES(222, '김가렌', 100);

SELECT * FROM BANK1, BANK2 WHERE BID=7;
