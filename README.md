# What Is It?

A light mxxru wrapper for spdlog library.

# How To Use

## Prerequisites

To use *spdlog_mxxru* it is necessary to have:

* C++11 compiler (VC++14.0, GCC 5.1 or above, clang 3.6 or above);
* [spdlog](https://github.com/gabime/spdlog);
* [Mxx_ru](https://sourceforge.net/projects/mxxru/) 1.6.11 or above.

## Obtaining

### Cloning of Hg Repository

```
hg clone https://bitbucket.org/sobjectizerteam/spdlog_mxxru-1.1
```
And then:
```
cd spdlog_mxxru-1.1
mxxruexternals
```
to download and extract *spdlog_mxxru*'s dependencies.

### MxxRu::externals recipe

For *spdlog_mxxru* itself:
~~~~~
::ruby
MxxRu::arch_externals :cppformat_mxxru do |e|
  e.url 'https://bitbucket.org/sobjectizerteam/spdlog_mxxru-1.1/get/v.1.1.0.tar.bz2'

  e.map_dir 'dev/spdlog_mxxru' => 'dev'
end
~~~~~
For *spdlog* dependencies:
~~~~~
::ruby
MxxRu::git_externals :spdlog do |e|
  e.url 'https://github.com/gabime/spdlog.git'
  e.commit 'a79a045'

  e.map_dir 'include' => 'dev/spdlog'
end
~~~~~

## Compilation

Compilation must be performed via Mxx_ru:
```
hg clone https://bitbucket.org/sobjectizerteam/spdlog_mxxru-1.1
cd spdlog_mxxru-1.1
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
