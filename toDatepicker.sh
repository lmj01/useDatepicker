#/usr/bin/bash 
str="sfe-wsl"
# copy js
# sass/{*,.*} 如何要拷贝隐藏内容
if [ $str = "sfe-wsl" ]; then 
    cp -r ./js/* ~/sfebackend/src/third/datepicker/js/
    cp -r ./scss/* ~/sfebackend/src/third/datepicker/scss/ 
    cp ./DateRange.vue ~/sfebackend/src/third/datepicker
    cp ./PickDateRange.vue ~/sfebackend/src/third/datepicker
    cp ./PickDate.vue ~/sfebackend/src/third/datepicker
else 
    echo "un-special type"
fi 
