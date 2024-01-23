"""
suitesparse@7.5.1
"""

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "suitesparseconfig",
    srcs = [
        "SuiteSparse_config/SuiteSparse_config.c",
    ],
    hdrs = [
        "SuiteSparse_config/SuiteSparse_config.h",
    ],
    includes = [
        "SuiteSparse_config/",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
        # The linker needs to be given the explicit search paths when building against a sysroot.
        # TODO(isaac) - Figure out how we can remove this.
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
)

cc_library(
    name = "amd",
    srcs = [
        "AMD/Source/amd_l1.c",
        "AMD/Source/amd_l2.c",
        "AMD/Source/amd_l_aat.c",
        "AMD/Source/amd_l_control.c",
        "AMD/Source/amd_l_defaults.c",
        "AMD/Source/amd_l_dump.c",
        "AMD/Source/amd_l_info.c",
        "AMD/Source/amd_l_order.c",
        "AMD/Source/amd_l_post_tree.c",
        "AMD/Source/amd_l_postorder.c",
        "AMD/Source/amd_l_preprocess.c",
        "AMD/Source/amd_l_valid.c",
    ],
    hdrs = [
        "AMD/Include/amd.h",
        "AMD/Include/amd_internal.h",
    ],
    copts = [
        "-Iexternal/suitesparse/AMD/Source",
    ],
    includes = [
        "AMD/Include",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    textual_hdrs = [
        "AMD/Source/amd_1.c",
        "AMD/Source/amd_2.c",
        "AMD/Source/amd_aat.c",
        "AMD/Source/amd_control.c",
        "AMD/Source/amd_defaults.c",
        "AMD/Source/amd_dump.c",
        "AMD/Source/amd_info.c",
        "AMD/Source/amd_order.c",
        "AMD/Source/amd_post_tree.c",
        "AMD/Source/amd_postorder.c",
        "AMD/Source/amd_preprocess.c",
        "AMD/Source/amd_valid.c",
    ],
    deps = ["suitesparseconfig"],
)

cc_library(
    name = "camd",
    srcs = [
        "CAMD/Source/camd_l1.c",
        "CAMD/Source/camd_l2.c",
        "CAMD/Source/camd_l_aat.c",
        "CAMD/Source/camd_l_control.c",
        "CAMD/Source/camd_l_defaults.c",
        "CAMD/Source/camd_l_dump.c",
        "CAMD/Source/camd_l_info.c",
        "CAMD/Source/camd_l_order.c",
        "CAMD/Source/camd_l_postorder.c",
        "CAMD/Source/camd_l_preprocess.c",
        "CAMD/Source/camd_l_valid.c",
    ],
    hdrs = [
        "CAMD/Include/camd.h",
        "CAMD/Include/camd_internal.h",
    ],
    copts = [
        "-Iexternal/suitesparse/CAMD/Source",
    ],
    includes = [
        "CAMD/Include",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    textual_hdrs = [
        "CAMD/Source/camd_1.c",
        "CAMD/Source/camd_2.c",
        "CAMD/Source/camd_aat.c",
        "CAMD/Source/camd_control.c",
        "CAMD/Source/camd_defaults.c",
        "CAMD/Source/camd_dump.c",
        "CAMD/Source/camd_info.c",
        "CAMD/Source/camd_order.c",
        "CAMD/Source/camd_postorder.c",
        "CAMD/Source/camd_preprocess.c",
        "CAMD/Source/camd_valid.c",
    ],
    deps = ["suitesparseconfig"],
)

cc_library(
    name = "colamd",
    srcs = [
        "COLAMD/Source/colamd_l.c",
    ],
    hdrs = [
        "COLAMD/Include/colamd.h",
    ],
    copts = [
        "-Iexternal/suitesparse/COLAMD/Source",
    ],
    includes = [
        "COLAMD/Include",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    textual_hdrs = [
        "COLAMD/Source/colamd.c",
    ],
    deps = ["suitesparseconfig"],
)

cc_library(
    name = "ccolamd",
    srcs = [
        "CCOLAMD/Source/ccolamd_l.c",
    ],
    hdrs = [
        "CCOLAMD/Include/ccolamd.h",
    ],
    copts = [
        "-Iexternal/suitesparse/CCOLAMD/Source",
    ],
    includes = [
        "CCOLAMD/Include",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    textual_hdrs = [
        "CCOLAMD/Source/ccolamd.c",
    ],
    deps = ["suitesparseconfig"],
)

cc_library(
    name = "GKlib",
    srcs = [
        "CHOLMOD/SuiteSparse_metis/GKlib/b64.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/blas.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/csr.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/error.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/evaluate.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/fkvkselect.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/fs.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/getopt.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_arch.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_defs.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_externs.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_getopt.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/GKlib.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_macros.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkblas.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkmemory.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkpqueue2.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkpqueue.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkrandom.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mksort.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_mkutils.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_proto.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gkregex.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/gkregex.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_struct.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/gk_types.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/htable.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/io.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/itemsets.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/mcore.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/memory.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/ms_inttypes.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/ms_stat.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/ms_stdint.h",
        "CHOLMOD/SuiteSparse_metis/GKlib/omp.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/pdb.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/pqueue.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/random.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/rw.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/seq.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/sort.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/tokenizer.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/util.c",
        # These fail to compile as of 2023 -- Tim Davis commented out
        # various definitions that apparently are not needed.
        #
        # "CHOLMOD/SuiteSparse_metis/GKlib/graph.c",
        # "CHOLMOD/SuiteSparse_metis/GKlib/string.c",
        # "CHOLMOD/SuiteSparse_metis/GKlib/timers.c",
    ],
    hdrs = [
        "CHOLMOD/SuiteSparse_metis/GKlib/GKlib.h",
    ],
    defines = [
        "LINUX",
    ],
    features = ["no_default_warnings"],
    includes = [
        "CHOLMOD/SuiteSparse_metis/GKlib",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    deps = ["suitesparseconfig"],
)

cc_library(
    name = "SuiteSparse_metis",
    srcs = [
        "CHOLMOD/SuiteSparse_metis/libmetis/auxapi.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/balance.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/bucketsort.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/checkgraph.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/coarsen.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/compress.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/contig.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/debug.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/defs.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/fm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/fortran.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/frename.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/gklib.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/gklib_defs.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/gklib_rename.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/graph.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/initpart.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kwayfm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kwayrefine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/macros.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/mcutil.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mesh.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/meshpart.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/metislib.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/minconn.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mincover.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mmd.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/ometis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/options.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/parmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/pmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/proto.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/refine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/rename.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/separator.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/sfm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/srefine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/stat.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/stdheaders.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/struct.h",
        "CHOLMOD/SuiteSparse_metis/libmetis/timing.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/util.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/wspace.c",
    ],
    hdrs = [
        "CHOLMOD/SuiteSparse_metis/include/metis.h",
    ],
    copts = [
        "-Iexternal/suitesparse/CHOLMOD/SuiteSparse_metis/libmetis/",
    ],
    features = ["no_default_warnings"],
    includes = [
        "CHOLMOD/SuiteSparse_metis/include/",
    ],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    deps = [
        "GKlib",
        "suitesparseconfig",
    ],
)

cc_library(
    name = "cholmod",
    srcs = [
        ## Cholesky
        "CHOLMOD/Cholesky/cholmod_l_amd.c",
        "CHOLMOD/Cholesky/cholmod_l_analyze.c",
        "CHOLMOD/Cholesky/cholmod_l_colamd.c",
        "CHOLMOD/Cholesky/cholmod_l_etree.c",
        "CHOLMOD/Cholesky/cholmod_l_factorize.c",
        "CHOLMOD/Cholesky/cholmod_l_postorder.c",
        "CHOLMOD/Cholesky/cholmod_l_rcond.c",
        "CHOLMOD/Cholesky/cholmod_l_resymbol.c",
        "CHOLMOD/Cholesky/cholmod_l_rowcolcounts.c",
        "CHOLMOD/Cholesky/cholmod_l_rowfac.c",
        "CHOLMOD/Cholesky/cholmod_l_solve.c",
        "CHOLMOD/Cholesky/cholmod_l_spsolve.c",
        ## Utility
        "CHOLMOD/Utility/cholmod_l_aat.c",
        "CHOLMOD/Utility/cholmod_l_add.c",
        "CHOLMOD/Utility/cholmod_l_add_size_t.c",
        "CHOLMOD/Utility/cholmod_l_alloc_factor.c",
        "CHOLMOD/Utility/cholmod_l_alloc_work.c",
        "CHOLMOD/Utility/cholmod_l_allocate_dense.c",
        "CHOLMOD/Utility/cholmod_l_allocate_factor.c",
        "CHOLMOD/Utility/cholmod_l_allocate_sparse.c",
        "CHOLMOD/Utility/cholmod_l_allocate_triplet.c",
        "CHOLMOD/Utility/cholmod_l_allocate_work.c",
        "CHOLMOD/Utility/cholmod_l_band.c",
        "CHOLMOD/Utility/cholmod_l_band_nnz.c",
        "CHOLMOD/Utility/cholmod_l_calloc.c",
        "CHOLMOD/Utility/cholmod_l_change_factor.c",
        "CHOLMOD/Utility/cholmod_l_clear_flag.c",
        "CHOLMOD/Utility/cholmod_l_copy.c",
        "CHOLMOD/Utility/cholmod_l_copy_dense.c",
        "CHOLMOD/Utility/cholmod_l_copy_dense2.c",
        "CHOLMOD/Utility/cholmod_l_copy_factor.c",
        "CHOLMOD/Utility/cholmod_l_copy_sparse.c",
        "CHOLMOD/Utility/cholmod_l_copy_triplet.c",
        "CHOLMOD/Utility/cholmod_l_cumsum.c",
        "CHOLMOD/Utility/cholmod_l_dbound.c",
        "CHOLMOD/Utility/cholmod_l_defaults.c",
        "CHOLMOD/Utility/cholmod_l_dense_nnz.c",
        "CHOLMOD/Utility/cholmod_l_dense_to_sparse.c",
        "CHOLMOD/Utility/cholmod_l_divcomplex.c",
        "CHOLMOD/Utility/cholmod_l_ensure_dense.c",
        "CHOLMOD/Utility/cholmod_l_error.c",
        "CHOLMOD/Utility/cholmod_l_eye.c",
        "CHOLMOD/Utility/cholmod_l_factor_to_sparse.c",
        "CHOLMOD/Utility/cholmod_l_finish.c",
        "CHOLMOD/Utility/cholmod_l_free.c",
        "CHOLMOD/Utility/cholmod_l_free_dense.c",
        "CHOLMOD/Utility/cholmod_l_free_factor.c",
        "CHOLMOD/Utility/cholmod_l_free_sparse.c",
        "CHOLMOD/Utility/cholmod_l_free_triplet.c",
        "CHOLMOD/Utility/cholmod_l_free_work.c",
        "CHOLMOD/Utility/cholmod_l_hypot.c",
        "CHOLMOD/Utility/cholmod_l_malloc.c",
        "CHOLMOD/Utility/cholmod_l_maxrank.c",
        "CHOLMOD/Utility/cholmod_l_mult_size_t.c",
        "CHOLMOD/Utility/cholmod_l_nnz.c",
        "CHOLMOD/Utility/cholmod_l_ones.c",
        "CHOLMOD/Utility/cholmod_l_pack_factor.c",
        "CHOLMOD/Utility/cholmod_l_ptranspose.c",
        "CHOLMOD/Utility/cholmod_l_realloc.c",
        "CHOLMOD/Utility/cholmod_l_realloc_multiple.c",
        "CHOLMOD/Utility/cholmod_l_reallocate_column.c",
        "CHOLMOD/Utility/cholmod_l_reallocate_factor.c",
        "CHOLMOD/Utility/cholmod_l_reallocate_sparse.c",
        "CHOLMOD/Utility/cholmod_l_reallocate_triplet.c",
        "CHOLMOD/Utility/cholmod_l_sbound.c",
        "CHOLMOD/Utility/cholmod_l_score_comp.c",
        "CHOLMOD/Utility/cholmod_l_set_empty.c",
        "CHOLMOD/Utility/cholmod_l_sort.c",
        "CHOLMOD/Utility/cholmod_l_sparse_to_dense.c",
        "CHOLMOD/Utility/cholmod_l_sparse_to_triplet.c",
        "CHOLMOD/Utility/cholmod_l_speye.c",
        "CHOLMOD/Utility/cholmod_l_spzeros.c",
        "CHOLMOD/Utility/cholmod_l_start.c",
        "CHOLMOD/Utility/cholmod_l_transpose.c",
        "CHOLMOD/Utility/cholmod_l_transpose_sym.c",
        "CHOLMOD/Utility/cholmod_l_transpose_unsym.c",
        "CHOLMOD/Utility/cholmod_l_triplet_to_sparse.c",
        "CHOLMOD/Utility/cholmod_l_version.c",
        "CHOLMOD/Utility/cholmod_l_xtype.c",
        "CHOLMOD/Utility/cholmod_l_zeros.c",
        ## MatrixOps
        "CHOLMOD/MatrixOps/cholmod_l_drop.c",
        "CHOLMOD/MatrixOps/cholmod_l_horzcat.c",
        "CHOLMOD/MatrixOps/cholmod_l_norm.c",
        "CHOLMOD/MatrixOps/cholmod_l_scale.c",
        "CHOLMOD/MatrixOps/cholmod_l_sdmult.c",
        "CHOLMOD/MatrixOps/cholmod_l_ssmult.c",
        "CHOLMOD/MatrixOps/cholmod_l_submatrix.c",
        "CHOLMOD/MatrixOps/cholmod_l_symmetry.c",
        "CHOLMOD/MatrixOps/cholmod_l_vertcat.c",
        ## Modify
        "CHOLMOD/Modify/cholmod_l_rowadd.c",
        "CHOLMOD/Modify/cholmod_l_rowdel.c",
        "CHOLMOD/Modify/cholmod_l_updown.c",
        ## Partition
        "CHOLMOD/Partition/cholmod_l_camd.c",
        "CHOLMOD/Partition/cholmod_l_ccolamd.c",
        "CHOLMOD/Partition/cholmod_l_csymamd.c",
        "CHOLMOD/Partition/cholmod_l_nesdis.c",
        "CHOLMOD/Partition/cholmod_l_metis.c",
        "CHOLMOD/Partition/cholmod_metis_wrapper.c",
        "CHOLMOD/Partition/cholmod_metis_wrapper.h",
        ## Supernodal
        "CHOLMOD/Supernodal/cholmod_l_super_numeric.c",
        "CHOLMOD/Supernodal/cholmod_l_super_solve.c",
        "CHOLMOD/Supernodal/cholmod_l_super_symbolic.c",
    ],
    hdrs = [
        "CHOLMOD/Include/cholmod.h",
        "CHOLMOD/Include/cholmod_internal.h",
        "CHOLMOD/Include/cholmod_template.h",
    ],
    copts = [
        "-Iexternal/suitesparse/CHOLMOD/Cholesky",
        "-Iexternal/suitesparse/CHOLMOD/MatrixOps",
        "-Iexternal/suitesparse/CHOLMOD/Modify",
        "-Iexternal/suitesparse/CHOLMOD/Partition",
        "-Iexternal/suitesparse/CHOLMOD/Supernodal",
        # The following include paths seem to be needed -- some
        # CHOLMOD code directly #includes internal libmetis/GKlib
        # files.
        "-Iexternal/suitesparse/CHOLMOD",
        "-Iexternal/suitesparse/CHOLMOD/SuiteSparse_metis/libmetis",
    ],
    includes = ["CHOLMOD/Include/"],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    textual_hdrs = [
        "CHOLMOD/Cholesky/cholmod_amd.c",
        "CHOLMOD/Cholesky/cholmod_analyze.c",
        "CHOLMOD/Cholesky/cholmod_colamd.c",
        "CHOLMOD/Cholesky/cholmod_etree.c",
        "CHOLMOD/Cholesky/cholmod_factorize.c",
        "CHOLMOD/Cholesky/cholmod_postorder.c",
        "CHOLMOD/Cholesky/cholmod_rcond.c",
        "CHOLMOD/Cholesky/cholmod_resymbol.c",
        "CHOLMOD/Cholesky/cholmod_rowcolcounts.c",
        "CHOLMOD/Cholesky/cholmod_rowfac.c",
        "CHOLMOD/Cholesky/cholmod_solve.c",
        "CHOLMOD/Cholesky/cholmod_spsolve.c",
        "CHOLMOD/Utility/cholmod_aat.c",
        "CHOLMOD/Utility/cholmod_add.c",
        "CHOLMOD/Utility/cholmod_add_size_t.c",
        "CHOLMOD/Utility/cholmod_alloc_factor.c",
        "CHOLMOD/Utility/cholmod_alloc_work.c",
        "CHOLMOD/Utility/cholmod_allocate_dense.c",
        "CHOLMOD/Utility/cholmod_allocate_factor.c",
        "CHOLMOD/Utility/cholmod_allocate_sparse.c",
        "CHOLMOD/Utility/cholmod_allocate_triplet.c",
        "CHOLMOD/Utility/cholmod_allocate_work.c",
        "CHOLMOD/Utility/cholmod_band.c",
        "CHOLMOD/Utility/cholmod_band_nnz.c",
        "CHOLMOD/Utility/cholmod_calloc.c",
        "CHOLMOD/Utility/cholmod_change_factor.c",
        "CHOLMOD/Utility/cholmod_clear_flag.c",
        "CHOLMOD/Utility/cholmod_copy.c",
        "CHOLMOD/Utility/cholmod_copy_dense.c",
        "CHOLMOD/Utility/cholmod_copy_dense2.c",
        "CHOLMOD/Utility/cholmod_copy_factor.c",
        "CHOLMOD/Utility/cholmod_copy_sparse.c",
        "CHOLMOD/Utility/cholmod_copy_triplet.c",
        "CHOLMOD/Utility/cholmod_cumsum.c",
        "CHOLMOD/Utility/cholmod_dbound.c",
        "CHOLMOD/Utility/cholmod_defaults.c",
        "CHOLMOD/Utility/cholmod_dense_nnz.c",
        "CHOLMOD/Utility/cholmod_dense_to_sparse.c",
        "CHOLMOD/Utility/cholmod_divcomplex.c",
        "CHOLMOD/Utility/cholmod_ensure_dense.c",
        "CHOLMOD/Utility/cholmod_error.c",
        "CHOLMOD/Utility/cholmod_eye.c",
        "CHOLMOD/Utility/cholmod_factor_to_sparse.c",
        "CHOLMOD/Utility/cholmod_finish.c",
        "CHOLMOD/Utility/cholmod_free.c",
        "CHOLMOD/Utility/cholmod_free_dense.c",
        "CHOLMOD/Utility/cholmod_free_factor.c",
        "CHOLMOD/Utility/cholmod_free_sparse.c",
        "CHOLMOD/Utility/cholmod_free_triplet.c",
        "CHOLMOD/Utility/cholmod_free_work.c",
        "CHOLMOD/Utility/cholmod_hypot.c",
        "CHOLMOD/Utility/cholmod_malloc.c",
        "CHOLMOD/Utility/cholmod_maxrank.c",
        "CHOLMOD/Utility/cholmod_memdebug.c",
        "CHOLMOD/Utility/cholmod_mult_size_t.c",
        "CHOLMOD/Utility/cholmod_mult_uint64_t.c",
        "CHOLMOD/Utility/cholmod_nnz.c",
        "CHOLMOD/Utility/cholmod_ones.c",
        "CHOLMOD/Utility/cholmod_pack_factor.c",
        "CHOLMOD/Utility/cholmod_ptranspose.c",
        "CHOLMOD/Utility/cholmod_realloc.c",
        "CHOLMOD/Utility/cholmod_realloc_multiple.c",
        "CHOLMOD/Utility/cholmod_reallocate_column.c",
        "CHOLMOD/Utility/cholmod_reallocate_factor.c",
        "CHOLMOD/Utility/cholmod_reallocate_sparse.c",
        "CHOLMOD/Utility/cholmod_reallocate_triplet.c",
        "CHOLMOD/Utility/cholmod_sbound.c",
        "CHOLMOD/Utility/cholmod_score_comp.c",
        "CHOLMOD/Utility/cholmod_set_empty.c",
        "CHOLMOD/Utility/cholmod_sort.c",
        "CHOLMOD/Utility/cholmod_sparse_to_dense.c",
        "CHOLMOD/Utility/cholmod_sparse_to_triplet.c",
        "CHOLMOD/Utility/cholmod_speye.c",
        "CHOLMOD/Utility/cholmod_spzeros.c",
        "CHOLMOD/Utility/cholmod_start.c",
        "CHOLMOD/Utility/cholmod_transpose.c",
        "CHOLMOD/Utility/cholmod_transpose_sym.c",
        "CHOLMOD/Utility/cholmod_transpose_unsym.c",
        "CHOLMOD/Utility/cholmod_triplet_to_sparse.c",
        "CHOLMOD/Utility/cholmod_version.c",
        "CHOLMOD/Utility/cholmod_xtype.c",
        "CHOLMOD/MatrixOps/cholmod_drop.c",
        "CHOLMOD/MatrixOps/cholmod_horzcat.c",
        "CHOLMOD/MatrixOps/cholmod_norm.c",
        "CHOLMOD/MatrixOps/cholmod_scale.c",
        "CHOLMOD/MatrixOps/cholmod_sdmult.c",
        "CHOLMOD/MatrixOps/cholmod_ssmult.c",
        "CHOLMOD/MatrixOps/cholmod_submatrix.c",
        "CHOLMOD/MatrixOps/cholmod_symmetry.c",
        "CHOLMOD/MatrixOps/cholmod_vertcat.c",
        "CHOLMOD/Modify/cholmod_rowadd.c",
        "CHOLMOD/Modify/cholmod_rowdel.c",
        "CHOLMOD/Modify/cholmod_updown.c",
        "CHOLMOD/Partition/cholmod_camd.c",
        "CHOLMOD/Partition/cholmod_ccolamd.c",
        "CHOLMOD/Partition/cholmod_csymamd.c",
        "CHOLMOD/Partition/cholmod_metis.c",
        "CHOLMOD/Partition/cholmod_nesdis.c",
        "CHOLMOD/Supernodal/cholmod_super_numeric.c",
        "CHOLMOD/Supernodal/cholmod_super_solve.c",
        "CHOLMOD/Supernodal/cholmod_super_symbolic.c",
        "CHOLMOD/Cholesky/t_cholmod_lsolve_template.c",
        "CHOLMOD/Cholesky/t_cholmod_ltsolve_template.c",
        "CHOLMOD/Cholesky/t_cholmod_rcond_worker.c",
        "CHOLMOD/Cholesky/t_cholmod_resymbol_worker.c",
        "CHOLMOD/Cholesky/t_cholmod_rowfac_worker.c",
        "CHOLMOD/Cholesky/t_cholmod_solve_worker.c",
        "CHOLMOD/Cholesky/t_cholmod_psolve_worker.c",
        "CHOLMOD/Utility/t_cholmod_aat.c",
        "CHOLMOD/Utility/t_cholmod_aat_worker.c",
        "CHOLMOD/Utility/t_cholmod_add.c",
        "CHOLMOD/Utility/t_cholmod_add_size_t.c",
        "CHOLMOD/Utility/t_cholmod_add_worker.c",
        "CHOLMOD/Utility/t_cholmod_alloc_factor.c",
        "CHOLMOD/Utility/t_cholmod_alloc_work.c",
        "CHOLMOD/Utility/t_cholmod_allocate_dense.c",
        "CHOLMOD/Utility/t_cholmod_allocate_sparse.c",
        "CHOLMOD/Utility/t_cholmod_allocate_triplet.c",
        "CHOLMOD/Utility/t_cholmod_band.c",
        "CHOLMOD/Utility/t_cholmod_band_nnz.c",
        "CHOLMOD/Utility/t_cholmod_band_worker.c",
        "CHOLMOD/Utility/t_cholmod_bound.c",
        "CHOLMOD/Utility/t_cholmod_change_factor.c",
        "CHOLMOD/Utility/t_cholmod_change_factor_1_worker.c",
        "CHOLMOD/Utility/t_cholmod_change_factor_2_template.c",
        "CHOLMOD/Utility/t_cholmod_change_factor_2_worker.c",
        "CHOLMOD/Utility/t_cholmod_change_factor_3_template.c",
        "CHOLMOD/Utility/t_cholmod_change_factor_3_worker.c",
        "CHOLMOD/Utility/t_cholmod_change_xdtype.c",
        "CHOLMOD/Utility/t_cholmod_change_xdtype_template.c",
        "CHOLMOD/Utility/t_cholmod_clear_flag.c",
        "CHOLMOD/Utility/t_cholmod_copy.c",
        "CHOLMOD/Utility/t_cholmod_copy_dense.c",
        "CHOLMOD/Utility/t_cholmod_copy_dense2.c",
        "CHOLMOD/Utility/t_cholmod_copy_dense2_worker.c",
        "CHOLMOD/Utility/t_cholmod_copy_factor.c",
        "CHOLMOD/Utility/t_cholmod_copy_factor_worker.c",
        "CHOLMOD/Utility/t_cholmod_copy_sparse.c",
        "CHOLMOD/Utility/t_cholmod_copy_sparse_worker.c",
        "CHOLMOD/Utility/t_cholmod_copy_triplet.c",
        "CHOLMOD/Utility/t_cholmod_copy_worker.c",
        "CHOLMOD/Utility/t_cholmod_cumsum.c",
        "CHOLMOD/Utility/t_cholmod_defaults.c",
        "CHOLMOD/Utility/t_cholmod_dense_nnz.c",
        "CHOLMOD/Utility/t_cholmod_dense_nnz_worker.c",
        "CHOLMOD/Utility/t_cholmod_dense_to_sparse.c",
        "CHOLMOD/Utility/t_cholmod_dense_to_sparse_worker.c",
        "CHOLMOD/Utility/t_cholmod_ensure_dense.c",
        "CHOLMOD/Utility/t_cholmod_error.c",
        "CHOLMOD/Utility/t_cholmod_eye.c",
        "CHOLMOD/Utility/t_cholmod_eye_worker.c",
        "CHOLMOD/Utility/t_cholmod_factor_to_sparse.c",
        "CHOLMOD/Utility/t_cholmod_finish.c",
        "CHOLMOD/Utility/t_cholmod_free.c",
        "CHOLMOD/Utility/t_cholmod_free_dense.c",
        "CHOLMOD/Utility/t_cholmod_free_factor.c",
        "CHOLMOD/Utility/t_cholmod_free_sparse.c",
        "CHOLMOD/Utility/t_cholmod_free_triplet.c",
        "CHOLMOD/Utility/t_cholmod_free_work.c",
        "CHOLMOD/Utility/t_cholmod_malloc.c",
        "CHOLMOD/Utility/t_cholmod_maxrank.c",
        "CHOLMOD/Utility/t_cholmod_mult_size_t.c",
        "CHOLMOD/Utility/t_cholmod_nnz.c",
        "CHOLMOD/Utility/t_cholmod_ones.c",
        "CHOLMOD/Utility/t_cholmod_ones_worker.c",
        "CHOLMOD/Utility/t_cholmod_pack_factor.c",
        "CHOLMOD/Utility/t_cholmod_pack_factor_worker.c",
        "CHOLMOD/Utility/t_cholmod_ptranspose.c",
        "CHOLMOD/Utility/t_cholmod_realloc.c",
        "CHOLMOD/Utility/t_cholmod_realloc_multiple.c",
        "CHOLMOD/Utility/t_cholmod_reallocate_column.c",
        "CHOLMOD/Utility/t_cholmod_reallocate_column_worker.c",
        "CHOLMOD/Utility/t_cholmod_reallocate_factor.c",
        "CHOLMOD/Utility/t_cholmod_reallocate_sparse.c",
        "CHOLMOD/Utility/t_cholmod_reallocate_triplet.c",
        "CHOLMOD/Utility/t_cholmod_score_comp.c",
        "CHOLMOD/Utility/t_cholmod_set_empty.c",
        "CHOLMOD/Utility/t_cholmod_sort.c",
        "CHOLMOD/Utility/t_cholmod_sort_worker.c",
        "CHOLMOD/Utility/t_cholmod_sparse_to_dense.c",
        "CHOLMOD/Utility/t_cholmod_sparse_to_dense_worker.c",
        "CHOLMOD/Utility/t_cholmod_sparse_to_triplet.c",
        "CHOLMOD/Utility/t_cholmod_sparse_to_triplet_worker.c",
        "CHOLMOD/Utility/t_cholmod_speye.c",
        "CHOLMOD/Utility/t_cholmod_speye_worker.c",
        "CHOLMOD/Utility/t_cholmod_spzeros.c",
        "CHOLMOD/Utility/t_cholmod_start.c",
        "CHOLMOD/Utility/t_cholmod_transpose.c",
        "CHOLMOD/Utility/t_cholmod_transpose_sym.c",
        "CHOLMOD/Utility/t_cholmod_transpose_sym_permuted.c",
        "CHOLMOD/Utility/t_cholmod_transpose_sym_template.c",
        "CHOLMOD/Utility/t_cholmod_transpose_sym_unpermuted.c",
        "CHOLMOD/Utility/t_cholmod_transpose_sym_worker.c",
        "CHOLMOD/Utility/t_cholmod_transpose_unsym.c",
        "CHOLMOD/Utility/t_cholmod_transpose_unsym_template.c",
        "CHOLMOD/Utility/t_cholmod_transpose_unsym_worker.c",
        "CHOLMOD/Utility/t_cholmod_triplet_to_sparse.c",
        "CHOLMOD/Utility/t_cholmod_triplet_to_sparse_worker.c",
        "CHOLMOD/Utility/t_cholmod_version.c",
        "CHOLMOD/Utility/t_cholmod_zeros.c",
        # There may be a better way to make these available to
        # #include in this library's code.
        #
        # We don't actually need the METIS ordering routines, but we
        # do want NESDIS to be available.  Unfortunately there doesn't
        # seem to be a way to exclude the former and include the
        # latter via build configuration.
        "CHOLMOD/SuiteSparse_metis/GKlib/blas.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/error.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/evaluate.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/fkvkselect.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/mcore.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/memory.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/omp.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/random.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/sort.c",
        "CHOLMOD/SuiteSparse_metis/GKlib/util.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/auxapi.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/balance.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/bucketsort.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/coarsen.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/compress.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/contig.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/debug.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/fm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/fortran.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/gklib.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/graph.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/initpart.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kwayfm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/kwayrefine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mcutil.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/minconn.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mincover.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/mmd.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/ometis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/options.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/parmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/pmetis.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/refine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/separator.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/sfm.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/srefine.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/stat.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/timing.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/util.c",
        "CHOLMOD/SuiteSparse_metis/libmetis/wspace.c",
    ],
    deps = [
        "SuiteSparse_metis",
        "amd",
        "camd",
        "ccolamd",
        "colamd",
        "suitesparseconfig",
    ],
)

cc_library(
    name = "spqr",
    srcs = [
        "SPQR/Source/SuiteSparseQR.cpp",
        "SPQR/Source/SuiteSparseQR_C.cpp",
        "SPQR/Source/SuiteSparseQR_expert.cpp",
        "SPQR/Source/SuiteSparseQR_qmult.cpp",
        "SPQR/Source/spqr_1colamd.cpp",
        "SPQR/Source/spqr_1factor.cpp",
        "SPQR/Source/spqr_1fixed.cpp",
        "SPQR/Source/spqr_analyze.cpp",
        "SPQR/Source/spqr_append.cpp",
        "SPQR/Source/spqr_assemble.cpp",
        "SPQR/Source/spqr_cpack.cpp",
        "SPQR/Source/spqr_csize.cpp",
        "SPQR/Source/spqr_cumsum.cpp",
        "SPQR/Source/spqr_debug.cpp",
        "SPQR/Source/spqr_factorize.cpp",
        "SPQR/Source/spqr_fcsize.cpp",
        "SPQR/Source/spqr_freefac.cpp",
        "SPQR/Source/spqr_freenum.cpp",
        "SPQR/Source/spqr_freesym.cpp",
        "SPQR/Source/spqr_front.cpp",
        "SPQR/Source/spqr_fsize.cpp",
        "SPQR/Source/spqr_happly.cpp",
        "SPQR/Source/spqr_happly_work.cpp",
        "SPQR/Source/spqr_hpinv.cpp",
        "SPQR/Source/spqr_kernel.cpp",
        "SPQR/Source/spqr_larftb.cpp",
        "SPQR/Source/spqr_maxcolnorm.cpp",
        "SPQR/Source/spqr_panel.cpp",
        "SPQR/Source/spqr_parallel.cpp",
        "SPQR/Source/spqr_rconvert.cpp",
        "SPQR/Source/spqr_rcount.cpp",
        "SPQR/Source/spqr_rhpack.cpp",
        "SPQR/Source/spqr_rmap.cpp",
        "SPQR/Source/spqr_rsolve.cpp",
        "SPQR/Source/spqr_shift.cpp",
        "SPQR/Source/spqr_stranspose1.cpp",
        "SPQR/Source/spqr_stranspose2.cpp",
        "SPQR/Source/spqr_tol.cpp",
        "SPQR/Source/spqr_trapezoidal.cpp",
        "SPQR/Source/spqr_type.cpp",
    ],
    hdrs = [
        "SPQR/Include/SuiteSparseQR.hpp",
        "SPQR/Include/SuiteSparseQR_C.h",
        "SPQR/Include/SuiteSparseQR_definitions.h",
        "SPQR/Include/spqr.hpp",
    ],
    copts = [
        "-Iexternal/suitesparse/SPQR/Source",
    ],
    includes = ["SPQR/Include/"],
    linkopts = [
        "-lm",
        "-lpthread",
        "-lblas",
        "-llapack",
    ] + select({
        "@rules_swiftnav//cc/constraints:aarch64_debian": [
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/lapack",
            "-Lexternal/aarch64-sysroot/usr/lib/aarch64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc/constraints:x86_64_debian": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "@rules_swiftnav//cc:_enable_sysroot": [
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/lapack",
            "-Lexternal/x86_64-sysroot/usr/lib/x86_64-linux-gnu/blas",
        ],
        "//conditions:default": [],
    }),
    deps = [
        "cholmod",
        "suitesparseconfig",
    ],
)
