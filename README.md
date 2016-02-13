======================================================================
==============================+ README +==============================
======================================================================

Welcome to blastagator's tweaked LG G2 device git.

This git is based on the CM device tree. I tweaked it to build TWRP 
recovery.

To Build TWRP:

Determine which version you want to build and find the tag in the git.
	e.g. to build v3.0.0-3, look in tags and you will find tag 
	v3.0.0-3-cm13.0
	
	The additional -cm13.0 indicates I build the version using the
	cm-13.0 source tree

1)	Initialize the source tree from the tag you found (e.g. cm-13.0)
	See cyanogenmod documentation for how to do this

2)	Sync the repo.  (Takes a long time)

3)	Copy the blastagator_<device>.xml and blastagator_g2-common.xml 
	to your <SOURCE_TREE>/.repo/local_manifests folder.

4)	EDIT the manifest files.  Change the "revision" from whatever it
	is listed as to the name of the tag for the version you want to
	build.
		If you don't edit the revision, you will build the newest
		version.
	Be sure to change ONLY g2-common, vendor, kernel, twrp,
	and specific device.
		(Five things in total)

5)	Sync the repo again.

6)	Build recovery using cm_<device>-userdebug as the target.

NOTE: Do not extract blobs or run setup-makefiles!  This is not 
necessary because the vendor tree is repo sync'd automatically.
