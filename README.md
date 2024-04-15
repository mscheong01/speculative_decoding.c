# speculative_decoding.c
minimal C implementation of speculative decoding on llama2 model.

<p align="center">
  <img src="image.png" width="300" height="300" alt="specdec llama">
</p>

what I basically did was fix the `llama2.c/run.c` file to support forwarding multiple tokens and implemented `speculative_decoding.c` using that.

Special thanks to: 

@karpathy for providing `llama2.c` as a starting point and inspiration for this project

 - `llama2.c/run.c` was copied along with license notations to this project.

@ggerganov for writing `llama.cpp` where I initially got the oppertunity to study and code spec-dec related stuff

## How to use
1. download base/draft models
```
wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories15M.bin
wget https://huggingface.co/karpathy/tinyllamas/resolve/main/stories42M.bin
```
2. build and run
```
make && ./speculative_decoding -m ./models/stories42M.bin -d ./models/stories15M.bin -n 256 -i "Once upon a time"   
```

### Meta llama2 models:
to use llama2 models, follow [the description written in llama2.c](https://github.com/karpathy/llama2.c?tab=readme-ov-file#metas-llama-2-models)

## References
```
@inproceedings{leviathan2023fast,
  title={Fast inference from transformers via speculative decoding},
  author={Leviathan, Yaniv and Kalman, Matan and Matias, Yossi},
  booktitle={International Conference on Machine Learning},
  pages={19274--19286},
  year={2023},
  organization={PMLR}
}
```
## some known issues
- The generation is constrained by the maximum sequence length of the draft model. Consequently, employing lengthy generation with speculative decoding is unfeasible with the current setup, when utilizing a draft model with a short maximum sequence length.

## License
MIT
I added the original copyright notice to the copied run.c file. Please let me know if I made any mistakes with the licensing.

## ETC
Any sort of feedback is very welcome :)

More speculative-decoding related C implementations are to come!

I'm thinking of https://github.com/SafeAILab/EAGLE next.
