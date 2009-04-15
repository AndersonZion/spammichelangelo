--TABELA ADT
CREATE SEQUENCE adt_seq;

CREATE TABLE adt (
  adtcod NUMERIC(12) NOT NULL DEFAULT NEXTVAL('adt_seq'),
  adtdatref DATE NULL,
  adtip VARCHAR(15) NULL
);

ALTER TABLE adt
   ADD CONSTRAINT adtA PRIMARY KEY(adtcod);

--TABELA EMD
CREATE SEQUENCE emd_seq;

CREATE TABLE emd (
  emdcod INTEGER  NOT NULL DEFAULT NEXTVAL('emd_seq'),
  emddes VARCHAR(50) NULL
);

ALTER TABLE emd
   ADD CONSTRAINT emdA PRIMARY KEY(emdcod);

CREATE INDEX emdB ON emd (emddes);

--TABELA USR
CREATE SEQUENCE usr_seq;

CREATE TABLE usr (
  usrcod INTEGER  NOT NULL DEFAULT NEXTVAL('usr_seq'),
  usrnom VARCHAR(40) NULL,
  usrpfl VARCHAR(13) NULL,
  usrsex BIT NULL,
  usrcpf NUMERIC(11) NULL,
  usrrg NUMERIC(10) NULL,
  usrorgexp VARCHAR(5) NULL,
  usrend VARCHAR(50) NULL,
  usrcep NUMERIC(8) NULL,
  usrcde VARCHAR(30) NULL,
  usruf VARCHAR(2) NULL,
  usrddd NUMERIC(3) NULL,
  usrtel NUMERIC(8) NULL,
  usreml VARCHAR(50) NULL,
  usrsen VARCHAR(20) NULL
);

ALTER TABLE usr
   ADD CONSTRAINT usrA PRIMARY KEY(usrcod);

CREATE INDEX usrB ON usr (usrnom);

--TABELA MDC
CREATE SEQUENCE mdc_seq;

CREATE TABLE mdc (
  mdccod INTEGER  NOT NULL DEFAULT NEXTVAL('mdc_seq'),
  mdccrm INTEGER  NULL,
  mdccrmuf VARCHAR(2) NULL
);

ALTER TABLE mdc
   ADD CONSTRAINT mdcA PRIMARY KEY(mdccod);

--TABELA AGD
CREATE SEQUENCE agd_seq;

CREATE TABLE agd (
  agdcod INTEGER NOT NULL DEFAULT NEXTVAL('agd_seq'),
  mdccod INTEGER  NOT NULL,
  usrcod INTEGER  NOT NULL,
  emdcod INTEGER  NOT NULL,
  agdtip INTEGER  NULL,
  agddat DATE NULL,
  agdhor INTEGER  NULL
);

ALTER TABLE agd
   ADD CONSTRAINT agdA PRIMARY KEY(agdcod);  

ALTER TABLE agd
   ADD CONSTRAINT FK_agd_MDC FOREIGN KEY (mdccod)
                          REFERENCES MDC (mdccod);    
ALTER TABLE agd
   ADD CONSTRAINT FK_agd_USR FOREIGN KEY (usrcod)
                          REFERENCES USR (usrcod);
ALTER TABLE agd
   ADD CONSTRAINT FK_agd_EMD FOREIGN KEY (emdcod)
                          REFERENCES EMD (emdcod);

--TABELA AGM
CREATE SEQUENCE agm_seq;

CREATE TABLE agm (
  agmcod INTEGER  NOT NULL DEFAULT NEXTVAL('agm_seq'),
  mdccod INTEGER  NOT NULL,
  agmdtaatd VARCHAR(14) NULL,
  agmhorini NUMERIC(4) NULL,
  agmhorfim NUMERIC(4) NULL,
  agmcnsatd NUMERIC(4) NULL
);

ALTER TABLE agm
   ADD CONSTRAINT agmA PRIMARY KEY(agmcod);  

ALTER TABLE agm
   ADD CONSTRAINT FK_agm_MDC FOREIGN KEY (mdccod)
                          REFERENCES MDC (mdccod);    

--TABELA CID
CREATE SEQUENCE cid_seq;

CREATE TABLE cid (
  cidcod INTEGER  NOT NULL DEFAULT NEXTVAL('cid_seq'),
  ciddes VARCHAR(50) NULL 
);

ALTER TABLE cid
   ADD CONSTRAINT cidA PRIMARY KEY(cidcod);  

CREATE INDEX cidB ON cid (ciddes);

--TABELA CPM
CREATE SEQUENCE cpm_seq;

CREATE TABLE cpm (
  cpmcod INTEGER  NOT NULL DEFAULT NEXTVAL('cpm_seq'),
  agmcod INTEGER  NOT NULL,
  cpmdes VARCHAR(50) NULL,
  cpmtip VARCHAR(14) NULL,
  cpmdta DATE NULL,
  cpmhorini NUMERIC(4) NULL,
  cpmhorter NUMERIC(4) NULL  
);

ALTER TABLE cpm
   ADD CONSTRAINT cpmA PRIMARY KEY(cpmcod);  

CREATE INDEX cpmB ON cpm (cpmdes);

ALTER TABLE cpm
   ADD CONSTRAINT FK_cpm_AGM FOREIGN KEY (agmcod)
                          REFERENCES AGM (agmcod); 


