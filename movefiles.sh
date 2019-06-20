# put train AU files from folder 1 to folder 23 (both included) to the dir
#! /bin/bash
for idx in $(seq -w 1 23)
do
    cd ~/Documents/10${idx}
    for file in `ls`;
    do
        cp ~/Documents/10${idx}/$file ~/Desktop/GANimation-master/sample_dataset/ImgsAUs/
    done
done

# generate train.csv
#! /bin/bash
for idx in $(seq -w 1 23)
do
    cd ~/Documents/10${idx}
    for file in `ls`; 
    do
        if [ "${file##*.}" == "csv" ]; then
            echo "${file%%.*}.jpg" >> ~/Documents/train.txt
        fi
    done
done

# put test AU files from folder 24 to folder 30 (both included) to the dir
#! /bin/bash
for idx in $(seq -w 24 30)
do
    cd ~/Documents/10${idx}
    for file in `ls`;
    do
        cp ~/Documents/10${idx}/$file ~/Desktop/GANimation-master/sample_dataset/ImgsAUs/
    done
done

# generate test.csv
#! /bin/bash
for idx in $(seq -w 24 30)
do
    cd ~/Documents/10${idx}
    for file in `ls`; 2
    do
        if [ "${file##*.}" == "csv" ]; then
            echo "${file%%.*}.jpg" >> ~/Documents/test.txt
        fi
    done
done

# put all images to the dir
#! /bin/bash
for idx in $(seq -w 1 30)
do
    cd ~/Desktop/GANimation-master/sample_dataset/imgs/10${idx}
    for file in `ls`;
    do
        cp $file ~/Desktop/GANimation-master/sample_dataset/ImgsAUs/
    done
done
