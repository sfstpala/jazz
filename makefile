all: jazz.egg-info

jazz.egg-info: setup.py jazz bin/pip
	bin/pip install --editable . && touch $@
bin/pip:
	python3.4 -m venv .

test: all bin/coverage bin/flake8
	bin/coverage run --source=setup.py,jazz setup.py test
	bin/coverage html
	bin/coverage report --fail-under=100 -m
	bin/flake8 setup.py jazz
bin/coverage: bin/pip
	bin/pip install coverage
bin/flake8: bin/pip
	bin/pip install flake8

clean:
	rm -rf __pycache__ $(shell find jazz -name "__pycache__" -type d)
	rm -rf *.egg-info *.egg build bin lib include share pyvenv.cfg
	rm -rf htmlcov .coverage
