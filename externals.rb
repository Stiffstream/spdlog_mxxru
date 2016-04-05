gem 'Mxx_ru', '>= 1.6.8'
require 'mxx_ru/externals'

MxxRu::git_externals :spdlog do |e|
  e.url 'https://github.com/gabime/spdlog.git'
  e.commit 'a79a045'

  e.map_dir 'include' => 'dev/spdlog'
end

