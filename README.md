# tensorflow-kernel-gateway-test

To build:

        docker build --tag test .

The notebook viewer and editor works fine. Run this, go to the link, edit `test.ipynb`, and click "Run" in the cells:

        docker run -it --rm -p 8888:8888 test jupyter notebook --allow-root

But running the causes an error:

        docker run -it --rm -p 8888:8888 test jupyter kernelgateway

Currently I get:

```
[KernelGatewayApp] Kernel started: c0bc4f14-66cb-440a-93a2-97537791e6ca
[KernelGatewayApp] Kernel shutdown: c0bc4f14-66cb-440a-93a2-97537791e6ca
Traceback (most recent call last):
  File "/usr/local/bin/jupyter-kernelgateway", line 11, in <module>
    sys.exit(launch_instance())
  File "/usr/local/lib/python2.7/dist-packages/jupyter_core/application.py", line 266, in launch_instance
    return super(JupyterApp, cls).launch_instance(argv=argv, **kwargs)
  File "/usr/local/lib/python2.7/dist-packages/traitlets/config/application.py", line 657, in launch_instance
    app.initialize(argv)
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/gatewayapp.py", line 363, in initialize
    self.init_configurables()
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/gatewayapp.py", line 417, in init_configurables
    self.personality.init_configurables()
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/notebook_http/__init__.py", line 78, in init_configurables
    self.parent.kernel_manager
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/services/kernels/pool.py", line 68, in __init__
    super(ManagedKernelPool, self).__init__(prespawn_count, kernel_manager)
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/services/kernels/pool.py", line 30, in __init__
    self.kernel_manager.start_seeded_kernel()
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/services/kernels/manager.py", line 72, in start_seeded_kernel
    return ioloop.IOLoop.current().run_sync(start)
  File "/usr/local/lib/python2.7/dist-packages/tornado/ioloop.py", line 581, in run_sync
    return future_cell[0].result()
  File "/usr/local/lib/python2.7/dist-packages/tornado/concurrent.py", line 260, in result
    raise_exc_info(self._exc_info)
  File "/usr/local/lib/python2.7/dist-packages/tornado/gen.py", line 1113, in run
    yielded = self.gen.send(value)
  File "/usr/local/lib/python2.7/dist-packages/kernel_gateway/services/kernels/manager.py", line 109, in start_kernel
    raise RuntimeError('Error seeding kernel memory', msg['content'])
RuntimeError: ('Error seeding kernel memory', {u'status': u'error', u'ename': u'ImportError', u'evalue': u'No module named datalab.bigquery', u'traceback': [u'\x1b[0;31m---------------------------------------------------------------------------\x1b[0m', u'\x1b[0;31mImportError\x1b[0m                               Traceback (most recent call last)', u'\x1b[0;32m<ipython-input-1-e85e1182f9f6>\x1b[0m in \x1b[0;36m<module>\x1b[0;34m()\x1b[0m\n\x1b[0;32m----> 1\x1b[0;31m \x1b[0;32mimport\x1b[0m \x1b[0mgoogle\x1b[0m\x1b[0;34m.\x1b[0m\x1b[0mdatalab\x1b[0m\x1b[0;34m.\x1b[0m\x1b[0mbigquery\x1b[0m \x1b[0;32mas\x1b[0m \x1b[0mbq\x1b[0m\x1b[0;34m\x1b[0m\x1b[0m\n\x1b[0m\x1b[1;32m      2\x1b[0m \x1b[0;32mfrom\x1b[0m \x1b[0mgoogle\x1b[0m\x1b[0;34m.\x1b[0m\x1b[0mcloud\x1b[0m \x1b[0;32mimport\x1b[0m \x1b[0mbigquery\x1b[0m\x1b[0;34m\x1b[0m\x1b[0m\n\x1b[1;32m      3\x1b[0m \x1b[0;32mfrom\x1b[0m \x1b[0mgoogle\x1b[0m\x1b[0;34m.\x1b[0m\x1b[0mcloud\x1b[0m\x1b[0;34m.\x1b[0m\x1b[0mexceptions\x1b[0m \x1b[0;32mimport\x1b[0m \x1b[0mNotFound\x1b[0m\x1b[0;34m\x1b[0m\x1b[0m\n\x1b[1;32m      4\x1b[0m \x1b[0;32mimport\x1b[0m \x1b[0mdatetime\x1b[0m\x1b[0;34m\x1b[0m\x1b[0m\n\x1b[1;32m      5\x1b[0m \x1b[0;32mimport\x1b[0m \x1b[0mtime\x1b[0m\x1b[0;34m\x1b[0m\x1b[0m\n', u'\x1b[0;31mImportError\x1b[0m: No module named datalab.bigquery'], u'execution_count': 1, u'user_expressions': {}, u'engine_info': {u'engine_id': -1, u'method': u'execute', u'engine_uuid': u'9ef1118e-3f6a-4187-b1af-fbadafa81dfe'}, u'payload': []})
~
```
