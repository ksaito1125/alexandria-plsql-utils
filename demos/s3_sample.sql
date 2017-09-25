SET SERVEROUTPUT ON

begin
  amazon_aws_auth_pkg.init ('&1', '&2', p_gmt_offset => 9);
end;
/

begin
  debug_pkg.debug_on;
  amazon_aws_s3_pkg.new_bucket('xxxxxmy-bucket-name', amazon_aws_s3_pkg.g_region_asia_pacific_tokyo);
end;
/
