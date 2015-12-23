name             "app_phpback"
maintainer       "RIYIC"
maintainer_email "info@riyic.com"
license          "Apache 2.0"
description      "Cookbook to manage phpback installations"
#long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "app_php"
depends "dbs_mysql"

%w{debian ubuntu}.each do |os|
  supports os
end

recipe "deploy",
    description: "Deploy a tasty phpback application",
    attributes: [/.+/]


attribute "app/phpback/domain",
    :display_name => 'Application domain',
    :description => 'Domain associated to app virtual host',
    :default => 'test.com',
    :advanced => false,
    :required => true,
    :validations => {predefined: "domain"}

attribute "app/phpback/alias",
    :display_name => 'Application domain alias',
    :description => 'Other domains associated to app virtual host',
    :default => [],
    :type => "array",
    :validations => {predefined: "domain"}


attribute "app/phpback/db_host",
    :display_name => "Database host",
    :description => "Database host",
    :default => "db",
    :required => true,
    :validations => {predefined: "server_name"}


attribute "app/phpback/db_name",
    :display_name => "Database name",
    :description => "Database Name",
    :default => "phpback_db",
    :required => true,
    :validations => {predefined: "mysql_dbname"}

attribute "app/phpback/db_user",
    :display_name => "Database username",
    :description => "Database related user",
    :default => "phpback_user",
    :required => true,
    :validations => {predefined: "mysql_dbuser"}

attribute "app/phpback/db_password",
    :display_name => "Database user password",
    :description => "Database user password",
    :required => true,
    :calculated => true,
    :validations => {predefined: "mysql_dbpassword"}

#attribute "app/phpback/db_type",
#    :display_name => "Database type",
#    :description => "Database type valid values: pgsql, mysqli, mariadb, mssql, sqlsrv, oci",
#    :required => true,
#    :default => 'pgsql',
#    :choice => %w{pgsql mariadb mysqli mssql sqlsrv oci}

attribute "app/phpback/target_path",
    :display_name => "Application deployment folder",
    :description => 'The application will be deployed to this folder',
    :default => '/home/phpback/public',
    :validations => {predefined: "unix_path"}

attribute "app/phpback/user",
    :display_name => "Deployment owner",
    :description => 'User that shall own the target path',
    :default => 'phpback',
    :validations => {predefined: "username"}

attribute "app/phpback/group",
    :display_name => "Deployment group",
    :description => 'The group that shall own the target path',
    :default => 'users',
    :validations => {predefined: "username"}

attribute "app/phpback/admin_user",
    :display_name => "Admin user",
    :description => 'Admin user name',
    :required => true,
    :default => 'admin',
    :validations => {predefined: "username"}

attribute "app/phpback/admin_password",
    :display_name => "Admin user password",
    :description => 'Admin user password',
    :required => true,
    :calculated => true,
    :validations => {predefined: "password"}
