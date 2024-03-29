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

