# 定义参数
machOPath="${BUILT_PRODUCTS_DIR}/${TARGET_NAME}.app/${TARGET_NAME}"
currentDir=$(dirname "$PWD")
loadJsonPath="${currentDir}/LoadMangerDemo/LoadManageScript/load_config.json"

# Modify load symbol: load -> czld
./LoadManageScript/MachOLoadModifier "${machOPath}" "${machOPath}" "load" "czld" "C String Literals" "(__TEXT,__objc_methname)"

# Check if there are new load method added into project but load_config.json file doesn't update.
./LoadManageScript/MachOInspect "${machOPath}" "${loadJsonPath}"
exitCode=$?

if [ $exitCode -ne 0 ]
    then
    echo "[ERROR]: New load method class are added in the project but load_config.json doesn't update."
    exit 1
fi
