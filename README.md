# What Is It?

A light mxxru wrapper for spdlog library.

# How To Use

## Prerequisites

To use *spdlog_mxxru* it is necessary to have:

* C++11 compiler (VC++14.0, GCC 5.1 or above, clang 3.6 or above);
* [fmtlib](http://fmtlib.net/latest/index.html) 3.0.0 or above;
* [fmtlib_mxxru](https://github.com/stiffstream/fmtlib_mxxru) 0.1.0 or above;
* [spdlog](https://github.com/gabime/spdlog);
* [Mxx_ru](https://sourceforge.net/projects/mxxru/) 1.6.11 or above.

## Obtaining

### Cloning of Git Repository

```sh
git clone https://github.com/stiffstream/spdlog_mxxru
```
And then:
```sh
cd spdlog_mxxru
mxxruexternals
```
to download and extract *spdlog_mxxru*'s dependencies.

### MxxRu::externals recipe

For *spdlog_mxxru* itself:
```rb
MxxRu::arch_externals :spdlog_mxxru do |e|
  e.url 'https://github.com/Stiffstream/spdlog_mxxru/archive/v.1.2.1.tar.gz'

  e.map_dir 'dev/spdlog_mxxru' => 'dev'
end
```

For *spdlog* and *fmtlib* dependencies:
```rb
MxxRu::arch_externals :fmt do |e|
  e.url 'https://github.com/fmtlib/fmt/archive/3.0.0.zip'

  e.map_dir 'cppformat' => 'dev/fmt'
  e.map_dir 'fmt' => 'dev/fmt'
end

MxxRu::arch_externals :fmtlib_mxxru do |e|
  e.url 'https://github.com/Stiffstream/fmtlib_mxxru/archive/v.0.1.0.tar.gz'

  e.map_dir 'dev/fmt_mxxru' => 'dev'
end

MxxRu::arch_externals :spdlog do |e|
  e.url 'https://github.com/gabime/spdlog/archive/v0.9.0.zip'

  e.map_dir 'include' => 'dev/spdlog'
end
```

## Compilation

Compilation must be performed via Mxx_ru:
```sh
git clone https://github.com/spdlog_mxxru
cd spdlog_mxxru
mxxruexternals
cd dev
ruby build.rb
```
*NOTE.* It may be necessary to set up `MXX_RU_CPP_TOOLSET` environment variable.

# License

*spdlog_mxxru* is distributed under
[BSD-3-Clause](http://spdx.org/licenses/BSD-3-Clause.html) license. See LICENSE
file for more information.

For the license of *spdlog* library see LICENSE file in *spdlog*
distributive.

For the license of *fmt* library see LICENSE file in *fmt*
distributive.

