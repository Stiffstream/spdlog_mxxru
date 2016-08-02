require 'rubygems'

require 'mxx_ru/cpp'

MxxRu::Cpp::composite_target {

  include_path( 'spdlog/include', MxxRu::Cpp::Target::OPT_UPSPREAD )
  define( 'SPDLOG_FMT_EXTERNAL', MxxRu::Cpp::Target::OPT_UPSPREAD )

  required_prj( 'fmt_mxxru/prj.rb' )

  if 'gcc' == toolset.name || 'clang' == toolset.name
    global_linker_option( "-pthread" )
  end
}

