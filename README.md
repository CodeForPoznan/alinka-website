# Alinka website

## Runing 

1. Fill a file with environment variables [`app.env`]

2. Build and start docker containe
```bash
make start
```

3. Start React app locally
```bash
make local
```

If you want to play around inside Docker container you can gain access to its bash shell using:
```bash
make bash
```