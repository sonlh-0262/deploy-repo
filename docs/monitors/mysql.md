### Get size of data and index lenth in db

```
SELECT table_schema "db_size ", ROUND(SUM(index_length) / 1024 / 1024, 1) "Index Size in MB", ROUND(SUM(data_length) / 1024 / 1024, 1) "Data Size in MB"  FROM information_schema.tables GROUP BY table_schema;
```

### Get size index:

```
SELECT database_name, table_name, index_name,
ROUND(stat_value * @@innodb_page_size / 1024 / 1024, 2) size_in_mb
FROM mysql.innodb_index_stats
WHERE stat_name = 'size' AND index_name != 'PRIMARY'
ORDER BY size_in_mb DESC;
```

### Show table status:

```
show table status from [dbname]
```
