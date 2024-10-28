## In the case <<<1, 1>>>
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ time ./vector_add 
out[0] = 0.000000
PASSED

real    0m0.558s
user    0m0.470s
sys     0m0.085s

## In the case <<<1, 256>>>
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ time ./vector_add 
out[0] = 0.000000
PASSED

real    0m0.139s
user    0m0.051s
sys     0m0.081s

## In the case <<<grid_size, block_size>>>
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ time ./vector_add 
out[0] = 3.000000
PASSED

real    0m0.145s
user    0m0.053s
sys     0m0.090s

## nsys profile --stats=true ./vector_add
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ nsys profile --stats=true ./vector_add 
WARNING: CPU IP/backtrace sampling not supported, disabling.
Try the 'nsys status --environment' command to learn more.

WARNING: CPU context switch tracing not supported, disabling.
Try the 'nsys status --environment' command to learn more.

PASSED
Generating '/tmp/nsys-report-0bb1.qdstrm'
[1/8] [========================100%] report2.nsys-rep
[2/8] [========================100%] report2.sqlite
[3/8] Executing 'nvtx_sum' stats report
SKIPPED: /home/kenji/workspace/cuda/tutorial/build/report2.sqlite does not contain NV Tools Extension (NVTX) data.
[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)     Med (ns)    Min (ns)   Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  ------------  -----------  --------  -----------  ------------  ----------------------
     93.9      657,776,261         16  41,111,016.3  8,973,442.0       892  157,036,555  52,774,736.1  poll                  
      5.6       39,009,384        493      79,126.5      9,888.0       441    9,978,393     608,389.2  ioctl                 
      0.3        2,179,381         27      80,717.8      8,497.0     6,643    1,421,927     270,133.2  mmap64                
      0.0          280,375          9      31,152.8     38,285.0    13,537       42,702      12,748.1  sem_timedwait         
      0.0          209,364         45       4,652.5      4,117.0     2,314       12,384       1,593.4  open64                
      0.0          175,530         43       4,082.1      2,866.0     1,173       19,538       3,642.1  fopen                 
      0.0          144,968         17       8,527.5      3,167.0     1,533       75,515      17,502.3  mmap                  
      0.0          102,790          3      34,263.3     31,582.0    23,997       47,211      11,837.0  pthread_create        
      0.0           85,204          1      85,204.0     85,204.0    85,204       85,204           0.0  pthread_cond_wait     
      0.0           61,166         30       2,038.9         30.0        19       60,266      10,997.4  fgets                 
      0.0           56,549         11       5,140.8      4,038.0     1,853       19,558       4,905.2  munmap                
      0.0           49,937         38       1,314.1      1,202.5       642        3,126         456.0  fclose                
      0.0           34,729         11       3,157.2      3,627.0       371        4,969       1,235.1  write                 
      0.0           28,314         14       2,022.4        897.0       330       15,880       4,028.2  read                  
      0.0           26,093          6       4,348.8      3,897.5     2,064        7,816       1,898.3  open                  
      0.0           23,247         61         381.1        351.0       200        2,786         329.7  fcntl                 
      0.0           21,522          7       3,074.6      1,383.0        50        8,507       3,791.8  fread                 
      0.0           15,070          3       5,023.3      5,961.0     2,215        6,894       2,476.4  pipe2                 
      0.0           13,626          2       6,813.0      6,813.0     2,986       10,640       5,412.2  socket                
      0.0           10,339          3       3,446.3      2,755.0     1,132        6,452       2,726.5  pthread_cond_broadcast
      0.0            9,487          1       9,487.0      9,487.0     9,487        9,487           0.0  connect               
      0.0            5,430          1       5,430.0      5,430.0     5,430        5,430           0.0  fopen64               
      0.0            3,698          2       1,849.0      1,849.0     1,423        2,275         602.5  fwrite                
      0.0            1,943          7         277.6        300.0       210          361          55.2  dup                   
      0.0            1,494          1       1,494.0      1,494.0     1,494        1,494           0.0  bind                  
      0.0              601          1         601.0        601.0       601          601           0.0  listen                

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)      Med (ns)     Min (ns)    Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  ------------  ------------  ----------  -----------  ------------  ----------------------
     77.0      176,673,804          3  58,891,268.0  22,441,485.0  21,716,093  132,516,226  63,762,115.5  cudaMemcpy            
     20.6       47,255,111          3  15,751,703.7      58,503.0      52,522   47,144,086  27,186,600.8  cudaMalloc            
      2.0        4,620,373          3   1,540,124.3   2,112,460.0     296,493    2,211,420   1,078,152.3  cudaFree              
      0.4          949,844          1     949,844.0     949,844.0     949,844      949,844           0.0  cudaLaunchKernel      
      0.0              490          1         490.0         490.0         490          490           0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances   Avg (ns)     Med (ns)    Min (ns)   Max (ns)   StdDev (ns)                     Name                   
 --------  ---------------  ---------  -----------  -----------  ---------  ---------  -----------  ------------------------------------------
    100.0        1,889,874          1  1,889,874.0  1,889,874.0  1,889,874  1,889,874          0.0  vector_add(float *, float *, float *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count    Avg (ns)       Med (ns)      Min (ns)     Max (ns)    StdDev (ns)           Operation          
 --------  ---------------  -----  -------------  -------------  -----------  -----------  -----------  ----------------------------
     74.7      130,150,521      1  130,150,521.0  130,150,521.0  130,150,521  130,150,521          0.0  [CUDA memcpy Device-to-Host]
     25.3       44,073,187      2   22,036,593.5   22,036,593.5   21,676,958   22,396,229    508,601.4  [CUDA memcpy Host-to-Device]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)  Med (MB)  Min (MB)  Max (MB)  StdDev (MB)           Operation          
 ----------  -----  --------  --------  --------  --------  -----------  ----------------------------
    800.000      2   400.000   400.000   400.000   400.000        0.000  [CUDA memcpy Host-to-Device]
    400.000      1   400.000   400.000   400.000   400.000        0.000  [CUDA memcpy Device-to-Host]

