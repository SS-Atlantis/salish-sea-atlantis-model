folder1="$1"
folder2="$2"
Output_Folder1="/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output$folder1/outputSalishSea.nc"
Output_Folder2="/datasets/work/oa-alantis/work/Salish_Sea_Atlantis_model/outputs/output$folder2/outputSalishSea.nc"
java  -Dimage.path=/home/por07g/Desktop/Calibration_tools/Olive/Olive/images/ -DworldCoast=/home/por07g/Desktop/Calibration_tools/Olive/Olive/coasts/world.cst -DbmTemplate=/home/por07g/Desktop/Calibration_tools/Olive/Olive/bm.tpl -cp /home/por07g/Desktop/Calibration_tools/Olive/Olive/Olive2Jar.jar cmr.apps.olive.Olive $Output_Folder1 &
java  -Dimage.path=/home/por07g/Desktop/Calibration_tools/Olive/Olive/images/ -DworldCoast=/home/por07g/Desktop/Calibration_tools/Olive/Olive/coasts/world.cst -DbmTemplate=/home/por07g/Desktop/Calibration_tools/Olive/Olive/bm.tpl -cp /home/por07g/Desktop/Calibration_tools/Olive/Olive/Olive2Jar.jar cmr.apps.olive.Olive $Output_Folder2 &
