CREATE TABLE Stu1Cdc (
        id INT,
        name STRING,
        age INT,
        PRIMARY KEY(id)  NOT ENFORCED
) WITH (
      'connector' = 'mysql-cdc',
      'table-name' = 'stu1',
      'database-name' = 'test',
      'hostname' = 'mysql_instance01',
      'port' = '3306',
      'username'='flink_cdc',
      'password'='flink_cdc'
      );



CREATE TABLE sink_table (
        id INT NOT NULL,
        name STRING,
        age INT
) WITH (
      'connector' = 'print'
      );



INSERT INTO sink_table SELECT id, name, age FROM Stu1Cdc;



CREATE TABLE Stu1 (
          id INT,
          name STRING,
          age INT
) WITH (
      'connector' = 'jdbc',
      'url' = 'jdbc:mysql://mysql_instance01:3306/test',
      'table-name' = 'stu1',
      'username'='root',
      'password'='root'
      );


CREATE TABLE Stu2 (
      id INT,
      name STRING,
      age INT
) WITH (
      'connector' = 'jdbc',
      'url' = 'jdbc:mysql://mysql_instance01:3306/test',
      'table-name' = 'stu2',
      'username'='root',
      'password'='root'
      );


CREATE TABLE stu_mock (
       name STRING,
       age INT
) WITH (
      'connector' = 'datagen',
      'rows-per-second' = '10000',
      'number-of-rows' = '100000'
      );