Generated:
    /home/kenji/workspace/cuda/tutorial/build/report2.nsys-rep
    /home/kenji/workspace/cuda/tutorial/build/report2.sqlite

## 
kenji@ubuntu2204:~/workspace/cuda/tutorial/build$ nsys profile --stats=true ./vector_add 
WARNING: CPU IP/backtrace sampling not supported, disabling.
Try the 'nsys status --environment' command to learn more.

WARNING: CPU context switch tracing not supported, disabling.
Try the 'nsys status --environment' command to learn more.

PASSED
Generating '/tmp/nsys-report-a83e.qdstrm'
[1/8] [========================100%] report3.nsys-rep
[2/8] [========================100%] report3.sqlite
[3/8] Executing 'nvtx_sum' stats report
SKIPPED: /home/kenji/workspace/cuda/tutorial/build/report3.sqlite does not contain NV Tools Extension (NVTX) data.
[4/8] Executing 'osrt_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)       Med (ns)      Min (ns)     Max (ns)    StdDev (ns)            Name         
 --------  ---------------  ---------  -------------  -------------  -----------  -----------  ------------  ----------------------
     53.1    4,066,650,024         50   81,333,000.5  100,140,251.0          962  160,756,804  40,870,126.8  poll                  
     45.7    3,500,577,914          7  500,082,559.1  500,082,966.0  500,071,219  500,095,904       8,132.4  pthread_cond_timedwait
      1.2       89,177,555        493      180,887.5        9,307.0          441   46,059,667   2,183,378.8  ioctl                 
      0.0        2,212,976         27       81,962.1        7,625.0        6,282    1,454,077     276,401.1  mmap64                
      0.0          301,461          9       33,495.7       40,589.0       16,981       44,586      12,042.0  sem_timedwait         
      0.0          201,627         45        4,480.6        4,068.0        2,314        7,825       1,249.1  open64                
      0.0          161,579         43        3,757.7        2,846.0        1,263       13,595       2,701.9  fopen                 
      0.0          146,733         17        8,631.4        3,847.0        1,403       75,054      17,361.0  mmap                  
      0.0          110,183          3       36,727.7       35,168.0       27,664       47,351       9,935.7  pthread_create        
      0.0           87,218          1       87,218.0       87,218.0       87,218       87,218           0.0  pthread_cond_wait     
      0.0           57,785         30        1,926.2           30.0           19       56,960      10,394.2  fgets                 
      0.0           53,715         11        4,883.2        4,088.0        1,993       16,461       3,931.1  munmap                
      0.0           49,051         38        1,290.8        1,162.5          782        3,206         466.4  fclose                
      0.0           44,668         11        4,060.7        4,468.0          481        5,330       1,406.9  write                 
      0.0           24,534          6        4,089.0        3,762.0        1,913        7,824       2,032.9  open                  
      0.0           24,175         61          396.3          340.0          200        3,908         483.1  fcntl                 
      0.0           22,983          7        3,283.3        1,804.0           59        9,128       3,827.7  fread                 
      0.0           14,338         14        1,024.1          892.0          471        2,796         609.7  read                  
      0.0           13,765          3        4,588.3        5,140.0        2,534        6,091       1,841.6  pipe2                 
      0.0           13,124          2        6,562.0        6,562.0        3,136        9,988       4,845.1  socket                
      0.0            9,197          3        3,065.7        1,332.0        1,002        6,863       3,292.7  pthread_cond_broadcast
      0.0            8,626          1        8,626.0        8,626.0        8,626        8,626           0.0  connect               
      0.0            5,259          1        5,259.0        5,259.0        5,259        5,259           0.0  fopen64               
      0.0            3,818          2        1,909.0        1,909.0        1,503        2,315         574.2  fwrite                
      0.0            2,005          7          286.4          270.0          220          371          60.5  dup                   
      0.0            1,253          1        1,253.0        1,253.0        1,253        1,253           0.0  bind                  
      0.0              622          1          622.0          622.0          622          622           0.0  listen                

