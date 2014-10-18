import setuptools


setuptools.setup(
    name="tornado-hello", version="0.0.0",
    packages=setuptools.find_packages(),
    test_suite="hello.tests",
    author="Stefano Palazzo",
    author_email="stefano.palazzo@gmail.com",
    url="https://github.com/sfstpala/tornado-hello/",
    classifiers=[
        "Programming Language :: Python :: 3",
        "Programming Language :: Python :: 3.4",
    ],
    install_requires=[
        "docopt >=0.6.2",
        "tornado >=4.0.2",
    ],
    entry_points={
        "console_scripts": [
            "hello = hello.__main__:main",
        ]
    },
    package_data={
        "hello": [
            "templates/*.html",
            "static/*.css",
        ],
    },
)
