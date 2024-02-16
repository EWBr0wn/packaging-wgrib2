3rd-party/wgrib2.tgz:
	curl --remote-time https://www.ftp.cpc.ncep.noaa.gov/wd51we/wgrib2/wgrib2.tgz.v3.1.3 -o 3rd-party/wgrib2.tgz

3rd-party/pywgrib2_s.py:
	curl --remote-time https://ftp.cpc.ncep.noaa.gov/wd51we/pywgrib2_s/pywgrib2_s.tgz.v0.0.11 -o 3rd-party/pywgrib2_s.tgz
	tar -xvzf 3rd-party/pywgrib2_s.tgz -C 3rd-party/

3rd-party/cmake.tgz:
	curl --remote-time https://cmake.org/files/v3.19/cmake-3.19.8.tar.gz -o 3rd-party/cmake.tgz

.PHONY: lambda-wgrib2
lambda-wgrib2: 3rd-party/cmake.tgz 3rd-party/wgrib2.tgz
	docker build --target lambda-wgrib2 -t lambda-wgrib2:v3.1.3 .

.PHONY: lambda-pywgrib2
lambda-pywgrib2: 3rd-party/cmake.tgz 3rd-party/wgrib2.tgz 3rd-party/pywgrib2_s.py
	docker build --target lambda-pywgrib2 -t lambda-pywgrib2:v3.1.3 .
