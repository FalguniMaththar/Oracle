create sequence seq_customers start with 1 INCREMENT by 1;

INSERT INTO CUSTOMERS(CUSTOMER_ID,NAME,EMAIL,PASSWORD,PHONE) VALUES(SEQ_CUSTOMERS.nextval,'falguni','falguni@gmail.com','falguni123',9876543215);

INSERT INTO CUSTOMERS VALUES (SEQ_CUSTOMERS.nextval,'akshit','akshit@exw.com','ksj',98989798787,sysdate);