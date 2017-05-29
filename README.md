# TWRP tree for the Nexus 6P (angler)

Initialize your repo:

```bash
repo init --depth=1 -u git://github.com/minimal-manifest-twrp/platform_manifest_twrp_omni.git -b twrp-6.0
```

Then grab my local manifest (you must have GitHub SSH keys set up):

```bash
mkdir -p .repo/local_manifests
cd .repo/local_manifests
wget https://raw.githubusercontent.com/nathanchance/local_manifests/master/twrp-f2fs-6.0.xml
```

Sync down the sources:

```bash
repo sync --force-sync -j$(nproc --all) -c
```

Then build:

```bash
source build/envsetup.sh
lunch omni_angler-eng
mka recoveryimage
```
