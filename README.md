# gunicorn-flask-nginx-restapi
REST/API running for Python/Flask applications using Gunicorn &amp; nginx

This is a shell container & won't run stand-alone.

It is designed to run read-only, but if you do want to run it read-only, you
should add `RUN python3 -m compileall /opt/python/` into your `Dockerfile`
*after* you have copied all your code into `/opt/python` so the python byte-code
can be created & stored in `__pycache__`, as this can't be done at run-time when read-only!!!

All you need to do is install your python/flask application into `/opt/python` with a tiny program called
`wsgi.py` that looks something like this

```
#! /usr/bin/python3

from you_app_main_file import application

if __name__ == "__main__":
    application.run()
```

You may also want to customise `nginx.conf`


If you have a few python/flask micro-services, putting all the common parts
into a parent container should be more efficient.
