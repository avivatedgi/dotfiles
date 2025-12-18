# AWS

## Aliases

```sh
csqs <input>    # Will purge the SQS queue <input>.fifo
export_aws_env  # Export AWS credentials to environment variables (current profile)
```

## Functions

```sh
al <profile>   # AWS SSO login for a profile
ap <profile>   # Export AWS credentials to environment for a specific profile
cdb <env>      # Start SSM port forwarding tunnel to database (env: prod_us|prod_eu|dev_us|dev_eu)
gdbp <env>     # Copy database password to clipboard (env: prod_us|prod_eu|dev_us|dev_eu)
```
