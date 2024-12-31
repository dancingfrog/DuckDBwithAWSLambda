FROM public.ecr.aws/lambda/python:3.12
#FROM public.ecr.aws/sam/build-python3.12

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

ENV AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY

ENV HOME=/tmp

WORKDIR /var/task

COPY requirements.txt ./
RUN pip install -r requirements.txt

COPY . ./

CMD [ "lambda_function.handler" ]