--TABELA CVN
CREATE SEQUENCE cvn_seq;

CREATE TABLE cvn (
  cvncod INTEGER  NOT NULL DEFAULT NEXTVAL('cvn_seq'),
  cvnanscod INTEGER  NULL,
  cvndes VARCHAR(50) NULL,
  cvncpj NUMERIC(14) NULL,
  cvnend VARCHAR(50) NULL,
  cvnste VARCHAR(50) NULL,
  cvneml VARCHAR(50) NULL,
  cvnddd NUMERIC(3) NULL,
  cvntel NUMERIC(8) NULL
);

ALTER TABLE cvn
   ADD CONSTRAINT cvnA PRIMARY KEY(cvncod);  

CREATE INDEX cvnB ON cvn (cvndes);


--TABELA HTC
CREATE SEQUENCE htc_seq;

CREATE TABLE htc (
  htccod INTEGER  NOT NULL DEFAULT NEXTVAL('htc_seq'),
  cidcod INTEGER  NOT NULL,
  htcstm VARCHAR(400) NULL,
  htcldo VARCHAR(400) NULL,
  htcobs VARCHAR(400) NULL,
  htcprc VARCHAR(400) NULL
);

ALTER TABLE htc
   ADD CONSTRAINT htcA PRIMARY KEY(htccod);  

CREATE INDEX htcB ON htc (htcstm);

ALTER TABLE htc
   ADD CONSTRAINT FK_htc_CID FOREIGN KEY (cidcod)
                          REFERENCES CID (cidcod); 


--TABELA OPC
CREATE SEQUENCE opc_seq;

CREATE TABLE opc (
  opccod NUMERIC(3) NOT NULL DEFAULT NEXTVAL('opc_seq'),
  opcgrp NUMERIC(2) NULL,
  opcdsc VARCHAR(80) NULL,
  opcidcdsp BOOL NULL
);

ALTER TABLE opc
   ADD CONSTRAINT opcA PRIMARY KEY(opccod);  

CREATE INDEX opcB ON opc (opcdsc);

--TABELA PMT
CREATE SEQUENCE pmt_seq;

CREATE TABLE pmt (
  pmtcod INTEGER  NOT NULL DEFAULT NEXTVAL('pmt_seq'),
  pmtdes VARCHAR(30) NOT NULL,
  pmtval VARCHAR(100) NOT NULL,
  pmttip NUMERIC(1) NULL
);


ALTER TABLE pmt
   ADD CONSTRAINT pmtA PRIMARY KEY(pmtcod);  

CREATE INDEX pmtB ON pmt (pmtdes);


--TABELA RME
CREATE TABLE rme (
  mdccod INTEGER  NOT NULL,
  emdcod INTEGER  NOT NULL
);

ALTER TABLE rme
   ADD CONSTRAINT rmeA PRIMARY KEY(mdccod, emdcod);  

ALTER TABLE rme
   ADD CONSTRAINT FK_rme_MDC FOREIGN KEY (mdccod)
                          REFERENCES MDC (mdccod); 
ALTER TABLE rme
   ADD CONSTRAINT FK_rme_EMD FOREIGN KEY (emdcod)
                          REFERENCES EMD (emdcod); 

--TABELA RUC
CREATE TABLE ruc (
  usrcod INTEGER  NOT NULL,
  cvncod INTEGER  NOT NULL,
  rucidfseg NUMERIC(14) NULL,
  rucplnrde VARCHAR(25) NULL,
  rucacm VARCHAR(30) NULL,
  rucplnvld DATE NULL
);

ALTER TABLE ruc
   ADD CONSTRAINT rucA PRIMARY KEY(usrcod, cvncod);  

ALTER TABLE ruc
   ADD CONSTRAINT FK_ruc_USR FOREIGN KEY (usrcod)
                          REFERENCES USR (usrcod); 
ALTER TABLE ruc
   ADD CONSTRAINT FK_ruc_CVN FOREIGN KEY (cvncod)
                          REFERENCES CVN (cvncod); 

--TABELA RUH
CREATE TABLE ruh (
  usrcod INTEGER  NOT NULL,
  htccod INTEGER  NOT NULL
);

ALTER TABLE ruh
   ADD CONSTRAINT ruhA PRIMARY KEY(usrcod, htccod);  

ALTER TABLE ruh
   ADD CONSTRAINT FK_ruh_USR FOREIGN KEY (usrcod)
                          REFERENCES USR (usrcod); 
ALTER TABLE ruh
   ADD CONSTRAINT FK_ruh_HTC FOREIGN KEY (htccod)
                          REFERENCES HTC (htccod); 

--TABELA RUO
CREATE TABLE ruo (
  usrcod INTEGER  NOT NULL,
  opccod NUMERIC(3) NOT NULL
);

ALTER TABLE ruo
   ADD CONSTRAINT ruoA PRIMARY KEY(usrcod, opccod);  

ALTER TABLE ruo
   ADD CONSTRAINT FK_ruo_USR FOREIGN KEY (usrcod)
                          REFERENCES USR (usrcod); 
ALTER TABLE ruo
   ADD CONSTRAINT FK_ruo_OPC FOREIGN KEY (opccod)
                          REFERENCES OPC (opccod); 



