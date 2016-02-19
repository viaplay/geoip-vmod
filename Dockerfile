FROM centos:7

RUN rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN yum -y update
ADD ./varnish.repo /etc/yum.repos.d/
RUN yum -y install \
		make \
		automake \
		autoconf \
		libtool \
		pkgconfig \
		varnish \
		varnish-libs-devel \
		geoip-devel

ADD . /src
WORKDIR /src
RUN ./autogen.sh \
	&& ./configure \
	&& make \
	&& make install
