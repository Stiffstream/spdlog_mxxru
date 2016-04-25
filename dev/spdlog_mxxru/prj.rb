require 'rubygems'

require 'mxx_ru/cpp'

MxxRu::Cpp::composite_target {

  include_path( 'spdlog/include', MxxRu::Cpp::Target::OPT_UPSPREAD )

  if 'gcc' == toolset.name || 'clang' == toolset.name
    global_linker_option( "-pthread" )
  end
}

