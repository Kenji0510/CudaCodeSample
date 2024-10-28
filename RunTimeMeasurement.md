## Run command
nsys profile --stats=true ./vector_add

## #define N 100000000
out[tid] = a[tid] * b[tid];

```
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ nsys profile --stats=true ./vector_add 
WARNING: CPU IP/backtrace sampling not supported, disabling.
Try the 'nsys status --environment' command to learn more.

WARNING: CPU context switch tracing not supported, disabling.
Try the 'nsys status --environment' command to learn more.

PASSED
Generating '/tmp/nsys-report-ad62.qdstrm'
[1/8] [========================100%] report4.nsys-rep
[2/8] [========================100%] report4.sqlite
[3/8] Executing 'nvtx_sum' stats report
SKIPPED: /home/kenji/workspace/cuda/tutorial/build/report4.sqlite does not contain NV Tools Extension (NVTX) data.
[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)       Med (ns)      Min (ns)     Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  -------------  -------------  -----------  -----------  ------------  ----------------------
     52.9      656,851,850         16   41,053,240.6    8,774,041.0        1,534  156,090,253  52,606,396.4  poll                  
     40.3      500,074,730          1  500,074,730.0  500,074,730.0  500,074,730  500,074,730           0.0  pthread_cond_timedwait
      6.5       81,286,883        493      164,882.1        8,838.0          431   42,885,700   2,034,200.3  ioctl                 
      0.2        2,205,596         27       81,688.7        7,845.0        5,670    1,456,400     276,809.9  mmap64                
      0.0          212,466         45        4,721.5        3,016.0        1,273       20,911       4,294.3  fopen                 
      0.0          198,329         45        4,407.3        3,988.0        2,174        8,798       1,264.7  open64                
      0.0          182,112          9       20,234.7       20,108.0       14,879       25,739       4,069.2  sem_timedwait         
      0.0          144,897         17        8,523.4        3,167.0        1,503       79,743      18,550.7  mmap                  
      0.0          112,286          3       37,428.7       36,750.0       26,571       48,965      11,212.4  pthread_create        
      0.0           87,618          1       87,618.0       87,618.0       87,618       87,618           0.0  pthread_cond_wait     
      0.0           64,580         11        5,870.9        4,438.0        2,876       16,933       4,176.0  munmap                
      0.0           58,394         39        1,497.3        1,183.0          902        6,613       1,004.0  fclose                
      0.0           57,802         30        1,926.7           30.0           19       56,960      10,394.1  fgets                 
      0.0           46,722         11        4,247.5        4,389.0          481        5,741       1,457.8  write                 
      0.0           24,999         63          396.8          340.0          201        2,585         357.3  fcntl                 
      0.0           23,685          6        3,947.5        3,456.5        1,874        7,494       1,966.1  open                  
      0.0           20,129          6        3,354.8        1,798.5           40        8,797       3,871.7  fread                 
      0.0           14,949          3        4,983.0        6,271.0        2,335        6,343       2,293.5  pipe2                 
      0.0           12,332         14          880.9          597.0          450        2,465         591.3  read                  
      0.0           12,042          2        6,021.0        6,021.0        3,036        9,006       4,221.4  socket                
      0.0           10,411          1       10,411.0       10,411.0       10,411       10,411           0.0  fflush                
      0.0            8,598          3        2,866.0        1,313.0        1,172        6,113       2,812.9  pthread_cond_broadcast
      0.0            8,315          1        8,315.0        8,315.0        8,315        8,315           0.0  connect               
      0.0            6,150          6        1,025.0          786.0           80        2,784       1,050.7  fwrite                
      0.0            4,729          1        4,729.0        4,729.0        4,729        4,729           0.0  fopen64               
      0.0            1,984          7          283.4          290.0          220          361          54.7  dup                   
      0.0            1,283          1        1,283.0        1,283.0        1,283        1,283           0.0  bind                  
      0.0              621          1          621.0          621.0          621          621           0.0  listen                

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)     Min (ns)    Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  ------------  ------------  ----------  -----------  ------------  ----------------------
     64.5      182,414,152          3  60,804,717.3  22,421,802.0  21,742,142  138,250,208  67,070,623.2  cudaMemcpy            
     17.0       48,146,297          3  16,048,765.7      62,251.0      59,173   48,024,873  27,692,121.3  cudaMalloc            
     16.2       45,782,709          3  15,260,903.0   2,239,301.0     460,318   43,083,090  24,111,133.6  cudaFree              
      2.2        6,293,291          1   6,293,291.0   6,293,291.0   6,293,291    6,293,291           0.0  cudaLaunchKernel      
      0.0              531          1         531.0         531.0         531          531           0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances   Avg (ns)     Med (ns)    Min (ns)   Max (ns)   StdDev (ns)                     Name                   
 --------  ---------------  ---------  -----------  -----------  ---------  ---------  -----------  ------------------------------------------
    100.0        1,893,579          1  1,893,579.0  1,893,579.0  1,893,579  1,893,579          0.0  vector_add(float *, float *, float *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count    Avg (ns)       Med (ns)      Min (ns)     Max (ns)    StdDev (ns)           Operation          
 --------  ---------------  -----  -------------  -------------  -----------  -----------  -----------  ----------------------------
     75.5      135,847,751      1  135,847,751.0  135,847,751.0  135,847,751  135,847,751          0.0  [CUDA memcpy Device-to-Host]
     24.5       44,076,038      2   22,038,019.0   22,038,019.0   21,698,561   22,377,477    480,066.1  [CUDA memcpy Host-to-Device]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)           Operation          
 ----------  -----  --------  --------  --------  --------  -----------  ----------------------------
    800.000      2   400.000   400.000   400.000   400.000        0.000  [CUDA memcpy Host-to-Device]
    400.000      1   400.000   400.000   400.000   400.000        0.000  [CUDA memcpy Device-to-Host]

Generated:
    /home/kenji/workspace/cuda/tutorial/build/report4.nsys-rep
    /home/kenji/workspace/cuda/tutorial/build/report4.sqlite
```

