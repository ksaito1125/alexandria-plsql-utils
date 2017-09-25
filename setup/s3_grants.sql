grant execute on dbms_crypto to &1;
grant execute on sys.utl_file to &1;
grant execute on sys.utl_http to &1;
grant execute on sys.utl_tcp to &1;

BEGIN
  DBMS_NETWORK_ACL_ADMIN.CREATE_ACL(acl         => 's3.xml',
                                    description => 'S3 ACL',
                                    principal   => '&1',
                                    is_grant    => true,
                                    privilege   => 'connect');

  DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE(acl       => 's3.xml',
                                       principal => '&1',
                                       is_grant  => true,
                                       privilege => 'resolve');

  DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL(acl  => 's3.xml',
                                    host => '*.s3.amazonaws.com');
END;
/
COMMIT;

