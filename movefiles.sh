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

# pair jpg and csv with the same name
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

# rename images from ImageNet to the naming conventions of miniImagenet
# put all images needed in miniImagenet in "images" folder
#! /bin/bash
cd /home/wuhan/datasets/miniImagenet/
{
    read
    while IFS=, read -r file label || [ -n "$file" ]; 
    do
        category=${file:0:9}
        fileidx=${file:9:9}
        # remove the zeros
        idx=$(echo $fileidx | sed 's/^0*//')
        filename=$category"_"$idx"JPEG"
        echo "$filename"
        cp /dataset/eval_dataset/imagenet/cicANDcod/original_images/images/$filename /home/wuhan/datasets/miniImagenet/images/$file
    done 
} < train.csv