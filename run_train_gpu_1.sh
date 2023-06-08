export CUDA_VISIBLE_DEVICES="1"
export CUDA_LAUNCH_BLOCKING=1

metaseq-train --task streaming_language_modeling \
                ../Molecular_Generation_with_GDB13/data-bin_1/ \
                --sample-break-mode "complete" \
                --hf-tokenizer ../Molecular_Generation_with_GDB13/Data/tokenizers/tokenizer_selfies/tokenizer.json \
                --train-subset train \
                --valid-subset valid \
                --combine-valid-subsets \
                --no-reshard-after-forward \
                --use-sharded-state \
                --checkpoint-activations \
                --full-megatron-init \
                --megatron-init-sigma 0.006 \
                --activation-fn relu \
                --arch transformer_lm \
                --share-decoder-input-output-embed \
                --decoder-layers 4 \
                --decoder-embed-dim 128 \
                --decoder-ffn-embed-dim 512 \
                --decoder-attention-heads 2 \
                --decoder-learned-pos \
                --no-scale-embedding \
                --dropout 0.1 \
                --attention-dropout 0.1 \
                --no-emb-dropout \
                --weight-decay 0.1 \
                --optimizer adam \
                --adam-betas  "(0.9, 0.95)" \
                --adam-eps 1e-08 \
                --clip-norm 1.0 \
                --clip-norm-type l2 \
                --criterion cross_entropy \
                --required-batch-size-multiple 1 \
                --distributed-world-size 1 \
                --model-parallel-size 1 \
                --ddp-backend pytorch_ddp \
                --memory-efficient-fp16 \
                --fp16-init-scale 4 \
                --fp16 \
                --seed 1 \
                --num-workers 4 \
                --num-workers-valid 4 \
                --lr-scheduler polynomial_decay \
                --lr 0.0001 \
                --end-learning-rate 0.00001 \
                --warmup-updates 3000 \
                --total-num-update 360000 \
                --max-update 360000 \
                --tokens-per-sample 64 \
                --batch-size 1024 \
                --update-freq 1 \
                --log-format json \
                --log-interval 1 \
                --ignore-unused-valid-subsets \
                --validate-interval-updates 976 \
                --wandb-project Molecular_Generation_with_GDB13 \
                --wandb-run-name "Aspirin_0.4_selfies"\
                --save-interval-updates 1000 \
                --save-dir "./Checkpoints/Aspirin_0.4_selfies/" \
                --restore-file "" \