[5/8] Executing 'cuda_api_sum' stats report

 Time (%)  Total Time (ns)  Num Calls    Avg (ns)       Med (ns)      Min (ns)      Max (ns)      StdDev (ns)            Name         
 --------  ---------------  ---------  -------------  -------------  -----------  -------------  -------------  ----------------------
     93.3    1,455,398,234          3  485,132,744.7  174,999,734.0  172,993,811  1,107,404,689  538,904,245.2  cudaMemcpy            
      6.3       97,530,964          3   32,510,321.3      139,580.0      136,834     97,254,550   56,070,146.8  cudaMalloc            
      0.4        6,116,761          3    2,038,920.3    2,130,144.0    1,027,513      2,959,104      969,021.3  cudaFree              
      0.1          984,470          1      984,470.0      984,470.0      984,470        984,470            0.0  cudaLaunchKernel      
      0.0              811          1          811.0          811.0          811            811            0.0  cuModuleGetLoadingMode

[6/8] Executing 'cuda_gpu_kern_sum' stats report

 Time (%)  Total Time (ns)  Instances    Avg (ns)      Med (ns)     Min (ns)    Max (ns)   StdDev (ns)                     Name                   
 --------  ---------------  ---------  ------------  ------------  ----------  ----------  -----------  ------------------------------------------
    100.0       15,343,195          1  15,343,195.0  15,343,195.0  15,343,195  15,343,195          0.0  vector_add(float *, float *, float *, int)

[7/8] Executing 'cuda_gpu_mem_time_sum' stats report

 Time (%)  Total Time (ns)  Count     Avg (ns)         Med (ns)        Min (ns)       Max (ns)     StdDev (ns)           Operation          
 --------  ---------------  -----  ---------------  ---------------  -------------  -------------  -----------  ----------------------------
     75.8    1,091,411,307      1  1,091,411,307.0  1,091,411,307.0  1,091,411,307  1,091,411,307          0.0  [CUDA memcpy Device-to-Host]
     24.2      347,897,753      2    173,948,876.5    173,948,876.5    172,946,196    174,951,557  1,418,004.4  [CUDA memcpy Host-to-Device]

[8/8] Executing 'cuda_gpu_mem_size_sum' stats report

 Total (MB)  Count  Avg (MB)   Med (MB)   Min (MB)   Max (MB)   StdDev (MB)           Operation          
 ----------  -----  ---------  ---------  ---------  ---------  -----------  ----------------------------
  6,400.000      2  3,200.000  3,200.000  3,200.000  3,200.000        0.000  [CUDA memcpy Host-to-Device]
  3,200.000      1  3,200.000  3,200.000  3,200.000  3,200.000        0.000  [CUDA memcpy Device-to-Host]

Generated:
    /home/kenji/workspace/cuda/tutorial/build/report3.nsys-rep
    /home/kenji/workspace/cuda/tutorial/build/report3.sqlite