help([[
Load environment to build UPP on Jet
]])

prepend_path("MODULEPATH", "/contrib/spack-stack/spack-stack-1.6.0/envs/unified-env-rocky8/install/modulefiles/Core")

stack_intel_ver=os.getenv("stack_intel_ver") or "2021.5.0"
load(pathJoin("stack-intel", stack_intel_ver))

stack_mpi_ver=os.getenv("stack_mpi_ver") or "2021.5.1"
load(pathJoin("stack-intel-oneapi-mpi", stack_mpi_ver))

impi_ver=os.getenv("impi_ver") or "2024.2.1"
load(pathJoin("impi", impi_ver))

cmake_ver=os.getenv("cmake_ver") or "3.23.1"
load(pathJoin("cmake", cmake_ver))

load("upp_common")

setenv("CC","mpiicc")
setenv("CXX","mpiicpc")
setenv("FC","mpiifort")

whatis("Description: UPP build environment")
