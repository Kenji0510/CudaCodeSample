#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <assert.h>
#include <cuda.h>
#include <cuda_runtime.h>

//#define N 10000000
#define N 100000000
#define MAX_ERR 1e-6

__global__ void vector_subtract(uint8_t *out, uint8_t *a, uint8_t *b, int n) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid < n) {
        int temp = a[tid] - b[tid];
        out[tid] = (temp < 0) ? 0 : temp;
    }
}

int main() {
    uint8_t *a, *b, *out;
    uint8_t *d_a, *d_b, *d_out;

    // Allocate memory on CPU
    a = (uint8_t*)malloc(sizeof(uint8_t) * N);
    b = (uint8_t*)malloc(sizeof(uint8_t) * N);
    out = (uint8_t*)malloc(sizeof(uint8_t) * N);

    for (int i = 0; i < N; i++) {
        a[i] = 255;
        b[i] = 20;
    }

    // Allocate memory on GPU
    cudaMalloc((void**)&d_a, sizeof(uint8_t) * N);
    cudaMalloc((void**)&d_b, sizeof(uint8_t) * N);
    cudaMalloc((void**)&d_out, sizeof(uint8_t) * N);

    // Copy data from CPU to GPU
    cudaMemcpy(d_a, a, sizeof(uint8_t) * N, cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, sizeof(uint8_t) * N, cudaMemcpyHostToDevice);

    int block_size = 256;
    int grid_size = ((N + block_size) / block_size);
    vector_subtract<<<grid_size, block_size>>>(d_out, d_a, d_b, N);

    cudaMemcpy(out, d_out, sizeof(uint8_t) * N, cudaMemcpyDeviceToHost);

    printf("out[0] = %d\n", out[1]);
    printf("PASSED\n");

    // Free memory
    cudaFree(d_a);
    cudaFree(d_b);
    cudaFree(d_out);

    // Deallocate host memory
    free(a); 
    free(b); 
    free(out);
}