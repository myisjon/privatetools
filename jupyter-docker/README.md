### docker run 

#### create image

```bash
$ sudo docker build -t jupyter:test .
```

#### run container

```bash
$ sudo docker run -it -p 127.0.0.1:8080:8080 jupyter:test jupyter-notebook --ip=0.0.0.0 --port=8080 --notebook-dir=/jupyter --no-browser --allow-root
```
#### 注意事项:

* 使用supervisord做守护进程

如果用supervisord对该容器做守护进程需要减少t参数,例如:

```bash
$ sudo docker run -i -p 127.0.0.1:8080:8080 jupyter:test jupyter-notebook --ip=0.0.0.0 --port=8080 --notebook-dir=/jupyter --no-browser --allow-root
```

* 配置jupyter 的登录密码

如果需要配置jupyter 登录密码，请参考: http://jupyter-notebook.readthedocs.io/en/stable/public_server.html

* Nginx 反向代理

使用Nginx做反向代理，注意websocket的配置

