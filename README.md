Created by: Angelo Jacobo   
Date: August 14,2021   

# Inside the src folder are:   
* asyn_fifo.v -> Asynchronous fifo module. Specs are given below.  
* asyn_fifo_TB.v -> Testbench for asyn_fifo module. Test cases are:  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - write data until full  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - read data until empty  
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; - read data while simultaneously writing data  

# Waveform[WRITING]:
![write](https://user-images.githubusercontent.com/87559347/129466377-127dbd75-4217-4378-8a58-3c9cb801a970.png)

# Waveform[READING]:
![read](https://user-images.githubusercontent.com/87559347/129466378-5e9abc88-6936-4518-991d-77ef2b3dd21a.png)

# TASK:  
This project implemented a fifo with separate clock domains for read and write. Specs are:    
* Reconfigurable memory width and depth
* Infers block ram resource of the FPGA
* Provides data count of the words available for reading. Sync to either read/write clock domains
* Read mode is First-Word Fall-Through
* Reset type is asynchronous

