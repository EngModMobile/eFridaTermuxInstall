cd $HOME

if ! (dpkg -l | grep -q python); then
   pkg install python -y
fi

if ! (dpkg -l | grep -q tar); then
   pkg install tar -y
fi


if [[ $(getprop ro.product.cpu.abi) == "arm64"* ]]; then
   curl -L  https://github.com/frida/frida/releases/download/16.2.0/frida-core-devkit-16.2.0-android-arm64.tar.xz > frida_core_devkit.tar.xz
else
   curl -L  https://github.com/frida/frida/releases/download/16.2.0/frida-core-devkit-16.2.0-android-arm.tar.xz > frida_core_devkit.tar.xz
fi

mkdir $HOME/frida-core

tar -xf frida_core_devkit.tar.xz -C ~/frida-core 

export FRIDA_CORE_DEVKIT=/data/data/com.termux/files/home/frida-core/

pip install frida==16.2.0
pip install frida-tools==12.3.0
