FROM tensorflow/tensorflow
RUN pip install jupyter_kernel_gateway
COPY test.ipynb .
COPY jupyter_kernel_gateway_config.py /root/.jupyter/
CMD ["jupyter", "kernelgateway"]
