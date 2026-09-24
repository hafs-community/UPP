help([[
Load environment to build UPP on nimbus
]])

prepend_path("MODULEPATH", "/opt/intel/oneapi/mpi/2021.18/etc/modulefiles/mpi")
prepend_path("MODULEPATH", "/lfs/work/alexander_richert/stack/spack-stack/envs/nco-core-gcc-11.5.0/modules_flat/Core")
prepend_path("MODULEPATH", "/lfs/work/alexander_richert/stack/spack-stack/envs/nco-sci-intel-2021.10.0/modules_flat/Core")

cmake_ver=os.getenv("cmake_ver") or "3.31.11"
load(pathJoin("cmake", cmake_ver))



local ufs_modules = {
  {["jasper"]          = "4.2.8" },
  {["zlib"]            = "1.3.2"  },
  {["libpng"]          = "1.6.55" },
  {["hdf5"]            = "1.14.5" },
  {["netcdf-c"]        = "4.9.2"  },
  {["netcdf-fortran"]  = "4.6.1"  },
  {["bacio"]           = "2.4.1"  },
  {["crtm"]            = "2.4.0.1"},
  {["g2"]              = "3.5.1"  },
  {["g2tmpl"]          = "1.17.0" },
  {["ip"]              = "5.4.0"  },
  {["sp"]              = "2.5.0"  },
  {["w3emc"]           = "2.13.0" },
  {["nemsio"]          = "2.5.5"  },
  {["sigio"]           = "2.3.3"  },
  {["wrf-io"]          = "1.3.0"  },
}

for i = 1, #ufs_modules do
  for name, default_version in pairs(ufs_modules[i]) do
    local env_version_name = string.gsub(name, "-", "_") .. "_ver"
    load(pathJoin(name, os.getenv(env_version_name) or default_version))
  end
end

setenv("CC", "mpiicx")
setenv("CXX", "mpiicpx")
setenv("FC", "mpiifort")
setenv("I_MPI_CC", "icx")
setenv("I_MPI_CXX", "icpx")
setenv("I_MPI_FC", "ifort")
setenv("I_MPI_F77", "ifort")
setenv("I_MPI_F90", "ifort")

whatis("Description: UPP build environment")
whatis("Description: UPP build environment common libraries")
