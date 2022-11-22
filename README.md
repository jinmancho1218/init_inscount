# Pin tool for getting initialization instruction count

## Requirements 
- Intel Pin installation (https://software.intel.com/en-us/articles/pintool/). The ```Makefile``` tries to find your Pin installation in ```/home``` and ```/opt```. You can override the path manually in the top of the ```Makefile```. Note that Pin version 3.x is currently required.

## Usage

Build profiler:

    $ make PIN_ROOT=<YOUR_PIN_PATH>

Run profiler:

    $ ./get_init_icount.sh <MODEL NAME>

