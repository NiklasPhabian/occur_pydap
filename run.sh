rsync -r --exclude=/handlers/csv/ ../pydap/src/pydap/ ../pydapEnv/lib/python2.7/site-packages/pydap/

rsync -r ../pydap.handlers.netcdf/src/pydap/handlers/netcdf/ ../pydapEnv/lib/python2.7/site-packages/pydap/handlers/netcdf/

python2 main.py 


#pip2 -q uninstall pydap.handlers.csv
#pip2 install git+https://github.com/pydap/pydap.handlers.csv
