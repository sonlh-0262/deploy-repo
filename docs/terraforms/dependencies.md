### Dependencies

- Most resource dependencies are handled automatically
- In few cases, dependencies are not recognized implicitly in configuration
- Using `depends_on` to specify explicitly a dependency

```
resource "aws_instance" "example" {
  ami = "xxxx"
  instance_type = "t2.small"
  
  depends_on = [aws_s3_bucket.b1]
}

resource "aws_s3_bucket" "b1" {
  bucket = "bucket-b1"
  acl = "private"
}
```

### Debug

- enable by `TF_LOG` environment variable
- supported log level are `TRACE`, `DEBUG`, `INFO` `WARN` or `ERROR`

EX:
```
export TF_LOG=TRACE

# Do not show log
export TF_LOG=
```
