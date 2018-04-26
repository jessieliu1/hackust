# Hackust
Receipt Tracker

# Setting up the environment (Linux)
1. Create virtual environment
```bash
python3 -m venv env
``` 
2. Start the virtualenv
```bash
source env/bin/activate
```
3. Upgrade python stuff
```bash
pip install --upgrade pip setuptools wheel
```
4. Install the node virtual environment
```bash
pip install nodeenv
nodeenv --python-virtualenv
```
5. Reactivate virtual environment
```bash
deactivate
source env/bin/activate
```
6. Install required modules 
```bash
chmod +x bin/setup
./bin/setup
```

# Compile front-end source Code
1. Run webpack to compile React into Javascript code. This should create a bundle.js file.
This should happen after modifying .jsx code.
```bash
./node_modules/.bin/webpack
```


# Running the Application
Although you can run the application right now, not all functionality will work unless you 
complete the steps in the section below.

1. Run the script to start the server
```bash
./bin/run_flask
```
