#!/usr/bin/ruby
gem 'Mxx_ru', '>= 1.3.0'

require 'mxx_ru/cpp'

MxxRu::Cpp::composite_target( MxxRu::BUILD_ROOT ) {

  toolset.force_cpp14
  global_include_path '.'

  if FileTest.exist?( "local-build.rb" )
    required_prj "local-build.rb"
  else
    default_runtime_mode( MxxRu::Cpp::RUNTIME_RELEASE )
    MxxRu::enable_show_brief
  end

  if MxxRu::Cpp::RUNTIME_RELEASE == mxx_runtime_mode
    global_linker_option( "-O3" )
    global_linker_option( "-flto" )
  end

  required_prj 'sample/usage/prj.rb'
}
