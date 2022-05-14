# grpcui
Docker image for fullstorydev/grpcui

## Usage
Try to connect to the server if possible after 5 secs. (1 secs if it's not specified.)
```
docker run -eGRPCUI_SERVER=localhost:8888 -GRPCUI_WAIT=5 -p8080:8080 ghcr.io/tk42/grpcui
```
