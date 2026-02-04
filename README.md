# Description
A Tensorflow implementation of DnCNN, *'Beyond a Gaussian Denoiser: Residual Learning of Deep CNN for Image Denoising' TIP2017*, paper.
Original code is [here](https://github.com/crisb-DUT/DnCNN-tensorflow) but this code covers only a Gaussian denoiser.

This fork extends the JPEG deblocking implementation with the following changes:

### Changes from original
- **RGB image support**: Added `run_RGB` phase for processing color images (processes each channel separately)
- **Inference mode**: Added `run` and `run_RGB` phases for batch processing images from `./in/` to `./out/` without PSNR comparison
- **QoL**: Files are processed in natural sort order, and `quality` is now an argument

## Model architecture
![Alt text](/git_img/model.png)

## Usage

### Run (inference on RGB images)
Place input images in `./in/` as PNG files, then:
```
$ python main.py
```
Or explicitly:
```
$ python main.py --phase run_RGB --quality 20
```
Output will be saved to `./out/`.

### Run (inference on grayscale images)
```
$ python main.py --phase run
```

### Train
```
$ python generate_patches.py
$ python main.py --phase train
```

### Test
```
$ python main.py --phase test
```

### Command-line arguments
| Argument | Default | Description |
|----------|---------|-------------|
| `--quality` | 20 | JPEG quality factor (1-100) |
| `--phase` | run_RGB | Mode: `train`, `test`, `run`, or `run_RGB` |
| `--checkpoint_dir` | ./checkpoint | Directory for model checkpoints |
| `--test_dir` | ./out | Output directory for inference |

## Result
input : ![Alt text](/git_img/result_noisy.png)
output : ![Alt text](/git_img/result_denoised.png)

## Reference
[https://github.com/crisb-DUT/DnCNN-tensorflow](https://github.com/crisb-DUT/DnCNN-tensorflow)

