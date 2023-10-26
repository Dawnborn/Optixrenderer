#!/bin/bash

BIN_PATH="/storage/user/lhao/hjp/ws_optix/Optixrenderer/buildnode10/bin"

# C_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/60frame0551_00/cam60_interpolated/cam60_interpolated.txt"
# C_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/cam.txt"
C_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/60frame0551_00newtable/cam60.txt"
C_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/60frame0551_00newtable/cam60_interpolated/cam60_interpolated.txt"

F_PATH="/storage/user/lhao/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/main_hjp_newtable.xml"

# OUTPUT_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/60frame0551_00/cam60_interpolated"
OUTPUT_PATH="/home/wiss/lhao/storage/user/hjp/ws_optix/assets/ttt/tt/Scenes/xml/000scene0551_00/newtableandmonitor"

mkdir $OUTPUT_PATH/pfm 
mkdir $OUTPUT_PATH/basecolor
mkdir $OUTPUT_PATH/normal
mkdir $OUTPUT_PATH/roughness
mkdir $OUTPUT_PATH/mask
mkdir $OUTPUT_PATH/depth
mkdir $OUTPUT_PATH/metallic

# Declare an associative array
declare -A MODE_DICT
# Add key-value pairs
MODE_DICT["0"]="pfm"
MODE_DICT["1"]="basecolor"
MODE_DICT["2"]="normal"
MODE_DICT["3"]="roughness"
MODE_DICT["4"]="mask"
MODE_DICT["5"]="depth"
MODE_DICT["6"]="metallic"

MODES_TO_USE=(1 5)

CAM_START="0"
CAM_END="700"

FORCE_OUTPUT="--forceOutput"
# FORCE_OUTPUT=""

# 使用for循环设置M为列表中的值
for M in "${MODES_TO_USE[@]}"; do
    echo "Current value of M is: $M"
    # 这里可以执行其他操作，使用$M作为当前的值
    $BIN_PATH/optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/${MODE_DICT[$M]}/bgr.pfm --camStart $CAM_START --camEnd $CAM_END -m $M $FORCE_OUTPUT
done

