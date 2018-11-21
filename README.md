# Scale-out-machine-learning-using-Docker:
This is API for deploying machine learning model using docker 

You can create docker image by following this code:
- Set path that contain your dockerfile: docker cd C:\Users\thanhnm3\Desktop\api\docker

- Build your image: docker build -t thanhleo_machinelearning .

- Run your API image: docker run --rm -p 8000:8000 thanhleo_machinelearning

- Consume your API by following: localhost:8000/survival?Sex=male&Pclass=1&Age=26

- Create your respo in dockerhub push this image into public by following:
docker tag 4c3cb14549f7 thanhleoooo/thanhleo_machinelearning:firsttry
docker push thanhleoooo/thanhleo_machinelearning

- Remember: the R script function (templete.R) must have a blank line in the last line in order to run Docker successfully

# My blog of this work is here:
http://rpubs.com/thanhleo92/441289

https://hub.docker.com/r/thanhleoooo/thanhleo_machinelearning/