## #define N 100000000 uint_8 
int temp = a[tid] - b[tid];

```
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ nsys profile --stats=true ./vector_add 
WARNING: CPU IP/backtrace sampling not supported, disabling.
Try the 'nsys status --environment' command to learn more.

WARNING: CPU context switch tracing not supported, disabling.
Try the 'nsys status --environment' command to learn more.

out[0] = 235
PASSED
Generating '/tmp/nsys-report-fcab.qdstrm'
[1/8] [========================100%] report1.nsys-rep
[2/8] [========================100%] report1.sqlite
[3/8] Executing 'nvtx_sum' stats report
SKIPPED: /home/kenji/workspace/cuda/tutorial/build/report1.sqlite does not contain NV Tools Extension (NVTX) data.
[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)    Med (ns)   Min (ns)   Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  ------------  ---------  --------  -----------  ------------  ----------------------
     85.0      258,414,196         12  21,534,516.3  989,974.5     1,362  157,604,677  45,736,187.8  poll                  
     13.7       41,778,820        493      84,744.1    8,928.0       450   15,057,191     792,241.2  ioctl                 
      0.7        2,196,143         27      81,338.6    8,166.0     6,372    1,430,619     271,813.6  mmap64                
      0.2          596,498          9      66,277.6   40,798.0    15,049      356,638     109,686.0  sem_timedwait         
      0.1          202,753         45       4,505.6    3,897.0     2,404        8,336       1,288.6  open64                
      0.1          201,330         43       4,682.1    2,746.0     1,182       30,068       5,454.1  fopen                 
      0.0          142,471         17       8,380.6    3,306.0     1,632       75,958      17,615.0  mmap                  
      0.0          108,138          3      36,046.0   33,304.0    24,117       50,717      13,510.3  pthread_create        
      0.0           92,108          1      92,108.0   92,108.0    92,108       92,108           0.0  pthread_cond_wait     
      0.0           60,924         30       2,030.8       30.0        29       60,006      10,949.8  fgets                 
      0.0           58,440         11       5,312.7    4,308.0     3,015       15,631       3,613.2  munmap                
      0.0           51,784         38       1,362.7    1,231.5       663        3,857         563.8  fclose                
      0.0           46,368         11       4,215.3    4,618.0       470        5,470       1,487.6  write                 
      0.0           29,778          7       4,254.0    4,889.0        50        8,998       4,090.4  fread                 
      0.0           25,019          6       4,169.8    3,661.5     2,024        8,037       2,069.5  open                  
      0.0           23,340         61         382.6      331.0       200        3,226         393.1  fcntl                 
      0.0           16,573          3       5,524.3    6,183.0     3,417        6,973       1,867.3  pipe2                 
      0.0           13,946         14         996.1      931.5       481        2,695         609.2  read                  
      0.0           13,106          1      13,106.0   13,106.0    13,106       13,106           0.0  connect               
      0.0           11,194          2       5,597.0    5,597.0     3,068        8,126       3,576.5  socket                
      0.0            8,496          3       2,832.0    1,383.0     1,242        5,871       2,632.8  pthread_cond_broadcast
      0.0            5,140          1       5,140.0    5,140.0     5,140        5,140           0.0  fopen64               
      0.0            4,588          2       2,294.0    2,294.0     1,453        3,135       1,189.4  fwrite                
      0.0            2,002          7         286.0      290.0       221          360          57.4  dup                   
      0.0            1,252          1       1,252.0    1,252.0     1,252        1,252           0.0  bind                  
      0.0              642          1         642.0      642.0       642          642           0.0  listen                

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)     Med (ns)    Min (ns)    Max (ns)   StdDev (ns)            Name         
 --------  ---------------  ---------  ------------  -----------  ---------  ----------  ------------  ----------------------
     52.7       53,845,318          3  17,948,439.3     62,772.0     43,644  53,738,902  30,995,451.4  cudaMalloc            
     44.1       45,117,361          3  15,039,120.3  5,945,998.0  5,523,944  33,647,419  16,116,641.0  cudaMemcpy            
      2.3        2,316,396          3     772,132.0  1,063,290.0    149,938   1,103,168     539,204.6  cudaFree              
      1.0          985,220          1     985,220.0    985,220.0    985,220     985,220           0.0  cudaLaunchKernel      
      0.0              501          1         501.0        501.0        501         501           0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances  Avg (ns)   Med (ns)   Min (ns)  Max (ns)  StdDev (ns)                                   Name                                  
 --------  ---------------  ---------  ---------  ---------  --------  --------  -----------  -----------------------------------------------------------------------
    100.0          524,228          1  524,228.0  524,228.0   524,228   524,228          0.0  vector_subtract(unsigned char *, unsigned char *, unsigned char *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count    Avg (ns)      Med (ns)     Min (ns)    Max (ns)   StdDev (ns)           Operation          
 --------  ---------------  -----  ------------  ------------  ----------  ----------  -----------  ----------------------------
     74.2       32,669,155      1  32,669,155.0  32,669,155.0  32,669,155  32,669,155          0.0  [CUDA memcpy Device-to-Host]
     25.8       11,382,949      2   5,691,474.5   5,691,474.5   5,479,489   5,903,460    299,792.8  [CUDA memcpy Host-to-Device]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)           Operation          
 ----------  -----  --------  --------  --------  --------  -----------  ----------------------------
    200.000      2   100.000   100.000   100.000   100.000        0.000  [CUDA memcpy Host-to-Device]
    100.000      1   100.000   100.000   100.000   100.000        0.000  [CUDA memcpy Device-to-Host]

Generated:
    /home/kenji/workspace/cuda/tutorial/build/report1.nsys-rep
    /home/kenji/workspace/cuda/tutorial/build/report1.sqlite
```