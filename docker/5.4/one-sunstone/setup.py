#!/usr/bin/env python
from setuptools import setup, find_packages


VERSION = 0.1
README = open('README.md').read()


INSTALL_REQ = [
    'sh>=1.12.11',
    'Jinja2>=2.9.5',
    'pyOpenSSL>=17.0.0',
]


PACKAGE_DATA = {
    'corona_sunstone.templates': ['*.j2'],
}


setup(
    name='corona-sunstone',
    version=VERSION,
    packages=find_packages(),
    description='Sunstone container bootstrap for CORONA',
    long_description=README,
    install_requires=INSTALL_REQ,
    package_data=PACKAGE_DATA,
    include_package_data=True,
    entry_points=dict(
        console_scripts=[
            'corona-sunstone = corona_sunstone.cli:main',
        ]
    ),
    zip_safe=False
)
