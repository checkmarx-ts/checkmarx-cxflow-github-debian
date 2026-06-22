#Use CxFlow Base image
FROM checkmarx/cx-flow-debian@sha256:e7e103fdc330748fbec343dc2ae39a6fc561667f1571dcc4f1cfbbff1d41fabc
#Copy script to import certs into Java cacerts keystore
COPY scripts/keytool-import-certs.sh /app/keytool-import-certs.sh
#Make it executable
RUN chmod +x /app/keytool-import-certs.sh
#Copy the entrypoint script and properties used for the action
COPY entrypoint.sh /app/entrypoint.sh
#Make it executable
RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]
