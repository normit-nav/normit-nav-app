# normit-nav-app
Application for the NorMIT-navigation platform.

NorMIT-nav is based on [CustusX](https://github.com/SINTEFMedtek/CustusX).

### Build instructions

Build instructions are available [here](http://custusx.org/uploads/normit/nav/developer_doc/nightly/build_instructions.html).
However, the script to be run should be:

	cd \<root_dir\>
	git clone git@github.com:normit-nav/normit-nav-app.git NN/NN
	./NN/NN/script/cxPrivateInstaller.py --full --all -t Release --user_doc

Run `cxPrivateInstaller.py` -h for more options.
