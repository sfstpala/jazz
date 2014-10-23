all: jazz.egg-info

jazz.egg-info: setup.py jazz bin/pip
	bin/pip install --editable . && touch $@
bin/pip: bin/python get-pip.py
	bin/python get-pip.py
bin/python:
	python3.4 -m venv --without-pip .
get-pip = https://bootstrap.pypa.io/get-pip.py
get-pip.py:
	python3.4 -c "import urllib.request; urllib.request.urlretrieve('$(get-pip)', '$@')"

test: all bin/coverage bin/flake8
	bin/coverage run --source=setup.py,jazz setup.py test
	bin/coverage html
	bin/coverage report --fail-under=100 -m
	bin/flake8 setup.py jazz
bin/coverage: bin/pip
	bin/pip install coverage
bin/flake8: bin/pip
	bin/pip install flake8

ifdef DEB_HOST_ARCH
DESTDIR ?= /
PREFIX ?= usr/
install:
	@$(python) setup.py install --no-compile --prefix="$(PREFIX)" --root="$(DESTDIR)" --install-layout=deb
endif

deb:
	rm -rf build; mkdir build; cp -r $$(find * -not -name "build" -prune) build
	cd build/; debuild -us -uc -tc && lintian ../*.deb ../*.dsc ../*.changes

clean:
	rm -rf __pycache__ $(shell find jazz -name "__pycache__" -type d)
	rm -rf *.egg-info *.egg build bin lib include share pyvenv.cfg get-pip.py
	rm -rf htmlcov .coverage
	rm -rf build *.dsc *.tar.gz *.build *.changes *.deb
