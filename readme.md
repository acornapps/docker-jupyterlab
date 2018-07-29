# [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)

JupyterLab (with Miniconda 3). 
**It is recommended that you use the image
[dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)
for data science related work.**
Note: Python packages in this version are managed using conda.
If you prefer managing Python packages using pip, 
please use the **master** (corresponds to the latest tag) branch instead.

## Detailed Information 

OS: Ubuntu 16.04  
Desktop Environment: None  
Remote Desktop: None  
Jupyter Notebook: 5.6.0  
NodeJS: 8.11.3  
JupyterLab: 0.33.2  
JupyterHub: 0.9.1  
OpenJDK 8  
Maven: 3.3.9  
Jupyter Kernels:  
- Python 3.6 

## Usage in Linux/Unix

### Prerequisites

You must have Docker installed. 
If you are on Ubuntu, 
the just use the command below to install the community edition of Docker.
```
sudo apt-get install docker.io
```
If you'd rather install the enterprise edition
or if you are on other platforms, 
please refer to the offical Docker doc [Install Docker](https://docs.docker.com/install/).

### Pull the Docker Image
```
docker pull dclong/jupyterlab
```
For people in mainland of China, 
please refer to the post 
[Speedup Docker Pulling and Pushing](http://www.legendu.net/en/blog/speedup-docker-pulling-and-pushing/) 
on ways to speed up pushing/pulling of Docker images. 
If you don't bother, 
then just use the command below. 
```
docker pull registry.docker-cn.com/dclong/jupyterlab
```

### Start a Container

Below are some Docker command arguments explained. 
These are for properly handling file permissions in the Docker container and on the host. 
Keep the default if you don't know what are the best to use. 
`DOCKER_PASSWORD` is probably the only argument you want to and should change. 

- `DOCKER_USER`: The user to be created (dynamically) in the container. 
    By default, the name of the current user on the host is used. 
- `DOCKER_USER_ID`: The ID of the user to be created in the container. 
    By default, the ID of the current user on the host is used. 
- `DOCKER_PASSWORD`: The password of the user to be created. 
    By default, it's the same as the user name. 
    You'd better change it for security reasons. 
    Of course, users can always change it later using the command `passwd`.
    
The root directory of JupyterLab/Jupyter notebooks is `/jupyter` in the container. 
You can mount directory on the host to it as you wish. 
In the illustration command below, 
I have the directory `/wwwroot` on the host mounted to `/jupyter` in the container. 
```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`id -g` \
    -v /wwwroot:/workdir \
    -v /home:/home_host \
    dclong/jupyterlab:conda3
```
```
docker run -d \
    --log-opt max-size=50m \
    -p 8888:8888 \
    -e DOCKER_USER=`id -un` \
    -e DOCKER_USER_ID=`id -u` \
    -e DOCKER_PASSWORD=`id -un` \
    -e DOCKER_GROUP_ID=`id -g` \
    -v `pwd`:/workdir \
    -v /home:/home_host \
    dclong/jupyterlab:conda3
```

## Use the JupyterLab Server

Open your browser and and visit `your_host_ip:8888` 
where `your_host_ip` is the URL/ip address of your server. 
You will be asked for token to login.
The token can be found using the command below,
where `container_id` is the name/ID of the launched JupyterLab container.
```
docker exec -u `id -un` container_id jupyter notebook list
```

## Known Issues

1. The subprocess managment issue. 
    This is not an issue at in most use cases. 
    This Docker image launch service using a shell script 
    so there won't be orphan subprocesses 
    when the process of the Docker container is get killed.
    However, launching by shell script is not the best way for managing processes.
    I might switch to the [Supervisor](https://github.com/Supervisor/supervisor) for process management 
    or use the base image of [pushion/ubuntu](https://github.com/phusion/baseimage-docker) in future. 


## Image Tree Related to [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)

[dclong/ubuntu_b](https://hub.docker.com/r/dclong/ubuntu_b/)

- [dclong/python](https://hub.docker.com/r/dclong/python/)
    - [dclong/jupyterlab](https://hub.docker.com/r/dclong/jupyterlab/)
        - [dclong/jupyterhub](https://hub.docker.com/r/dclong/jupyterhub/)
            - [dclong/jupyterhub-beakerx](https://hub.docker.com/r/dclong/jupyterhub-beakerx/)
                - [dclong/jupyterhub-ds](https://hub.docker.com/r/dclong/jupyterhub-ds/)
        - [dclong/jupyterlab-ts](https://hub.docker.com/r/dclong/jupyterlab-ts/)
        - [dclong/jupyterlab-js](https://hub.docker.com/r/dclong/jupyterlab-js/)
        - [dclong/jupyterlab-beakerx](https://hub.docker.com/r/dclong/jupyterlab-beakerx/)
        - [dclong/jupyterlab-tdodbc](https://hub.docker.com/r/dclong/jupyterlab-tdodbc/)
        - [dclong/jupyterlab-jdk](https://hub.docker.com/r/dclong/jupyterlab-jdk/)
            - [dclong/jupyterlab-scala](https://hub.docker.com/r/dclong/jupyterlab-scala/)
                - [dclong/jupyterlab-spark](https://hub.docker.com/r/dclong/jupyterlab-spark/)
            - [dclong/jupyterlab-antlr4](https://hub.docker.com/r/dclong/jupyterlab-antlr4/)
        - [dclong/jupyterlab-py](https://hub.docker.com/r/dclong/jupyterlab-py/)
        - [dclong/jupyterlab-rb](https://hub.docker.com/r/dclong/jupyterlab-rb/)
            - [dclong/jupyterlab-rp](https://hub.docker.com/r/dclong/jupyterlab-rp/)
                - [dclong/jupyterlab-rp-py](https://hub.docker.com/r/dclong/jupyterlab-rp-py/)
                - [dclong/jupyterlab-rstudio](https://hub.docker.com/r/dclong/jupyterlab-rstudio/)
                    - [dclong/jupyterlab-rstudio-py](https://hub.docker.com/r/dclong/jupyterlab-rstudio-py/)
                        - [dclong/jupyterlab-ds](https://hub.docker.com/r/dclong/jupyterlab-ds/)

## About the Author

[Personal Blog](http://www.legendu.net)   |   [GitHub](https://github.com/dclong)   |   [Bitbucket](https://bitbucket.org/dclong/)   |   [LinkedIn](http://www.linkedin.com/in/ben-chuanlong-du-1239b221/)
