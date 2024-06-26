# 0X0C - Web Server

Web servers consist of hardware and software that use Hypertext Transfer Protocol (HTTP) to respond to web users’ requests made via the World Wide Web.

##BACKGROUND CONTEXT

In this project, some of the tasks will be graded on 2 aspects:

Is your web-01 server configured according to requirements
Does your answer file contain a Bash script that automatically performs commands to configure an Ubuntu machine to fit requirements (meaning without any human intervention)
For example, if I need to create a file /tmp/test containing the string hello world and modify the configuration of Nginx to listen on port 8080 instead of 80, I can use emacs on my server to create the file and to modify the Nginx configuration file /etc/nginx/sites-enabled/default.

But my answer file would contain:

sylvain@ubuntu cat 88-script_example
#!/usr/bin/env bash
# Configuring a server with specification XYZ
echo hello world > /tmp/test
sed -i 's/80/8080/g' /etc/nginx/sites-enabled/default
sylvain@ubuntu
As you can tell, I am not using emacs to perform the task in my answer file. This exercise is aiming at training you on automating your work. If you can automate tasks that you do manually, you can then automate yourself out of repetitive tasks and focus your energy on something more interesting. For an SRE, that comes very handy when there are hundreds or thousands of servers to manage, the work cannot be only done manually. Note that the checker will execute your script as the root user, you do not need to use the sudo command.

A good Software Engineer is a lazy Software Engineer. 

Tips: to test your answer Bash script, feel free to reproduce the checker environment:

start a Ubuntu 16.04 sandbox
run your script on it
see how it behaves

__NOTE__: In this project, some of the tasks will be graded on 2 aspects:

1. Is your web-01 server configured according to requirements
2. Does your answer file contain a Bash script that automatically performs commands to configure an Ubuntu machine to fit requirements (meaning without any human intervention).

## Learning Objectives

A good software engineer is a lazy software engineer, crazy right.

![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/266/82VsYEC.jpg)

__General Objectives__
	- what is the main role of a web server
	- What is a child process
	- Why web servers usually have a parent process and child processes
	- What are the main HTTP requests

__DNS__
	- What DNS stands for
	- What is DNS main role

__DNS Record Types__
	- `A Records`
	- `CNAME`
	- `TXT Records`
	- `MX Records`

- How the web works
- `Nginx`
- How to __Configure Nginx__
- Child process concept page
- __Root and sub domain__
- `HTTP` __requests__
- `HTTP` __redirection__
- Not found `HTTP` response code
- Logs files on Linux
- `HTTP/1.1` and `HTTP/2`
- `scp` and `curl`

## Requirements

__General__

- Allowed editors: `vi`, `vim`, `emacs`
- All your files will be interpreted on `Ubuntu 16.04 LTS`
- All your files should end with a new line
- A `README.md file`, at the root of the folder of the project, is mandatory
- All your Bash script __files must be executable__
- Your Bash script must pass `Shellcheck (version 0.3.7)` without any error
- The first line of all your Bash scripts should be exactly `#!/usr/bin/env bash`
- The second line of all your Bash scripts should be a comment explaining what is the script doing
- You can’t use `systemctl` for restarting a process
- A prior knowledge to bash scripting

## Video Tutorial

For stsep by step guide on how to go about the installation and configuration, you can click the __"watch video"__ link to get started

- Proceed to video -> [Watch Video](https://youtu.be/5vy448hK-c4)

## Installing Needed Packages

```bash

$ sudo apt-get install shellcheck -y

# Check shellcheck version

$ shellcheck -V

# Installing nginx

$ sudo apt-get install nginx -y

```
## Configuring nginx
```bash

# Configuring the default file

$ sudo vi /etc/nginx/sites-available/default

# Once the vi editior opens

server {
  listen 80 default_Server;
  root /var/www/html;
  index index.html index.htm index.nginx-debian.html;

# if you have a domain name replace '_' with it
  server_name _;

# configuring error_page
  error_page 404 404.html;

  location / {
	try_files $uri $uri/ =404;
  }

  location = /404.html {
	internal;
  }
}
