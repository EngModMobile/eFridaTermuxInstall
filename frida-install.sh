cd $HOME

if ! (dpkg -l | grep -q python); then
   pkg install python -y
fi

if ! (dpkg -l | grep -q tar); then
   pkg install tar -y
fi

if ! (dpkg -l | grep -q jq); then
   pkg install jq -y
fi

latest_version=$(curl -s https://api.github.com/repos/frida/frida/releases/latest | jq -r '.tag_name')


if [[ $(getprop ro.product.cpu.abi) == "arm64"* ]]; then
   curl -L  https://github.com/frida/frida/releases/download/$latest_version/frida-core-devkit-$latest_version-android-arm64.tar.xz > frida_core_devkit.tar.xz
else
   curl -L  https://github.com/frida/frida/releases/download/$latest_version/frida-core-devkit-$latest_version-android-arm.tar.xz > frida_core_devkit.tar.xz
fi

   mkdir $HOME/frida-core

tar -xf frida_core_devkit.tar.xz -C ~/frida-core 

export FRIDA_CORE_DEVKIT=/data/data/com.termux/files/home/frida-core/

pip install frida-tools
