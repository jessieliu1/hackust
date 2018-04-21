from setuptools import setup

setup(
        name='hackust',
        packages=['hackust'], 
        version='0.1.0',
        include_package_data=True,
        install_requires=[
            'Flask',
            'Flask-SQLAlchemy',
            ],
        )
