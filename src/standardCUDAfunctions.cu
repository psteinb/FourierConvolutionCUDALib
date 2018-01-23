/*
 * standardCUDAfunctions.cu
 *
 *  Created on: Jul 24, 2014
 *      Author: preibisch
 */
#include "book.h"

#include "convolution3Dfft.h"

//==============================================
 int selectDeviceWithHighestComputeCapability() {

  int numDevices = 0;
  HANDLE_ERROR(cudaGetDeviceCount(&numDevices));
  int computeCapability = 0;
  int meta = 0;
  int value = -1;

  cudaDeviceProp dp;
  for (short devIdx = 0; devIdx < numDevices; ++devIdx) {
    cudaGetDeviceProperties(&dp,devIdx);
    meta = 10 * dp.major + dp.minor;
    if (meta > computeCapability) {
      computeCapability = meta;
      value = devIdx;
    }
  }

  return value;
}

 int getCUDAcomputeCapabilityMajorVersion(int devCUDA)
{
    cudaDeviceProp dp;
    cudaGetDeviceProperties(&dp, devCUDA);

	return dp.major;
}

 int getCUDAcomputeCapabilityMinorVersion(int devCUDA)
{

  cudaDeviceProp dp;
  cudaGetDeviceProperties(&dp, devCUDA);

  return dp.minor;
}

 int getNumDevicesCUDA()
{
	int count = 0;
	HANDLE_ERROR(cudaGetDeviceCount ( &count ));
	return count;
}

 void getNameDeviceCUDA(int devCUDA, char* name)
{
	cudaDeviceProp prop;
	HANDLE_ERROR( cudaGetDeviceProperties(&prop, devCUDA));

	memcpy(name,prop.name,sizeof(char)*256);
}

 long long int getMemDeviceCUDA(int devCUDA)
{
	cudaDeviceProp prop;
	HANDLE_ERROR( cudaGetDeviceProperties(&prop, devCUDA));
	return ((long long int)prop.totalGlobalMem);
}
