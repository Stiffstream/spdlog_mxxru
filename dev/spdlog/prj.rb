require 'rubygems'

require 'mxx_ru/cpp'

MxxRu::Cpp::composite_target {

  include_path( 'spdlog/include', MxxRu::Cpp::Target::OPT_UPSPREAD )

  if 'gcc' == toolset.name || 'clang' == toolset.name
    global_linker_option( "-pthread" )
    if MxxRu::Cpp::RUNTIME_RELEASE == mxx_runtime_mode
      global_linker_option( "-O3" )
      global_linker_option( "-flto" )
    end
  end
}

