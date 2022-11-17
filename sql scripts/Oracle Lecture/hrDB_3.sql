/* concat(char1, char2) */
SELECT CONCAT('Hello', 'bye'), CONCAT('good', 'bad') FROM DUAL;

SELECT CONCAT('good', 'bad') CONCATS, 'good' || 'bad' OPERATORS
FROM DUAL;

/* initcap(char) */
SELECT INITCAP('good morning') FROM DUAL;
SELECT INITCAP('good/bad morning') FROM DUAL;

/* lower(char), upper(char) */
SELECT LOWER('GOOD'), UPPER('good') FROM DUAL;

/* lpad() */
SELECT LPAD('good', 6) "LPAD1",
LPAD('good', 7, '#') "LPAD2",
LPAD('good', 8, 'L') "LPAD3"
FROM dual;

/* rpad() */
SELECT RPAD('good', 6) "LPAD1",
RPAD('good', 7, '#') "LPAD2",
RPAD('good', 8, 'L') "LPAD3"
FROM dual;

/* ltrim() */
SELECT LTRIM('goodbye', 'g'), LTRIM('goodbye', 'o'), LTRIM('goodbye', 'go')
FROM DUAL;

/* rtrim() */
SELECT RTRIM('goodbye', 'e') FROM DUAL;

/* substr() */
SELECT SUBSTR('good morning john', 8, 4) FROM DUAL;
SELECT SUBSTR('good morning john', 8) FROM DUAL;

SELECT SUBSTR('good morning john', -4) FROM DUAL;
SELECT SUBSTR('good morning john', -4, 2) FROM DUAL;
SELECT SUBSTR('good morning john', -4, 0) FROM DUAL;

/* substrb() */
SELECT SUBSTRB('good morning john', 8, 4) FROM DUAL;

/* replace() */
SELECT REPLACE('good morning tom', 'morning', 'evenning') FROM DUAL;

/* translate() */
SELECT REPLACE('You are not alone', 'You', 'We'),
TRANSLATE('You are not alone', 'You', 'We')
FROM DUAL;

/* trim() */
SELECT LENGTH(TRIM(LEADING FROM ' good ')),
LENGTH(TRIM(TRAILING FROM ' good ')),
LENGTH(TRIM(BOTH FROM ' good ')),
TRIM(BOTH 'g' FROM 'good')
FROM DUAL;

/* ascii() */
SELECT ASCII('A') FROM DUAL;

/* instr() */
SELECT INSTR('good morning john', 'or', 1) FROM DUAL;
SELECT INSTR('good morning john', 'n', 1, 2) FROM DUAL;