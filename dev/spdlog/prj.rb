require 'rubygems'

require 'mxx_ru/cpp'

MxxRu::Cpp::composite_target {

  include_path( 'spdlog/include', Mxx_ru::Cpp::Target::OPT_UPSPREAD )

  if "unix" == toolset.tag( "target_os" )
    global_linker_option( "-pthread" )
    global_linker_option( "-O3" )
    global_linker_option( "-flto" )
  end
}

