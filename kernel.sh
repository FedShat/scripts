export CHAT_ID="-1001115967921"
export PRODUCT_FILENAME="AlpacaKernel-*.zip"
export KBUILD_BUILD_USER="fedshat"
export KBUILD_BUILD_HOST="fedshatci"
export TZ=Europe/Moscow
export KERNEL_USE_CCACHE=1

python3 ~/build/PublishBot/main.py --before
export FILENAME="AlpacaKernel-v4-GCC-9.x-LTO-$(date +"%y%m%d")-$(date +"%H%M").zip"

rm .config
echo "========== Making defconfig =========="
make O=out ARCH=arm64 platina_defconfig

echo "========== Building kernel =========="
make -j$(nproc --all) O=out ARCH=arm64 CROSS_COMPILE=~/build/tools/arm64-gcc/bin/aarch64-elf-

if [ -f "out/arch/arm64/boot/Image.gz-dtb" ]; then
    echo "========== Build succeed =========="
    mv out/arch/arm64/boot/Image.gz-dtb ~/build/AK3
    cd ~/build/AK3
    zip -r9 $FILENAME * -x .git $FILENAME
else
    echo "========== Build failed =========="
fi
python3 ~/build/PublishBot/main.py --after
rm ~/time
rm ~/build/AK3/*.zip
cd ~/build/kernel_xiaomi_platina
