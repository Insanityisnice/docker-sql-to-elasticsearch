# SQL Linux on docker
I'm sure many people will say that running sql in docker is a bad idea but remember this is just demo ware.  This would not be a valid application setup.

## Lessons learned
* Make sure the password is significaly complex
    * The container will error out with no decription of the issue when it is not.

## Connecting to the database in vscode
* See the settings.json file in the .vscode folder for the mssql connection
    * Install the mssql extension