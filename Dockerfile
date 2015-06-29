FROM centos
MAINTAINER iknow0612 <xiongwei_13@hotmail.com>

# base tools and library
RUN yum install -y git \
	&& yum install -y make cmake gcc gcc-c++ tar \
	&& yum install -y openssl-devel libevent-devel libjpeg-devel giflib-devel libpng-devel libwebp-devel ImageMagick-devel libmemcached-devel

# Build zimg
RUN git clone https://github.com/buaazp/zimg -b master --depth=1 \
	&& cd zimg && make

COPY ./app.sh /zimg/bin/
WORKDIR /zimg/bin
EXPOSE 4869
CMD ["sh", "app.sh"]
