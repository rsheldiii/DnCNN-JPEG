import tensorflow as tf

from .dncnn_jpeg.model import denoiser

class Denoiser:
    def __init__(self, denoise_level=20):
        gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.8)
        self.sess = tf.Session(config=tf.ConfigProto(gpu_options=gpu_options)) # ,  log_device_placement=True
        self.model = denoiser(self.sess)
        self.model.load_model('./libraries/dncnn_jpeg/checkpoints/checkpoint_{}'.format(denoise_level))

    def process(self, img):
        return self.model.process_RGB(img)

    def __del__(self):
        self.sess.close()
