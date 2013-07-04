#!/bin/sh

java -Djava.security.krb5.realm=EXAMPLE.COM \
	-Djava.security.krb5.kdc=testbed-kdc.example.com \
	-Djavax.security.auth.useSubjectCredsOnly=false \
	-Djava.security.auth.login.config=bcsLogin.conf \
	-Dsun.security.krb5.debug=true \
	SampleServer 4444
