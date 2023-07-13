#!/bin/bash

SCENE_NAME = "scene0690_00"
OUTPUT_PATH="/media/gpuadmin/4TB/haoang/junpeng/assets/ttt/tt/scenes/xml/0$SCENE_NAME"
C_PATH="/home/senorgroup_hty/haoang/junpeng/ws_optix/haoanglookat/output_lookats_ups_origs_final3/$SCENE_NAME.txt"
F_PATH="/media/gpuadmin/4TB/haoang/junpeng/assets/ttt/tt/scenes/xml/0$SCENE_NAME/main.xml"

BIN_PATH="/home/senorgroup_hty/haoang/junpeng/ws_optix/OptixRenderer/build_pfm/bin"
CAM_END = "300"

# cd $OUTPUT_PATH
# mkdir basecolor normal roughness mask depth metallic pfm

# cd $BIN_PATH
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/basecolor/bgr.pfm --camEnd $CAM_END -m 1
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/normal/bgr.pfm --camEnd $CAM_END -m 2
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/roughness/bgr.pfm --camEnd $CAM_END -m 3
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/mask/bgr.pfm --camEnd $CAM_END -m 4
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/depth/bgr.pfm --camEnd $CAM_END -m 5
./optixRenderer -f $F_PATH -c $C_PATH -o $OUTPUT_PATH/metallic/bgr.pfm --camEnd $CAM_END -m 6