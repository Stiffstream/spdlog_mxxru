require 'mxx_ru/cpp'

MxxRu::Cpp::exe_target {

  target( "sample.usage" )

  cpp_source( "main.cpp" )

  required_prj( "spdlog/prj.rb" )
}
