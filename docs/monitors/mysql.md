### Get size of data and index lenth in db

```
SELECT table_schema "db_size ", ROUND(SUM(index_length) / 1024 / 1024, 1) "Index Size in MB", ROUND(SUM(data_length) / 1024 / 1024, 1) "Data Size in MB"  FROM information_schema.tables GROUP BY table_schema;
```
