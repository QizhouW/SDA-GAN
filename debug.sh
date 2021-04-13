#!/bin/bash
#SBATCH -N 1
#SBATCH --partition=batch
#SBATCH -J Job
#SBATCH -o Job.%J.out
#SBATCH -e Job.%J.err
#SBATCH --time=20:00:00
#SBATCH --mem=32G
#SBATCH --gres=gpu:1
#SBATCH --cpus-per-task=6
#SBATCH --constraint=[v100]

#run the application:

python ./debug.py --dataroot ~/dataset/horse2zebra/ --name horse2zebra_SDA --model sda_gan --dataset_mode unaligned --pool_size 50 --no_dropout --norm instance --lambda_A 5 --lambda_B 10 --lambda_identity 0.5 --load_size 256 --crop_size 256 --batch_size 8 --niter 100 --niter_decay 100 --gpu_ids 0 --display_id 0 --display_freq 100 --print_freq 100 --direction AtoB --save_epoch_freq 40 --saveDisk #--display_server http://glogin.ibex.kaust.edu.sa
