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

# generate train.txt
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

# generate test.txt
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

# pair jpg and csv
#! /bin/bash
cd ~/Desktop/GANimation-master/sample_dataset/imgs/
for file in *.csv;
    do
        file=${file:0:18}
        filename=$file".jpg"
        if [ -f "$filename" ]; then
            echo $filename >> ~/Desktop/GANimation-master/sample_dataset/filename.txt
        else
            echo $filename >> ~/Desktop/GANimation-master/sample_dataset/nosuchfile.txt
        fi
    done
