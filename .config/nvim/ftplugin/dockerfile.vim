" specify `--platform` and `--tag`
" `%:h` はDockerfileが配置されたディレクトリ
" Usage:
" :DockerBuild --platform linux/arm64/v8 -t u1and0/yay:arm64
command! -nargs=* DockerBuild :sp <Bar> te sudo docker buildx build --load <args> %:h
" command! -nargs=* DockerBuild :sp <Bar> te sudo docker buildx build --load --cache-from=type=local,src=/tmp/buildx-cache --cache-to=type=local,dest=/tmp/buildx-cache <args> %:h
" Usage:
" :DockerPush --platform linux/arm64/v8 -t u1and0/yay:arm64
command! -nargs=* DockerPush :sp <Bar> te sudo docker buildx build --cache-from=type=local,src=/tmp/buildx-cache --push <args> %:h
