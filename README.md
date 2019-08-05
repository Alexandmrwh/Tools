# Tools
Basic preprocesses of datasets and other common functions are recorded, including
- Face detection
- File organization
- Txt file convert to csv
- Dockerfile: basics, pytorch1.1.0 with CUDA support (still need to simplify and augment) 


| Model         | image size | # FLOPs | # params | mAP (1x/2x) |
| :------------ |:----------:|:-------:|:--------:|:-------------:|
| mv2-c128 1-stage w/o freeze | 1280x800 |  | 　| 28.0/31.2 |
| mv2-c128 2-stage w/o freeze | 1280x800 |  | 　| 28.4/- |
| mv2-c128 1-stage w/ freeze  | 1280x800 |  | 　| 23.7/29.9 |
| mv2-c128 2-stage w/ freeze  | 1280x800 |  | 　| 28.3/- |
| mv2-c128 1-stage SyncBN     | 1280x800 |  | 　| 29.2/31.6 |
| mv2-c128 2-stage SyncBN     | 1280x800 |  | 　| 29.5/32.2,30.0 |
| mv2-c256 1-stage SyncBN     | 1280x800 |  | 　| -/33.2 |
| mv2-c256 2-stage SyncBN     | 1280x800 |  | 　| 30.1/- |


Batch: 4(img)x8(GPU) lr=0.02, means lr=0.01
$`\dagger`$ means
