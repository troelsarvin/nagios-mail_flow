-- Mail Flow Checker version 2.0.
-- 
-- Copyright (C) 2013 by National Board of eHealth, Denmark, and Troels Arvin.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.

-- DROP TABLE mail_flow.messages;
-- DROP SEQUENCE mail_flow.messageid_sequence;
-- DROP SCHEMA mail_flow;

CREATE SCHEMA mail_flow;
GRANT USAGE ON SCHEMA mail_flow TO nagios;

CREATE SEQUENCE mail_flow.messageid_sequence;
GRANT SELECT,UPDATE ON mail_flow.messageid_sequence TO nagios;

CREATE TABLE mail_flow.messages (
    msg_id VARCHAR(100) NOT NULL PRIMARY KEY,
    smtp_server VARCHAR(256) NOT NULL,
    to_addr VARCHAR(256) NOT NULL,
    subj VARCHAR(256) NOT NULL,
    sent TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    first_received_header_ts TIMESTAMP,
    received TIMESTAMP
);
CREATE INDEX messages_received_idx ON mail_flow.messages(received);
GRANT SELECT,INSERT,UPDATE,DELETE ON mail_flow.messages TO nagios;

CREATE TABLE mail_flow.receive_script_execution (
    smtp_server VARCHAR(256) NOT NULL,
    to_addr VARCHAR(256) NOT NULL,
    subj VARCHAR(256) NOT NULL,
    ts TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
GRANT SELECT,INSERT,UPDATE,DELETE ON mail_flow.receive_script_execution TO nagios;
