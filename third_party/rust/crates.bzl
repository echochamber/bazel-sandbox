"""
@generated
cargo-raze generated Bazel file.

DO NOT EDIT! Replaced on runs of cargo-raze
"""

load("@bazel_tools//tools/build_defs/repo:git.bzl", "new_git_repository")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")  # buildifier: disable=load
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")  # buildifier: disable=load

def raze_fetch_remote_crates():
    """This function defines a collection of repos and should be called in a WORKSPACE file"""
    maybe(
        http_archive,
        name = "raze__aho_corasick__1_0_2",
        url = "https://crates.io/api/v1/crates/aho-corasick/1.0.2/download",
        type = "tar.gz",
        sha256 = "43f6cb1bf222025340178f382c426f13757b2960e89779dfcb319c32542a5a41",
        strip_prefix = "aho-corasick-1.0.2",
        build_file = Label("//third_party/rust/remote:BUILD.aho-corasick-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__android_tzdata__0_1_1",
        url = "https://crates.io/api/v1/crates/android-tzdata/0.1.1/download",
        type = "tar.gz",
        sha256 = "e999941b234f3131b00bc13c22d06e8c5ff726d1b6318ac7eb276997bbb4fef0",
        strip_prefix = "android-tzdata-0.1.1",
        build_file = Label("//third_party/rust/remote:BUILD.android-tzdata-0.1.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anstream__0_3_2",
        url = "https://crates.io/api/v1/crates/anstream/0.3.2/download",
        type = "tar.gz",
        sha256 = "0ca84f3628370c59db74ee214b3263d58f9aadd9b4fe7e711fd87dc452b7f163",
        strip_prefix = "anstream-0.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.anstream-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anstyle__1_0_0",
        url = "https://crates.io/api/v1/crates/anstyle/1.0.0/download",
        type = "tar.gz",
        sha256 = "41ed9a86bf92ae6580e0a31281f65a1b1d867c0cc68d5346e2ae128dddfa6a7d",
        strip_prefix = "anstyle-1.0.0",
        build_file = Label("//third_party/rust/remote:BUILD.anstyle-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anstyle_parse__0_2_0",
        url = "https://crates.io/api/v1/crates/anstyle-parse/0.2.0/download",
        type = "tar.gz",
        sha256 = "e765fd216e48e067936442276d1d57399e37bce53c264d6fefbe298080cb57ee",
        strip_prefix = "anstyle-parse-0.2.0",
        build_file = Label("//third_party/rust/remote:BUILD.anstyle-parse-0.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anstyle_query__1_0_0",
        url = "https://crates.io/api/v1/crates/anstyle-query/1.0.0/download",
        type = "tar.gz",
        sha256 = "5ca11d4be1bab0c8bc8734a9aa7bf4ee8316d462a08c6ac5052f888fef5b494b",
        strip_prefix = "anstyle-query-1.0.0",
        build_file = Label("//third_party/rust/remote:BUILD.anstyle-query-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anstyle_wincon__1_0_1",
        url = "https://crates.io/api/v1/crates/anstyle-wincon/1.0.1/download",
        type = "tar.gz",
        sha256 = "180abfa45703aebe0093f79badacc01b8fd4ea2e35118747e5811127f926e188",
        strip_prefix = "anstyle-wincon-1.0.1",
        build_file = Label("//third_party/rust/remote:BUILD.anstyle-wincon-1.0.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__anyhow__1_0_71",
        url = "https://crates.io/api/v1/crates/anyhow/1.0.71/download",
        type = "tar.gz",
        sha256 = "9c7d0618f0e0b7e8ff11427422b64564d5fb0be1940354bfe2e0529b18a9d9b8",
        strip_prefix = "anyhow-1.0.71",
        build_file = Label("//third_party/rust/remote:BUILD.anyhow-1.0.71.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__async_trait__0_1_68",
        url = "https://crates.io/api/v1/crates/async-trait/0.1.68/download",
        type = "tar.gz",
        sha256 = "b9ccdd8f2a161be9bd5c023df56f1b2a0bd1d83872ae53b71a84a12c9bf6e842",
        strip_prefix = "async-trait-0.1.68",
        build_file = Label("//third_party/rust/remote:BUILD.async-trait-0.1.68.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__autocfg__1_1_0",
        url = "https://crates.io/api/v1/crates/autocfg/1.1.0/download",
        type = "tar.gz",
        sha256 = "d468802bab17cbc0cc575e9b053f41e72aa36bfa6b7f55e3529ffa43161b97fa",
        strip_prefix = "autocfg-1.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.autocfg-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__axum__0_6_18",
        url = "https://crates.io/api/v1/crates/axum/0.6.18/download",
        type = "tar.gz",
        sha256 = "f8175979259124331c1d7bf6586ee7e0da434155e4b2d48ec2c8386281d8df39",
        strip_prefix = "axum-0.6.18",
        build_file = Label("//third_party/rust/remote:BUILD.axum-0.6.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__axum_core__0_3_4",
        url = "https://crates.io/api/v1/crates/axum-core/0.3.4/download",
        type = "tar.gz",
        sha256 = "759fa577a247914fd3f7f76d62972792636412fbfd634cd452f6a385a74d2d2c",
        strip_prefix = "axum-core-0.3.4",
        build_file = Label("//third_party/rust/remote:BUILD.axum-core-0.3.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_13_1",
        url = "https://crates.io/api/v1/crates/base64/0.13.1/download",
        type = "tar.gz",
        sha256 = "9e1b586273c5702936fe7b7d6896644d8be71e6314cfe09d3167c95f712589e8",
        strip_prefix = "base64-0.13.1",
        build_file = Label("//third_party/rust/remote:BUILD.base64-0.13.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__base64__0_21_2",
        url = "https://crates.io/api/v1/crates/base64/0.21.2/download",
        type = "tar.gz",
        sha256 = "604178f6c5c21f02dc555784810edfb88d34ac2c73b2eae109655649ee73ce3d",
        strip_prefix = "base64-0.21.2",
        build_file = Label("//third_party/rust/remote:BUILD.base64-0.21.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bitflags__1_3_2",
        url = "https://crates.io/api/v1/crates/bitflags/1.3.2/download",
        type = "tar.gz",
        sha256 = "bef38d45163c2f1dde094a7dfd33ccf595c92905c8f8f4fdc18d06fb1037718a",
        strip_prefix = "bitflags-1.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.bitflags-1.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bumpalo__3_13_0",
        url = "https://crates.io/api/v1/crates/bumpalo/3.13.0/download",
        type = "tar.gz",
        sha256 = "a3e2c3daef883ecc1b5d58c15adae93470a91d425f3532ba1695849656af3fc1",
        strip_prefix = "bumpalo-3.13.0",
        build_file = Label("//third_party/rust/remote:BUILD.bumpalo-3.13.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__bytes__1_4_0",
        url = "https://crates.io/api/v1/crates/bytes/1.4.0/download",
        type = "tar.gz",
        sha256 = "89b2fd2a0dcf38d7971e2194b6b6eebab45ae01067456a7fd93d5547a61b70be",
        strip_prefix = "bytes-1.4.0",
        build_file = Label("//third_party/rust/remote:BUILD.bytes-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cc__1_0_79",
        url = "https://crates.io/api/v1/crates/cc/1.0.79/download",
        type = "tar.gz",
        sha256 = "50d30906286121d95be3d479533b458f87493b30a4b5f79a607db8f5d11aa91f",
        strip_prefix = "cc-1.0.79",
        build_file = Label("//third_party/rust/remote:BUILD.cc-1.0.79.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__cfg_if__1_0_0",
        url = "https://crates.io/api/v1/crates/cfg-if/1.0.0/download",
        type = "tar.gz",
        sha256 = "baf1de4339761588bc0619e3cbc0120ee582ebb74b53b4efbf79117bd2da40fd",
        strip_prefix = "cfg-if-1.0.0",
        build_file = Label("//third_party/rust/remote:BUILD.cfg-if-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__chrono__0_4_26",
        url = "https://crates.io/api/v1/crates/chrono/0.4.26/download",
        type = "tar.gz",
        sha256 = "ec837a71355b28f6556dbd569b37b3f363091c0bd4b2e735674521b4c5fd9bc5",
        strip_prefix = "chrono-0.4.26",
        build_file = Label("//third_party/rust/remote:BUILD.chrono-0.4.26.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap__4_3_2",
        url = "https://crates.io/api/v1/crates/clap/4.3.2/download",
        type = "tar.gz",
        sha256 = "401a4694d2bf92537b6867d94de48c4842089645fdcdf6c71865b175d836e9c2",
        strip_prefix = "clap-4.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.clap-4.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap_builder__4_3_1",
        url = "https://crates.io/api/v1/crates/clap_builder/4.3.1/download",
        type = "tar.gz",
        sha256 = "72394f3339a76daf211e57d4bcb374410f3965dcc606dd0e03738c7888766980",
        strip_prefix = "clap_builder-4.3.1",
        build_file = Label("//third_party/rust/remote:BUILD.clap_builder-4.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap_derive__4_3_2",
        url = "https://crates.io/api/v1/crates/clap_derive/4.3.2/download",
        type = "tar.gz",
        sha256 = "b8cd2b2a819ad6eec39e8f1d6b53001af1e5469f8c177579cdaeb313115b825f",
        strip_prefix = "clap_derive-4.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.clap_derive-4.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__clap_lex__0_5_0",
        url = "https://crates.io/api/v1/crates/clap_lex/0.5.0/download",
        type = "tar.gz",
        sha256 = "2da6da31387c7e4ef160ffab6d5e7f00c42626fe39aea70a7b0f1773f7dd6c1b",
        strip_prefix = "clap_lex-0.5.0",
        build_file = Label("//third_party/rust/remote:BUILD.clap_lex-0.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__colorchoice__1_0_0",
        url = "https://crates.io/api/v1/crates/colorchoice/1.0.0/download",
        type = "tar.gz",
        sha256 = "acbf1af155f9b9ef647e42cdc158db4b64a1b61f743629225fde6f3e0be2a7c7",
        strip_prefix = "colorchoice-1.0.0",
        build_file = Label("//third_party/rust/remote:BUILD.colorchoice-1.0.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__dotenv__0_15_0",
        url = "https://crates.io/api/v1/crates/dotenv/0.15.0/download",
        type = "tar.gz",
        sha256 = "77c90badedccf4105eca100756a0b1289e191f6fcbdadd3cee1d2f614f97da8f",
        strip_prefix = "dotenv-0.15.0",
        build_file = Label("//third_party/rust/remote:BUILD.dotenv-0.15.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__either__1_8_1",
        url = "https://crates.io/api/v1/crates/either/1.8.1/download",
        type = "tar.gz",
        sha256 = "7fcaabb2fef8c910e7f4c7ce9f67a1283a1715879a7c230ca9d6d1ae31f16d91",
        strip_prefix = "either-1.8.1",
        build_file = Label("//third_party/rust/remote:BUILD.either-1.8.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__env_logger__0_10_0",
        url = "https://crates.io/api/v1/crates/env_logger/0.10.0/download",
        type = "tar.gz",
        sha256 = "85cdab6a89accf66733ad5a1693a4dcced6aeff64602b634530dd73c1f3ee9f0",
        strip_prefix = "env_logger-0.10.0",
        build_file = Label("//third_party/rust/remote:BUILD.env_logger-0.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno__0_3_1",
        url = "https://crates.io/api/v1/crates/errno/0.3.1/download",
        type = "tar.gz",
        sha256 = "4bcfec3a70f97c962c307b2d2c56e358cf1d00b558d74262b5f929ee8cc7e73a",
        strip_prefix = "errno-0.3.1",
        build_file = Label("//third_party/rust/remote:BUILD.errno-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__errno_dragonfly__0_1_2",
        url = "https://crates.io/api/v1/crates/errno-dragonfly/0.1.2/download",
        type = "tar.gz",
        sha256 = "aa68f1b12764fab894d2755d2518754e71b4fd80ecfb822714a1206c2aab39bf",
        strip_prefix = "errno-dragonfly-0.1.2",
        build_file = Label("//third_party/rust/remote:BUILD.errno-dragonfly-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fastrand__1_9_0",
        url = "https://crates.io/api/v1/crates/fastrand/1.9.0/download",
        type = "tar.gz",
        sha256 = "e51093e27b0797c359783294ca4f0a911c270184cb10f85783b118614a1501be",
        strip_prefix = "fastrand-1.9.0",
        build_file = Label("//third_party/rust/remote:BUILD.fastrand-1.9.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fixedbitset__0_4_2",
        url = "https://crates.io/api/v1/crates/fixedbitset/0.4.2/download",
        type = "tar.gz",
        sha256 = "0ce7134b9999ecaf8bcd65542e436736ef32ddca1b3e06094cb6ec5755203b80",
        strip_prefix = "fixedbitset-0.4.2",
        build_file = Label("//third_party/rust/remote:BUILD.fixedbitset-0.4.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__fnv__1_0_7",
        url = "https://crates.io/api/v1/crates/fnv/1.0.7/download",
        type = "tar.gz",
        sha256 = "3f9eec918d3f24069decb9af1554cad7c880e2da24a9afd88aca000531ab82c1",
        strip_prefix = "fnv-1.0.7",
        build_file = Label("//third_party/rust/remote:BUILD.fnv-1.0.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures__0_3_28",
        url = "https://crates.io/api/v1/crates/futures/0.3.28/download",
        type = "tar.gz",
        sha256 = "23342abe12aba583913b2e62f22225ff9c950774065e4bfb61a19cd9770fec40",
        strip_prefix = "futures-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_channel__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-channel/0.3.28/download",
        type = "tar.gz",
        sha256 = "955518d47e09b25bbebc7a18df10b81f0c766eaf4c4f1cccef2fca5f2a4fb5f2",
        strip_prefix = "futures-channel-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-channel-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_core__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-core/0.3.28/download",
        type = "tar.gz",
        sha256 = "4bca583b7e26f571124fe5b7561d49cb2868d79116cfa0eefce955557c6fee8c",
        strip_prefix = "futures-core-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-core-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_executor__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-executor/0.3.28/download",
        type = "tar.gz",
        sha256 = "ccecee823288125bd88b4d7f565c9e58e41858e47ab72e8ea2d64e93624386e0",
        strip_prefix = "futures-executor-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-executor-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_io__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-io/0.3.28/download",
        type = "tar.gz",
        sha256 = "4fff74096e71ed47f8e023204cfd0aa1289cd54ae5430a9523be060cdb849964",
        strip_prefix = "futures-io-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-io-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_macro__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-macro/0.3.28/download",
        type = "tar.gz",
        sha256 = "89ca545a94061b6365f2c7355b4b32bd20df3ff95f02da9329b34ccc3bd6ee72",
        strip_prefix = "futures-macro-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-macro-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_sink__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-sink/0.3.28/download",
        type = "tar.gz",
        sha256 = "f43be4fe21a13b9781a69afa4985b0f6ee0e1afab2c6f454a8cf30e2b2237b6e",
        strip_prefix = "futures-sink-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-sink-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_task__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-task/0.3.28/download",
        type = "tar.gz",
        sha256 = "76d3d132be6c0e6aa1534069c705a74a5997a356c0dc2f86a47765e5617c5b65",
        strip_prefix = "futures-task-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-task-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__futures_util__0_3_28",
        url = "https://crates.io/api/v1/crates/futures-util/0.3.28/download",
        type = "tar.gz",
        sha256 = "26b01e40b772d54cf6c6d721c1d1abd0647a0106a12ecaa1c186273392a69533",
        strip_prefix = "futures-util-0.3.28",
        build_file = Label("//third_party/rust/remote:BUILD.futures-util-0.3.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__getrandom__0_2_10",
        url = "https://crates.io/api/v1/crates/getrandom/0.2.10/download",
        type = "tar.gz",
        sha256 = "be4136b2a15dd319360be1c07d9933517ccf0be8f16bf62a3bee4f0d618df427",
        strip_prefix = "getrandom-0.2.10",
        build_file = Label("//third_party/rust/remote:BUILD.getrandom-0.2.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__h2__0_3_19",
        url = "https://crates.io/api/v1/crates/h2/0.3.19/download",
        type = "tar.gz",
        sha256 = "d357c7ae988e7d2182f7d7871d0b963962420b0678b0997ce7de72001aeab782",
        strip_prefix = "h2-0.3.19",
        build_file = Label("//third_party/rust/remote:BUILD.h2-0.3.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hashbrown__0_12_3",
        url = "https://crates.io/api/v1/crates/hashbrown/0.12.3/download",
        type = "tar.gz",
        sha256 = "8a9ee70c43aaf417c914396645a0fa852624801b24ebb7ae78fe8272889ac888",
        strip_prefix = "hashbrown-0.12.3",
        build_file = Label("//third_party/rust/remote:BUILD.hashbrown-0.12.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__heck__0_4_1",
        url = "https://crates.io/api/v1/crates/heck/0.4.1/download",
        type = "tar.gz",
        sha256 = "95505c38b4572b2d910cecb0281560f54b440a19336cbbcb27bf6ce6adc6f5a8",
        strip_prefix = "heck-0.4.1",
        build_file = Label("//third_party/rust/remote:BUILD.heck-0.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_2_6",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.2.6/download",
        type = "tar.gz",
        sha256 = "ee512640fe35acbfb4bb779db6f0d80704c2cacfa2e39b601ef3e3f47d1ae4c7",
        strip_prefix = "hermit-abi-0.2.6",
        build_file = Label("//third_party/rust/remote:BUILD.hermit-abi-0.2.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hermit_abi__0_3_1",
        url = "https://crates.io/api/v1/crates/hermit-abi/0.3.1/download",
        type = "tar.gz",
        sha256 = "fed44880c466736ef9a5c5b5facefb5ed0785676d0c02d612db14e54f0d84286",
        strip_prefix = "hermit-abi-0.3.1",
        build_file = Label("//third_party/rust/remote:BUILD.hermit-abi-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__http__0_2_9",
        url = "https://crates.io/api/v1/crates/http/0.2.9/download",
        type = "tar.gz",
        sha256 = "bd6effc99afb63425aff9b05836f029929e345a6148a14b7ecd5ab67af944482",
        strip_prefix = "http-0.2.9",
        build_file = Label("//third_party/rust/remote:BUILD.http-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__http_body__0_4_5",
        url = "https://crates.io/api/v1/crates/http-body/0.4.5/download",
        type = "tar.gz",
        sha256 = "d5f38f16d184e36f2408a55281cd658ecbd3ca05cce6d6510a176eca393e26d1",
        strip_prefix = "http-body-0.4.5",
        build_file = Label("//third_party/rust/remote:BUILD.http-body-0.4.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__httparse__1_8_0",
        url = "https://crates.io/api/v1/crates/httparse/1.8.0/download",
        type = "tar.gz",
        sha256 = "d897f394bad6a705d5f4104762e116a75639e470d80901eed05a860a95cb1904",
        strip_prefix = "httparse-1.8.0",
        build_file = Label("//third_party/rust/remote:BUILD.httparse-1.8.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__httpdate__1_0_2",
        url = "https://crates.io/api/v1/crates/httpdate/1.0.2/download",
        type = "tar.gz",
        sha256 = "c4a1e36c821dbe04574f602848a19f742f4fb3c98d40449f11bcad18d6b17421",
        strip_prefix = "httpdate-1.0.2",
        build_file = Label("//third_party/rust/remote:BUILD.httpdate-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__humantime__2_1_0",
        url = "https://crates.io/api/v1/crates/humantime/2.1.0/download",
        type = "tar.gz",
        sha256 = "9a3a5bfb195931eeb336b2a7b4d761daec841b97f947d34394601737a7bba5e4",
        strip_prefix = "humantime-2.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.humantime-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hyper__0_14_26",
        url = "https://crates.io/api/v1/crates/hyper/0.14.26/download",
        type = "tar.gz",
        sha256 = "ab302d72a6f11a3b910431ff93aae7e773078c769f0a3ef15fb9ec692ed147d4",
        strip_prefix = "hyper-0.14.26",
        build_file = Label("//third_party/rust/remote:BUILD.hyper-0.14.26.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__hyper_timeout__0_4_1",
        url = "https://crates.io/api/v1/crates/hyper-timeout/0.4.1/download",
        type = "tar.gz",
        sha256 = "bbb958482e8c7be4bc3cf272a766a2b0bf1a6755e7a6ae777f017a31d11b13b1",
        strip_prefix = "hyper-timeout-0.4.1",
        build_file = Label("//third_party/rust/remote:BUILD.hyper-timeout-0.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__indexmap__1_9_3",
        url = "https://crates.io/api/v1/crates/indexmap/1.9.3/download",
        type = "tar.gz",
        sha256 = "bd070e393353796e801d209ad339e89596eb4c8d430d18ede6a1cced8fafbd99",
        strip_prefix = "indexmap-1.9.3",
        build_file = Label("//third_party/rust/remote:BUILD.indexmap-1.9.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__instant__0_1_12",
        url = "https://crates.io/api/v1/crates/instant/0.1.12/download",
        type = "tar.gz",
        sha256 = "7a5bbe824c507c5da5956355e86a746d82e0e1464f65d862cc5e71da70e94b2c",
        strip_prefix = "instant-0.1.12",
        build_file = Label("//third_party/rust/remote:BUILD.instant-0.1.12.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__io_lifetimes__1_0_11",
        url = "https://crates.io/api/v1/crates/io-lifetimes/1.0.11/download",
        type = "tar.gz",
        sha256 = "eae7b9aee968036d54dce06cebaefd919e4472e753296daccd6d344e3e2df0c2",
        strip_prefix = "io-lifetimes-1.0.11",
        build_file = Label("//third_party/rust/remote:BUILD.io-lifetimes-1.0.11.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__is_terminal__0_4_7",
        url = "https://crates.io/api/v1/crates/is-terminal/0.4.7/download",
        type = "tar.gz",
        sha256 = "adcf93614601c8129ddf72e2d5633df827ba6551541c6d8c59520a371475be1f",
        strip_prefix = "is-terminal-0.4.7",
        build_file = Label("//third_party/rust/remote:BUILD.is-terminal-0.4.7.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itertools__0_10_5",
        url = "https://crates.io/api/v1/crates/itertools/0.10.5/download",
        type = "tar.gz",
        sha256 = "b0fd2260e829bddf4cb6ea802289de2f86d6a7a690192fbe91b3f46e0f2c8473",
        strip_prefix = "itertools-0.10.5",
        build_file = Label("//third_party/rust/remote:BUILD.itertools-0.10.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__itoa__1_0_6",
        url = "https://crates.io/api/v1/crates/itoa/1.0.6/download",
        type = "tar.gz",
        sha256 = "453ad9f582a441959e5f0d088b02ce04cfe8d51a8eaf077f12ac6d3e94164ca6",
        strip_prefix = "itoa-1.0.6",
        build_file = Label("//third_party/rust/remote:BUILD.itoa-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__js_sys__0_3_63",
        url = "https://crates.io/api/v1/crates/js-sys/0.3.63/download",
        type = "tar.gz",
        sha256 = "2f37a4a5928311ac501dee68b3c7613a1037d0edb30c8e5427bd832d55d1b790",
        strip_prefix = "js-sys-0.3.63",
        build_file = Label("//third_party/rust/remote:BUILD.js-sys-0.3.63.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lazy_static__1_4_0",
        url = "https://crates.io/api/v1/crates/lazy_static/1.4.0/download",
        type = "tar.gz",
        sha256 = "e2abad23fbc42b3700f2f279844dc832adb2b2eb069b2df918f455c4e18cc646",
        strip_prefix = "lazy_static-1.4.0",
        build_file = Label("//third_party/rust/remote:BUILD.lazy_static-1.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__libc__0_2_146",
        url = "https://crates.io/api/v1/crates/libc/0.2.146/download",
        type = "tar.gz",
        sha256 = "f92be4933c13fd498862a9e02a3055f8a8d9c039ce33db97306fd5a6caa7f29b",
        strip_prefix = "libc-0.2.146",
        build_file = Label("//third_party/rust/remote:BUILD.libc-0.2.146.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__linux_raw_sys__0_3_8",
        url = "https://crates.io/api/v1/crates/linux-raw-sys/0.3.8/download",
        type = "tar.gz",
        sha256 = "ef53942eb7bf7ff43a617b3e2c1c4a5ecf5944a7c1bc12d7ee39bbb15e5c1519",
        strip_prefix = "linux-raw-sys-0.3.8",
        build_file = Label("//third_party/rust/remote:BUILD.linux-raw-sys-0.3.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__lock_api__0_4_10",
        url = "https://crates.io/api/v1/crates/lock_api/0.4.10/download",
        type = "tar.gz",
        sha256 = "c1cc9717a20b1bb222f333e6a92fd32f7d8a18ddc5a3191a11af45dcbf4dcd16",
        strip_prefix = "lock_api-0.4.10",
        build_file = Label("//third_party/rust/remote:BUILD.lock_api-0.4.10.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__log__0_4_18",
        url = "https://crates.io/api/v1/crates/log/0.4.18/download",
        type = "tar.gz",
        sha256 = "518ef76f2f87365916b142844c16d8fefd85039bc5699050210a7778ee1cd1de",
        strip_prefix = "log-0.4.18",
        build_file = Label("//third_party/rust/remote:BUILD.log-0.4.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__matchit__0_7_0",
        url = "https://crates.io/api/v1/crates/matchit/0.7.0/download",
        type = "tar.gz",
        sha256 = "b87248edafb776e59e6ee64a79086f65890d3510f2c656c000bf2a7e8a0aea40",
        strip_prefix = "matchit-0.7.0",
        build_file = Label("//third_party/rust/remote:BUILD.matchit-0.7.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__memchr__2_5_0",
        url = "https://crates.io/api/v1/crates/memchr/2.5.0/download",
        type = "tar.gz",
        sha256 = "2dffe52ecf27772e601905b7522cb4ef790d2cc203488bbd0e2fe85fcb74566d",
        strip_prefix = "memchr-2.5.0",
        build_file = Label("//third_party/rust/remote:BUILD.memchr-2.5.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mime__0_3_17",
        url = "https://crates.io/api/v1/crates/mime/0.3.17/download",
        type = "tar.gz",
        sha256 = "6877bb514081ee2a7ff5ef9de3281f14a4dd4bceac4c09388074a6b5df8a139a",
        strip_prefix = "mime-0.3.17",
        build_file = Label("//third_party/rust/remote:BUILD.mime-0.3.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__mio__0_8_8",
        url = "https://crates.io/api/v1/crates/mio/0.8.8/download",
        type = "tar.gz",
        sha256 = "927a765cd3fc26206e66b296465fa9d3e5ab003e651c1b3c060e7956d96b19d2",
        strip_prefix = "mio-0.8.8",
        build_file = Label("//third_party/rust/remote:BUILD.mio-0.8.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__multimap__0_8_3",
        url = "https://crates.io/api/v1/crates/multimap/0.8.3/download",
        type = "tar.gz",
        sha256 = "e5ce46fe64a9d73be07dcbe690a38ce1b293be448fd8ce1e6c1b8062c9f72c6a",
        strip_prefix = "multimap-0.8.3",
        build_file = Label("//third_party/rust/remote:BUILD.multimap-0.8.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_traits__0_2_15",
        url = "https://crates.io/api/v1/crates/num-traits/0.2.15/download",
        type = "tar.gz",
        sha256 = "578ede34cf02f8924ab9447f50c28075b4d3e5b269972345e7e0372b38c6cdcd",
        strip_prefix = "num-traits-0.2.15",
        build_file = Label("//third_party/rust/remote:BUILD.num-traits-0.2.15.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__num_cpus__1_15_0",
        url = "https://crates.io/api/v1/crates/num_cpus/1.15.0/download",
        type = "tar.gz",
        sha256 = "0fac9e2da13b5eb447a6ce3d392f23a29d8694bff781bf03a16cd9ac8697593b",
        strip_prefix = "num_cpus-1.15.0",
        build_file = Label("//third_party/rust/remote:BUILD.num_cpus-1.15.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__once_cell__1_18_0",
        url = "https://crates.io/api/v1/crates/once_cell/1.18.0/download",
        type = "tar.gz",
        sha256 = "dd8b5dd2ae5ed71462c540258bedcb51965123ad7e7ccf4b9a8cafaa4a63576d",
        strip_prefix = "once_cell-1.18.0",
        build_file = Label("//third_party/rust/remote:BUILD.once_cell-1.18.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot__0_12_1",
        url = "https://crates.io/api/v1/crates/parking_lot/0.12.1/download",
        type = "tar.gz",
        sha256 = "3742b2c103b9f06bc9fff0a37ff4912935851bee6d36f3c02bcc755bcfec228f",
        strip_prefix = "parking_lot-0.12.1",
        build_file = Label("//third_party/rust/remote:BUILD.parking_lot-0.12.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__parking_lot_core__0_9_8",
        url = "https://crates.io/api/v1/crates/parking_lot_core/0.9.8/download",
        type = "tar.gz",
        sha256 = "93f00c865fe7cabf650081affecd3871070f26767e7b2070a3ffae14c654b447",
        strip_prefix = "parking_lot_core-0.9.8",
        build_file = Label("//third_party/rust/remote:BUILD.parking_lot_core-0.9.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pbjson__0_5_1",
        url = "https://crates.io/api/v1/crates/pbjson/0.5.1/download",
        type = "tar.gz",
        sha256 = "048f9ac93c1eab514f9470c4bc8d97ca2a0a236b84f45cc19d69a59fc11467f6",
        strip_prefix = "pbjson-0.5.1",
        build_file = Label("//third_party/rust/remote:BUILD.pbjson-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pbjson_build__0_5_1",
        url = "https://crates.io/api/v1/crates/pbjson-build/0.5.1/download",
        type = "tar.gz",
        sha256 = "bdbb7b706f2afc610f3853550cdbbf6372fd324824a087806bd4480ea4996e24",
        strip_prefix = "pbjson-build-0.5.1",
        build_file = Label("//third_party/rust/remote:BUILD.pbjson-build-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pbjson_types__0_5_1",
        url = "https://crates.io/api/v1/crates/pbjson-types/0.5.1/download",
        type = "tar.gz",
        sha256 = "4a88c8d87f99a4ac14325e7a4c24af190fca261956e3b82dd7ed67e77e6c7043",
        strip_prefix = "pbjson-types-0.5.1",
        build_file = Label("//third_party/rust/remote:BUILD.pbjson-types-0.5.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__percent_encoding__2_3_0",
        url = "https://crates.io/api/v1/crates/percent-encoding/2.3.0/download",
        type = "tar.gz",
        sha256 = "9b2a4787296e9989611394c33f193f676704af1686e70b8f8033ab5ba9a35a94",
        strip_prefix = "percent-encoding-2.3.0",
        build_file = Label("//third_party/rust/remote:BUILD.percent-encoding-2.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__petgraph__0_6_3",
        url = "https://crates.io/api/v1/crates/petgraph/0.6.3/download",
        type = "tar.gz",
        sha256 = "4dd7d28ee937e54fe3080c91faa1c3a46c06de6252988a7f4592ba2310ef22a4",
        strip_prefix = "petgraph-0.6.3",
        build_file = Label("//third_party/rust/remote:BUILD.petgraph-0.6.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project__1_1_0",
        url = "https://crates.io/api/v1/crates/pin-project/1.1.0/download",
        type = "tar.gz",
        sha256 = "c95a7476719eab1e366eaf73d0260af3021184f18177925b07f54b30089ceead",
        strip_prefix = "pin-project-1.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.pin-project-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_internal__1_1_0",
        url = "https://crates.io/api/v1/crates/pin-project-internal/1.1.0/download",
        type = "tar.gz",
        sha256 = "39407670928234ebc5e6e580247dd567ad73a3578460c5990f9503df207e8f07",
        strip_prefix = "pin-project-internal-1.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.pin-project-internal-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_project_lite__0_2_9",
        url = "https://crates.io/api/v1/crates/pin-project-lite/0.2.9/download",
        type = "tar.gz",
        sha256 = "e0a7ae3ac2f1173085d398531c705756c94a4c56843785df85a60c1a0afac116",
        strip_prefix = "pin-project-lite-0.2.9",
        build_file = Label("//third_party/rust/remote:BUILD.pin-project-lite-0.2.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__pin_utils__0_1_0",
        url = "https://crates.io/api/v1/crates/pin-utils/0.1.0/download",
        type = "tar.gz",
        sha256 = "8b870d8c151b6f2fb93e84a13146138f05d02ed11c7e7c54f8826aaaf7c9f184",
        strip_prefix = "pin-utils-0.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.pin-utils-0.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ppv_lite86__0_2_17",
        url = "https://crates.io/api/v1/crates/ppv-lite86/0.2.17/download",
        type = "tar.gz",
        sha256 = "5b40af805b3121feab8a3c29f04d8ad262fa8e0561883e7653e024ae4479e6de",
        strip_prefix = "ppv-lite86-0.2.17",
        build_file = Label("//third_party/rust/remote:BUILD.ppv-lite86-0.2.17.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__prettyplease__0_1_25",
        url = "https://crates.io/api/v1/crates/prettyplease/0.1.25/download",
        type = "tar.gz",
        sha256 = "6c8646e95016a7a6c4adea95bafa8a16baab64b583356217f2c85db4a39d9a86",
        strip_prefix = "prettyplease-0.1.25",
        build_file = Label("//third_party/rust/remote:BUILD.prettyplease-0.1.25.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__proc_macro2__1_0_59",
        url = "https://crates.io/api/v1/crates/proc-macro2/1.0.59/download",
        type = "tar.gz",
        sha256 = "6aeca18b86b413c660b781aa319e4e2648a3e6f9eadc9b47e9038e6fe9f3451b",
        strip_prefix = "proc-macro2-1.0.59",
        build_file = Label("//third_party/rust/remote:BUILD.proc-macro2-1.0.59.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__prost__0_11_9",
        url = "https://crates.io/api/v1/crates/prost/0.11.9/download",
        type = "tar.gz",
        sha256 = "0b82eaa1d779e9a4bc1c3217db8ffbeabaae1dca241bf70183242128d48681cd",
        strip_prefix = "prost-0.11.9",
        build_file = Label("//third_party/rust/remote:BUILD.prost-0.11.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__prost_build__0_11_9",
        url = "https://crates.io/api/v1/crates/prost-build/0.11.9/download",
        type = "tar.gz",
        sha256 = "119533552c9a7ffacc21e099c24a0ac8bb19c2a2a3f363de84cd9b844feab270",
        strip_prefix = "prost-build-0.11.9",
        build_file = Label("//third_party/rust/remote:BUILD.prost-build-0.11.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__prost_derive__0_11_9",
        url = "https://crates.io/api/v1/crates/prost-derive/0.11.9/download",
        type = "tar.gz",
        sha256 = "e5d2d8d10f3c6ded6da8b05b5fb3b8a5082514344d56c9f871412d29b4e075b4",
        strip_prefix = "prost-derive-0.11.9",
        build_file = Label("//third_party/rust/remote:BUILD.prost-derive-0.11.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__prost_types__0_11_9",
        url = "https://crates.io/api/v1/crates/prost-types/0.11.9/download",
        type = "tar.gz",
        sha256 = "213622a1460818959ac1181aaeb2dc9c7f63df720db7d788b3e24eacd1983e13",
        strip_prefix = "prost-types-0.11.9",
        build_file = Label("//third_party/rust/remote:BUILD.prost-types-0.11.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protobuf__3_2_0",
        url = "https://crates.io/api/v1/crates/protobuf/3.2.0/download",
        type = "tar.gz",
        sha256 = "b55bad9126f378a853655831eb7363b7b01b81d19f8cb1218861086ca4a1a61e",
        strip_prefix = "protobuf-3.2.0",
        build_file = Label("//third_party/rust/remote:BUILD.protobuf-3.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protobuf_support__3_2_0",
        url = "https://crates.io/api/v1/crates/protobuf-support/3.2.0/download",
        type = "tar.gz",
        sha256 = "a5d4d7b8601c814cfb36bcebb79f0e61e45e1e93640cf778837833bbed05c372",
        strip_prefix = "protobuf-support-3.2.0",
        build_file = Label("//third_party/rust/remote:BUILD.protobuf-support-3.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protoc_gen_prost__0_2_2",
        url = "https://crates.io/api/v1/crates/protoc-gen-prost/0.2.2/download",
        type = "tar.gz",
        sha256 = "a81e3a9bb429fec47008b209896f0b9ab99fbcbc1c3733b385d43fbfd64dd2ca",
        strip_prefix = "protoc-gen-prost-0.2.2",
        build_file = Label("//third_party/rust/remote:BUILD.protoc-gen-prost-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protoc_gen_prost_crate__0_3_0",
        url = "https://crates.io/api/v1/crates/protoc-gen-prost-crate/0.3.0/download",
        type = "tar.gz",
        sha256 = "86260f78c191fb1cf07c06c0ef72b0c63512faa124932c84f097053690257708",
        strip_prefix = "protoc-gen-prost-crate-0.3.0",
        build_file = Label("//third_party/rust/remote:BUILD.protoc-gen-prost-crate-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protoc_gen_prost_serde__0_2_3",
        url = "https://crates.io/api/v1/crates/protoc-gen-prost-serde/0.2.3/download",
        type = "tar.gz",
        sha256 = "60e9eed65ec11e647364242c7942932f3631ba0ce7bf40d71235662c6e3c8dc9",
        strip_prefix = "protoc-gen-prost-serde-0.2.3",
        build_file = Label("//third_party/rust/remote:BUILD.protoc-gen-prost-serde-0.2.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protoc_gen_tonic__0_2_2",
        url = "https://crates.io/api/v1/crates/protoc-gen-tonic/0.2.2/download",
        type = "tar.gz",
        sha256 = "725a07a704f9cf7a956b302c21d81b5516ed5ee6cfbbf827edb69beeaae6cc30",
        strip_prefix = "protoc-gen-tonic-0.2.2",
        build_file = Label("//third_party/rust/remote:BUILD.protoc-gen-tonic-0.2.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__protoc_wkt__1_0_0_3_20_1",
        url = "https://crates.io/api/v1/crates/protoc-wkt/1.0.0+3.20.1/download",
        type = "tar.gz",
        sha256 = "ae1d0fdc23ea945d58449259496ba12d3b520da1a45ce5011f631c990add9029",
        strip_prefix = "protoc-wkt-1.0.0+3.20.1",
        build_file = Label("//third_party/rust/remote:BUILD.protoc-wkt-1.0.0+3.20.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__quote__1_0_28",
        url = "https://crates.io/api/v1/crates/quote/1.0.28/download",
        type = "tar.gz",
        sha256 = "1b9ab9c7eadfd8df19006f1cf1a4aed13540ed5cbc047010ece5826e10825488",
        strip_prefix = "quote-1.0.28",
        build_file = Label("//third_party/rust/remote:BUILD.quote-1.0.28.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand__0_8_5",
        url = "https://crates.io/api/v1/crates/rand/0.8.5/download",
        type = "tar.gz",
        sha256 = "34af8d1a0e25924bc5b7c43c079c942339d8f0a8b57c39049bef581b46327404",
        strip_prefix = "rand-0.8.5",
        build_file = Label("//third_party/rust/remote:BUILD.rand-0.8.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_chacha__0_3_1",
        url = "https://crates.io/api/v1/crates/rand_chacha/0.3.1/download",
        type = "tar.gz",
        sha256 = "e6c10a63a0fa32252be49d21e7709d4d4baf8d231c2dbce1eaa8141b9b127d88",
        strip_prefix = "rand_chacha-0.3.1",
        build_file = Label("//third_party/rust/remote:BUILD.rand_chacha-0.3.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rand_core__0_6_4",
        url = "https://crates.io/api/v1/crates/rand_core/0.6.4/download",
        type = "tar.gz",
        sha256 = "ec0be4795e2f6a28069bec0b5ff3e2ac9bafc99e6a9a7dc3547996c5c816922c",
        strip_prefix = "rand_core-0.6.4",
        build_file = Label("//third_party/rust/remote:BUILD.rand_core-0.6.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__redox_syscall__0_3_5",
        url = "https://crates.io/api/v1/crates/redox_syscall/0.3.5/download",
        type = "tar.gz",
        sha256 = "567664f262709473930a4bf9e51bf2ebf3348f2e748ccc50dea20646858f8f29",
        strip_prefix = "redox_syscall-0.3.5",
        build_file = Label("//third_party/rust/remote:BUILD.redox_syscall-0.3.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex__1_8_4",
        url = "https://crates.io/api/v1/crates/regex/1.8.4/download",
        type = "tar.gz",
        sha256 = "d0ab3ca65655bb1e41f2a8c8cd662eb4fb035e67c3f78da1d61dffe89d07300f",
        strip_prefix = "regex-1.8.4",
        build_file = Label("//third_party/rust/remote:BUILD.regex-1.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__regex_syntax__0_7_2",
        url = "https://crates.io/api/v1/crates/regex-syntax/0.7.2/download",
        type = "tar.gz",
        sha256 = "436b050e76ed2903236f032a59761c1eb99e1b0aead2c257922771dab1fc8c78",
        strip_prefix = "regex-syntax-0.7.2",
        build_file = Label("//third_party/rust/remote:BUILD.regex-syntax-0.7.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ring__0_16_20",
        url = "https://crates.io/api/v1/crates/ring/0.16.20/download",
        type = "tar.gz",
        sha256 = "3053cf52e236a3ed746dfc745aa9cacf1b791d846bdaf412f60a8d7d6e17c8fc",
        strip_prefix = "ring-0.16.20",
        build_file = Label("//third_party/rust/remote:BUILD.ring-0.16.20.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustix__0_37_19",
        url = "https://crates.io/api/v1/crates/rustix/0.37.19/download",
        type = "tar.gz",
        sha256 = "acf8729d8542766f1b2cf77eb034d52f40d375bb8b615d0b147089946e16613d",
        strip_prefix = "rustix-0.37.19",
        build_file = Label("//third_party/rust/remote:BUILD.rustix-0.37.19.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustls_webpki__0_100_1",
        url = "https://crates.io/api/v1/crates/rustls-webpki/0.100.1/download",
        type = "tar.gz",
        sha256 = "d6207cd5ed3d8dca7816f8f3725513a34609c0c765bf652b8c3cb4cfd87db46b",
        strip_prefix = "rustls-webpki-0.100.1",
        build_file = Label("//third_party/rust/remote:BUILD.rustls-webpki-0.100.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__rustversion__1_0_12",
        url = "https://crates.io/api/v1/crates/rustversion/1.0.12/download",
        type = "tar.gz",
        sha256 = "4f3208ce4d8448b3f3e7d168a73f5e0c43a61e32930de3bceeccedb388b6bf06",
        strip_prefix = "rustversion-1.0.12",
        build_file = Label("//third_party/rust/remote:BUILD.rustversion-1.0.12.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__ryu__1_0_13",
        url = "https://crates.io/api/v1/crates/ryu/1.0.13/download",
        type = "tar.gz",
        sha256 = "f91339c0467de62360649f8d3e185ca8de4224ff281f66000de5eb2a77a79041",
        strip_prefix = "ryu-1.0.13",
        build_file = Label("//third_party/rust/remote:BUILD.ryu-1.0.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__same_file__1_0_6",
        url = "https://crates.io/api/v1/crates/same-file/1.0.6/download",
        type = "tar.gz",
        sha256 = "93fc1dc3aaa9bfed95e02e6eadabb4baf7e3078b0bd1b4d7b6b0b68378900502",
        strip_prefix = "same-file-1.0.6",
        build_file = Label("//third_party/rust/remote:BUILD.same-file-1.0.6.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__scopeguard__1_1_0",
        url = "https://crates.io/api/v1/crates/scopeguard/1.1.0/download",
        type = "tar.gz",
        sha256 = "d29ab0c6d3fc0ee92fe66e2d99f700eab17a8d57d1c1d3b748380fb20baa78cd",
        strip_prefix = "scopeguard-1.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.scopeguard-1.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde__1_0_163",
        url = "https://crates.io/api/v1/crates/serde/1.0.163/download",
        type = "tar.gz",
        sha256 = "2113ab51b87a539ae008b5c6c02dc020ffa39afd2d83cffcb3f4eb2722cebec2",
        strip_prefix = "serde-1.0.163",
        build_file = Label("//third_party/rust/remote:BUILD.serde-1.0.163.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_derive__1_0_163",
        url = "https://crates.io/api/v1/crates/serde_derive/1.0.163/download",
        type = "tar.gz",
        sha256 = "8c805777e3930c8883389c602315a24224bcc738b63905ef87cd1420353ea93e",
        strip_prefix = "serde_derive-1.0.163",
        build_file = Label("//third_party/rust/remote:BUILD.serde_derive-1.0.163.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__serde_yaml__0_9_21",
        url = "https://crates.io/api/v1/crates/serde_yaml/0.9.21/download",
        type = "tar.gz",
        sha256 = "d9d684e3ec7de3bf5466b32bd75303ac16f0736426e5a4e0d6e489559ce1249c",
        strip_prefix = "serde_yaml-0.9.21",
        build_file = Label("//third_party/rust/remote:BUILD.serde_yaml-0.9.21.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__signal_hook_registry__1_4_1",
        url = "https://crates.io/api/v1/crates/signal-hook-registry/1.4.1/download",
        type = "tar.gz",
        sha256 = "d8229b473baa5980ac72ef434c4415e70c4b5e71b423043adb4ba059f89c99a1",
        strip_prefix = "signal-hook-registry-1.4.1",
        build_file = Label("//third_party/rust/remote:BUILD.signal-hook-registry-1.4.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__slab__0_4_8",
        url = "https://crates.io/api/v1/crates/slab/0.4.8/download",
        type = "tar.gz",
        sha256 = "6528351c9bc8ab22353f9d776db39a20288e8d6c37ef8cfe3317cf875eecfc2d",
        strip_prefix = "slab-0.4.8",
        build_file = Label("//third_party/rust/remote:BUILD.slab-0.4.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__smallvec__1_10_0",
        url = "https://crates.io/api/v1/crates/smallvec/1.10.0/download",
        type = "tar.gz",
        sha256 = "a507befe795404456341dfab10cef66ead4c041f62b8b11bbb92bffe5d0953e0",
        strip_prefix = "smallvec-1.10.0",
        build_file = Label("//third_party/rust/remote:BUILD.smallvec-1.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__socket2__0_4_9",
        url = "https://crates.io/api/v1/crates/socket2/0.4.9/download",
        type = "tar.gz",
        sha256 = "64a4a911eed85daf18834cfaa86a79b7d266ff93ff5ba14005426219480ed662",
        strip_prefix = "socket2-0.4.9",
        build_file = Label("//third_party/rust/remote:BUILD.socket2-0.4.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__spin__0_5_2",
        url = "https://crates.io/api/v1/crates/spin/0.5.2/download",
        type = "tar.gz",
        sha256 = "6e63cff320ae2c57904679ba7cb63280a3dc4613885beafb148ee7bf9aa9042d",
        strip_prefix = "spin-0.5.2",
        build_file = Label("//third_party/rust/remote:BUILD.spin-0.5.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__strsim__0_10_0",
        url = "https://crates.io/api/v1/crates/strsim/0.10.0/download",
        type = "tar.gz",
        sha256 = "73473c0e59e6d5812c5dfe2a064a6444949f089e20eec9a2e5506596494e4623",
        strip_prefix = "strsim-0.10.0",
        build_file = Label("//third_party/rust/remote:BUILD.strsim-0.10.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__1_0_109",
        url = "https://crates.io/api/v1/crates/syn/1.0.109/download",
        type = "tar.gz",
        sha256 = "72b64191b275b66ffe2469e8af2c1cfe3bafa67b529ead792a6d0160888b4237",
        strip_prefix = "syn-1.0.109",
        build_file = Label("//third_party/rust/remote:BUILD.syn-1.0.109.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__syn__2_0_18",
        url = "https://crates.io/api/v1/crates/syn/2.0.18/download",
        type = "tar.gz",
        sha256 = "32d41677bcbe24c20c52e7c70b0d8db04134c5d1066bf98662e2871ad200ea3e",
        strip_prefix = "syn-2.0.18",
        build_file = Label("//third_party/rust/remote:BUILD.syn-2.0.18.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__sync_wrapper__0_1_2",
        url = "https://crates.io/api/v1/crates/sync_wrapper/0.1.2/download",
        type = "tar.gz",
        sha256 = "2047c6ded9c721764247e62cd3b03c09ffc529b2ba5b10ec482ae507a4a70160",
        strip_prefix = "sync_wrapper-0.1.2",
        build_file = Label("//third_party/rust/remote:BUILD.sync_wrapper-0.1.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tempfile__3_6_0",
        url = "https://crates.io/api/v1/crates/tempfile/3.6.0/download",
        type = "tar.gz",
        sha256 = "31c0432476357e58790aaa47a8efb0c5138f137343f3b5f23bd36a27e3b0a6d6",
        strip_prefix = "tempfile-3.6.0",
        build_file = Label("//third_party/rust/remote:BUILD.tempfile-3.6.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__termcolor__1_2_0",
        url = "https://crates.io/api/v1/crates/termcolor/1.2.0/download",
        type = "tar.gz",
        sha256 = "be55cf8942feac5c765c2c993422806843c9a9a45d4d5c407ad6dd2ea95eb9b6",
        strip_prefix = "termcolor-1.2.0",
        build_file = Label("//third_party/rust/remote:BUILD.termcolor-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror/1.0.40/download",
        type = "tar.gz",
        sha256 = "978c9a314bd8dc99be594bc3c175faaa9794be04a5a5e153caba6915336cebac",
        strip_prefix = "thiserror-1.0.40",
        build_file = Label("//third_party/rust/remote:BUILD.thiserror-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__thiserror_impl__1_0_40",
        url = "https://crates.io/api/v1/crates/thiserror-impl/1.0.40/download",
        type = "tar.gz",
        sha256 = "f9456a42c5b0d803c8cd86e73dd7cc9edd429499f37a3550d286d5e86720569f",
        strip_prefix = "thiserror-impl-1.0.40",
        build_file = Label("//third_party/rust/remote:BUILD.thiserror-impl-1.0.40.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__to_unit__1_0_2",
        url = "https://crates.io/api/v1/crates/to_unit/1.0.2/download",
        type = "tar.gz",
        sha256 = "b5379f6ae86388c2615ae0b9e11c517398069a51367db60ff668c266e3d334ef",
        strip_prefix = "to_unit-1.0.2",
        build_file = Label("//third_party/rust/remote:BUILD.to_unit-1.0.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio__1_28_2",
        url = "https://crates.io/api/v1/crates/tokio/1.28.2/download",
        type = "tar.gz",
        sha256 = "94d7b1cfd2aa4011f2de74c2c4c63665e27a71006b0a192dcd2710272e73dfa2",
        strip_prefix = "tokio-1.28.2",
        build_file = Label("//third_party/rust/remote:BUILD.tokio-1.28.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_io_timeout__1_2_0",
        url = "https://crates.io/api/v1/crates/tokio-io-timeout/1.2.0/download",
        type = "tar.gz",
        sha256 = "30b74022ada614a1b4834de765f9bb43877f910cc8ce4be40e89042c9223a8bf",
        strip_prefix = "tokio-io-timeout-1.2.0",
        build_file = Label("//third_party/rust/remote:BUILD.tokio-io-timeout-1.2.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_macros__2_1_0",
        url = "https://crates.io/api/v1/crates/tokio-macros/2.1.0/download",
        type = "tar.gz",
        sha256 = "630bdcf245f78637c13ec01ffae6187cca34625e8c63150d424b59e55af2675e",
        strip_prefix = "tokio-macros-2.1.0",
        build_file = Label("//third_party/rust/remote:BUILD.tokio-macros-2.1.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_stream__0_1_14",
        url = "https://crates.io/api/v1/crates/tokio-stream/0.1.14/download",
        type = "tar.gz",
        sha256 = "397c988d37662c7dda6d2208364a706264bf3d6138b11d436cbac0ad38832842",
        strip_prefix = "tokio-stream-0.1.14",
        build_file = Label("//third_party/rust/remote:BUILD.tokio-stream-0.1.14.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tokio_util__0_7_8",
        url = "https://crates.io/api/v1/crates/tokio-util/0.7.8/download",
        type = "tar.gz",
        sha256 = "806fe8c2c87eccc8b3267cbae29ed3ab2d0bd37fca70ab622e46aaa9375ddb7d",
        strip_prefix = "tokio-util-0.7.8",
        build_file = Label("//third_party/rust/remote:BUILD.tokio-util-0.7.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tonic__0_9_2",
        url = "https://crates.io/api/v1/crates/tonic/0.9.2/download",
        type = "tar.gz",
        sha256 = "3082666a3a6433f7f511c7192923fa1fe07c69332d3c6a2e6bb040b569199d5a",
        strip_prefix = "tonic-0.9.2",
        build_file = Label("//third_party/rust/remote:BUILD.tonic-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tonic_build__0_8_4",
        url = "https://crates.io/api/v1/crates/tonic-build/0.8.4/download",
        type = "tar.gz",
        sha256 = "5bf5e9b9c0f7e0a7c027dcfaba7b2c60816c7049171f679d99ee2ff65d0de8c4",
        strip_prefix = "tonic-build-0.8.4",
        build_file = Label("//third_party/rust/remote:BUILD.tonic-build-0.8.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tonic_build__0_9_2",
        url = "https://crates.io/api/v1/crates/tonic-build/0.9.2/download",
        type = "tar.gz",
        sha256 = "a6fdaae4c2c638bb70fe42803a26fbd6fc6ac8c72f5c59f67ecc2a2dcabf4b07",
        strip_prefix = "tonic-build-0.9.2",
        build_file = Label("//third_party/rust/remote:BUILD.tonic-build-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tonic_reflection__0_9_2",
        url = "https://crates.io/api/v1/crates/tonic-reflection/0.9.2/download",
        type = "tar.gz",
        sha256 = "0543d7092032041fbeac1f2c84304537553421a11a623c2301b12ef0264862c7",
        strip_prefix = "tonic-reflection-0.9.2",
        build_file = Label("//third_party/rust/remote:BUILD.tonic-reflection-0.9.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tower__0_4_13",
        url = "https://crates.io/api/v1/crates/tower/0.4.13/download",
        type = "tar.gz",
        sha256 = "b8fa9be0de6cf49e536ce1851f987bd21a43b771b09473c3549a6c853db37c1c",
        strip_prefix = "tower-0.4.13",
        build_file = Label("//third_party/rust/remote:BUILD.tower-0.4.13.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tower_layer__0_3_2",
        url = "https://crates.io/api/v1/crates/tower-layer/0.3.2/download",
        type = "tar.gz",
        sha256 = "c20c8dbed6283a09604c3e69b4b7eeb54e298b8a600d4d5ecb5ad39de609f1d0",
        strip_prefix = "tower-layer-0.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.tower-layer-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tower_service__0_3_2",
        url = "https://crates.io/api/v1/crates/tower-service/0.3.2/download",
        type = "tar.gz",
        sha256 = "b6bc1c9ce2b5135ac7f93c72918fc37feb872bdc6a5533a8b85eb4b86bfdae52",
        strip_prefix = "tower-service-0.3.2",
        build_file = Label("//third_party/rust/remote:BUILD.tower-service-0.3.2.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing__0_1_37",
        url = "https://crates.io/api/v1/crates/tracing/0.1.37/download",
        type = "tar.gz",
        sha256 = "8ce8c33a8d48bd45d624a6e523445fd21ec13d3653cd51f681abf67418f54eb8",
        strip_prefix = "tracing-0.1.37",
        build_file = Label("//third_party/rust/remote:BUILD.tracing-0.1.37.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_attributes__0_1_24",
        url = "https://crates.io/api/v1/crates/tracing-attributes/0.1.24/download",
        type = "tar.gz",
        sha256 = "0f57e3ca2a01450b1a921183a9c9cbfda207fd822cef4ccb00a65402cbba7a74",
        strip_prefix = "tracing-attributes-0.1.24",
        build_file = Label("//third_party/rust/remote:BUILD.tracing-attributes-0.1.24.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__tracing_core__0_1_31",
        url = "https://crates.io/api/v1/crates/tracing-core/0.1.31/download",
        type = "tar.gz",
        sha256 = "0955b8137a1df6f1a2e9a37d8a6656291ff0297c1a97c24e0d8425fe2312f79a",
        strip_prefix = "tracing-core-0.1.31",
        build_file = Label("//third_party/rust/remote:BUILD.tracing-core-0.1.31.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__try_lock__0_2_4",
        url = "https://crates.io/api/v1/crates/try-lock/0.2.4/download",
        type = "tar.gz",
        sha256 = "3528ecfd12c466c6f163363caf2d02a71161dd5e1cc6ae7b34207ea2d42d81ed",
        strip_prefix = "try-lock-0.2.4",
        build_file = Label("//third_party/rust/remote:BUILD.try-lock-0.2.4.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unicode_ident__1_0_9",
        url = "https://crates.io/api/v1/crates/unicode-ident/1.0.9/download",
        type = "tar.gz",
        sha256 = "b15811caf2415fb889178633e7724bad2509101cde276048e013b9def5e51fa0",
        strip_prefix = "unicode-ident-1.0.9",
        build_file = Label("//third_party/rust/remote:BUILD.unicode-ident-1.0.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__unsafe_libyaml__0_2_8",
        url = "https://crates.io/api/v1/crates/unsafe-libyaml/0.2.8/download",
        type = "tar.gz",
        sha256 = "1865806a559042e51ab5414598446a5871b561d21b6764f2eabb0dd481d880a6",
        strip_prefix = "unsafe-libyaml-0.2.8",
        build_file = Label("//third_party/rust/remote:BUILD.unsafe-libyaml-0.2.8.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__untrusted__0_7_1",
        url = "https://crates.io/api/v1/crates/untrusted/0.7.1/download",
        type = "tar.gz",
        sha256 = "a156c684c91ea7d62626509bce3cb4e1d9ed5c4d978f7b4352658f96a4c26b4a",
        strip_prefix = "untrusted-0.7.1",
        build_file = Label("//third_party/rust/remote:BUILD.untrusted-0.7.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__utf8parse__0_2_1",
        url = "https://crates.io/api/v1/crates/utf8parse/0.2.1/download",
        type = "tar.gz",
        sha256 = "711b9620af191e0cdc7468a8d14e709c3dcdb115b36f838e601583af800a370a",
        strip_prefix = "utf8parse-0.2.1",
        build_file = Label("//third_party/rust/remote:BUILD.utf8parse-0.2.1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__uuid__1_3_3",
        url = "https://crates.io/api/v1/crates/uuid/1.3.3/download",
        type = "tar.gz",
        sha256 = "345444e32442451b267fc254ae85a209c64be56d2890e601a0c37ff0c3c5ecd2",
        strip_prefix = "uuid-1.3.3",
        build_file = Label("//third_party/rust/remote:BUILD.uuid-1.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__walkdir__2_3_3",
        url = "https://crates.io/api/v1/crates/walkdir/2.3.3/download",
        type = "tar.gz",
        sha256 = "36df944cda56c7d8d8b7496af378e6b16de9284591917d307c9b4d313c44e698",
        strip_prefix = "walkdir-2.3.3",
        build_file = Label("//third_party/rust/remote:BUILD.walkdir-2.3.3.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__want__0_3_0",
        url = "https://crates.io/api/v1/crates/want/0.3.0/download",
        type = "tar.gz",
        sha256 = "1ce8a968cb1cd110d136ff8b819a556d6fb6d919363c61534f6860c7eb172ba0",
        strip_prefix = "want-0.3.0",
        build_file = Label("//third_party/rust/remote:BUILD.want-0.3.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasi__0_11_0_wasi_snapshot_preview1",
        url = "https://crates.io/api/v1/crates/wasi/0.11.0+wasi-snapshot-preview1/download",
        type = "tar.gz",
        sha256 = "9c8d87e72b64a3b4db28d11ce29237c246188f4f51057d65a7eab63b7987e423",
        strip_prefix = "wasi-0.11.0+wasi-snapshot-preview1",
        build_file = Label("//third_party/rust/remote:BUILD.wasi-0.11.0+wasi-snapshot-preview1.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen__0_2_86",
        url = "https://crates.io/api/v1/crates/wasm-bindgen/0.2.86/download",
        type = "tar.gz",
        sha256 = "5bba0e8cb82ba49ff4e229459ff22a191bbe9a1cb3a341610c9c33efc27ddf73",
        strip_prefix = "wasm-bindgen-0.2.86",
        build_file = Label("//third_party/rust/remote:BUILD.wasm-bindgen-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_backend__0_2_86",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-backend/0.2.86/download",
        type = "tar.gz",
        sha256 = "19b04bc93f9d6bdee709f6bd2118f57dd6679cf1176a1af464fca3ab0d66d8fb",
        strip_prefix = "wasm-bindgen-backend-0.2.86",
        build_file = Label("//third_party/rust/remote:BUILD.wasm-bindgen-backend-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro__0_2_86",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro/0.2.86/download",
        type = "tar.gz",
        sha256 = "14d6b024f1a526bb0234f52840389927257beb670610081360e5a03c5df9c258",
        strip_prefix = "wasm-bindgen-macro-0.2.86",
        build_file = Label("//third_party/rust/remote:BUILD.wasm-bindgen-macro-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_macro_support__0_2_86",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-macro-support/0.2.86/download",
        type = "tar.gz",
        sha256 = "e128beba882dd1eb6200e1dc92ae6c5dbaa4311aa7bb211ca035779e5efc39f8",
        strip_prefix = "wasm-bindgen-macro-support-0.2.86",
        build_file = Label("//third_party/rust/remote:BUILD.wasm-bindgen-macro-support-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__wasm_bindgen_shared__0_2_86",
        url = "https://crates.io/api/v1/crates/wasm-bindgen-shared/0.2.86/download",
        type = "tar.gz",
        sha256 = "ed9d5b4305409d1fc9482fee2d7f9bcbf24b3972bf59817ef757e23982242a93",
        strip_prefix = "wasm-bindgen-shared-0.2.86",
        build_file = Label("//third_party/rust/remote:BUILD.wasm-bindgen-shared-0.2.86.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__web_sys__0_3_63",
        url = "https://crates.io/api/v1/crates/web-sys/0.3.63/download",
        type = "tar.gz",
        sha256 = "3bdd9ef4e984da1187bf8110c5cf5b845fbc87a23602cdf912386a76fcd3a7c2",
        strip_prefix = "web-sys-0.3.63",
        build_file = Label("//third_party/rust/remote:BUILD.web-sys-0.3.63.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__which__4_4_0",
        url = "https://crates.io/api/v1/crates/which/4.4.0/download",
        type = "tar.gz",
        sha256 = "2441c784c52b289a054b7201fc93253e288f094e2f4be9058343127c4226a269",
        strip_prefix = "which-4.4.0",
        build_file = Label("//third_party/rust/remote:BUILD.which-4.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi__0_3_9",
        url = "https://crates.io/api/v1/crates/winapi/0.3.9/download",
        type = "tar.gz",
        sha256 = "5c839a674fcd7a98952e593242ea400abe93992746761e38641405d28b00f419",
        strip_prefix = "winapi-0.3.9",
        build_file = Label("//third_party/rust/remote:BUILD.winapi-0.3.9.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_i686_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-i686-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "ac3b87c63620426dd9b991e5ce0329eff545bccbbb34f3be09ff6fb6ab51b7b6",
        strip_prefix = "winapi-i686-pc-windows-gnu-0.4.0",
        build_file = Label("//third_party/rust/remote:BUILD.winapi-i686-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_util__0_1_5",
        url = "https://crates.io/api/v1/crates/winapi-util/0.1.5/download",
        type = "tar.gz",
        sha256 = "70ec6ce85bb158151cae5e5c87f95a8e97d2c0c4b001223f33a334e3ce5de178",
        strip_prefix = "winapi-util-0.1.5",
        build_file = Label("//third_party/rust/remote:BUILD.winapi-util-0.1.5.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__winapi_x86_64_pc_windows_gnu__0_4_0",
        url = "https://crates.io/api/v1/crates/winapi-x86_64-pc-windows-gnu/0.4.0/download",
        type = "tar.gz",
        sha256 = "712e227841d057c1ee1cd2fb22fa7e5a5461ae8e48fa2ca79ec42cfc1931183f",
        strip_prefix = "winapi-x86_64-pc-windows-gnu-0.4.0",
        build_file = Label("//third_party/rust/remote:BUILD.winapi-x86_64-pc-windows-gnu-0.4.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_sys__0_48_0",
        url = "https://crates.io/api/v1/crates/windows-sys/0.48.0/download",
        type = "tar.gz",
        sha256 = "677d2418bec65e3338edb076e806bc1ec15693c5d0104683f2efe857f61056a9",
        strip_prefix = "windows-sys-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows-sys-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_targets__0_48_0",
        url = "https://crates.io/api/v1/crates/windows-targets/0.48.0/download",
        type = "tar.gz",
        sha256 = "7b1eb6f0cd7c80c79759c929114ef071b87354ce476d9d94271031c0497adfd5",
        strip_prefix = "windows-targets-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows-targets-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_aarch64_gnullvm__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_aarch64_gnullvm/0.48.0/download",
        type = "tar.gz",
        sha256 = "91ae572e1b79dba883e0d315474df7305d12f569b400fcf90581b06062f7e1bc",
        strip_prefix = "windows_aarch64_gnullvm-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_aarch64_gnullvm-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_aarch64_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_aarch64_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "b2ef27e0d7bdfcfc7b868b317c1d32c641a6fe4629c171b8928c7b08d98d7cf3",
        strip_prefix = "windows_aarch64_msvc-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_aarch64_msvc-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_gnu__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_i686_gnu/0.48.0/download",
        type = "tar.gz",
        sha256 = "622a1962a7db830d6fd0a69683c80a18fda201879f0f447f065a3b7467daa241",
        strip_prefix = "windows_i686_gnu-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_i686_gnu-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_i686_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_i686_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "4542c6e364ce21bf45d69fdd2a8e455fa38d316158cfd43b3ac1c5b1b19f8e00",
        strip_prefix = "windows_i686_msvc-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_i686_msvc-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_gnu__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnu/0.48.0/download",
        type = "tar.gz",
        sha256 = "ca2b8a661f7628cbd23440e50b05d705db3686f894fc9580820623656af974b1",
        strip_prefix = "windows_x86_64_gnu-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_x86_64_gnu-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_gnullvm__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_gnullvm/0.48.0/download",
        type = "tar.gz",
        sha256 = "7896dbc1f41e08872e9d5e8f8baa8fdd2677f29468c4e156210174edc7f7b953",
        strip_prefix = "windows_x86_64_gnullvm-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_x86_64_gnullvm-0.48.0.bazel"),
    )

    maybe(
        http_archive,
        name = "raze__windows_x86_64_msvc__0_48_0",
        url = "https://crates.io/api/v1/crates/windows_x86_64_msvc/0.48.0/download",
        type = "tar.gz",
        sha256 = "1a515f5799fe4961cb532f983ce2b23082366b898e52ffbce459c86f67c8378a",
        strip_prefix = "windows_x86_64_msvc-0.48.0",
        build_file = Label("//third_party/rust/remote:BUILD.windows_x86_64_msvc-0.48.0.bazel"),
    )
