This is a Django project that runs a single page web application. This repository is used in conjunction with an article that was written on [Medium](https://medium.com/@vahiwe/build-a-django-ci-cd-pipeline-using-jenkins-e90cbe098970?sk=3bdfb50a12ae9cadda426b1463a442b9). It allows one eliminate the admin overhead that comes with testing your Django project in a production like environment. This will allow you make changes and see the effects almost immediately.

## :page_with_curl:  _Instructions If Following The Medium Article_

**1)** If you follow the medium article then it means you'll be using Jenkins to set up a CI/CD pipeline. Now this project is specific to Django project but you can edit the files to fit your use case scenario. I'll be explaining what each file used in the pipeline does and variables you'll need to change for your project to run. Again this is specific for Django projects.

**2)** `initial-setup.sh` - This file is the first file to look at when setting up this project. It installs the required packakages to make this project work such as Nginx, Jenkins, Python etc. Refer to the Medium article to see how and when it is used.

**3)** `Jenkinsfile` - This file contains the definition of the stages in the pipeline. The stages in this project's pipeline are `Setup Python Virtual Environment`, `Setup gunicorn service` and `Setup Nginx`. The stages in this pipeline just does two things. First it makes a file executable and then runs the file. The file carries out the commands that is described by the stage description.

**4)** `envsetup.sh` - This file sets up the python virtual environment, installs the python packages and then creates log files that will be used by Nginx. 

**5)** `gunicorn.sh` - This file runs some Django management commands like migration commands and static files collection commands. It also sets up the gunicorn service that will be running the gunicorn server in the background.

**6)** `nginx.sh` - This file sets up Nginx with a configuration file that points Nginx to the gunicorn service that is running our application. This allows Nginx serve our application. It allows adds Nginx to the centos group, since centos is the user that owns the project directory if the medium article is used. This should be changed to whichever user that owns the project directory. It also changes the mode of the directory. If you're using a different pipeline name then change `DjangoApp` on `line 7` of this file to your pipeline name.

**7)** `app.conf` - This is an Nginx server configuration file. This file is used to setup Nginx as proxy server to gunicorn. For this configuration to work, change the value of `server_name` to the IP address or domain name of your server. If you're using a different pipeline name then change `DjangoApp` on `line 5, 6, 11 and 19` of this file to your pipeline name. `Line 19` is the path to the gunicorn sock file.

**8)** `gunicorn.service` - This is a Systemd Service configuration file. This configures the gunicorn server to run in the background as a service. It also sets the path to the gunicorn sock file. If you're using a different pipeline name then change `DjangoApp` on `line 8 and 9` of this file to your pipeline name. Also at the end of the `ExecStart` value, change it to the path of the `wsgi` file of the Django Project. Also set the User to the one that owns the project folder according to the configuration from the Medium article.

**9)** The rest of the files are normal files you find in a Django Project. Please if you add ssl to your domain then you'll have to update the `app.conf` with the configuration of your ssl.

## :page_with_curl:  _Instructions For Running This Project Locally_

**1)** Fire up your favourite console & clone this repo somewhere:

__`❍ git clone https://github.com/vahiwe/Django-CI-CD-Pipeline.git`__

**2)** Enter this directory:

__`❍ cd Django-CI-CD-Pipeline`__

**3)** Start the server to view the webapp:

__`❍ python manage.py runserver `__

**4)** Open your browser and type in this URL to view the webapp:

__`❍ http://127.0.0.1:8000/`__

__*Happy developing!*__