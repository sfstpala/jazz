all: hello.egg-info

hello.egg-info: setup.py hello bin/pip
	bin/pip install --editable . && touch $@
bin/pip:
	python3.4 -m venv .

test: all bin/coverage bin/flake8
	bin/coverage run --source=setup.py,hello setup.py test
	bin/coverage html
	bin/coverage report --fail-under=100 -m
	bin/flake8 setup.py hello
bin/coverage: bin/pip
	bin/pip install coverage
bin/flake8: bin/pip
	bin/pip install flake8

clean:
	rm -rf __pycache__ $(shell find hello -name "__pycache__" -type d)
	rm -rf *.egg-info *.egg build bin lib include share pyvenv.cfg
	rm -rf htmlcov .coverage
