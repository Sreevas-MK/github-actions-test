FROM python:3.11-alpine

ENV APP_USER flask_user

ENV APP_DIRECTORY /var/flaskapp

RUN mkdir $APP_DIRECTORY

RUN adduser -h $APP_DIRECTORY -s /bin/sh -D -H $APP_USER

WORKDIR $APP_DIRECTORY

COPY ./app.tar.gz .

RUN tar -xvf app.tar.gz

RUN rm app.tar.gz

RUN pip install -r requirements.txt

RUN chown -R $APP_USER:$APP_USER $APP_DIRECTORY

EXPOSE 5000

USER $APP_USER

ENTRYPOINT ["python"]

CMD ["app.py"]

