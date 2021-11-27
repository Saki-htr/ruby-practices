# frozen_string_literal: true

class FileList
  def initialize(all_list, reverse_list)
    @all_list = all_list
    @reverse_list = reverse_list
  end

  def decide_files
    files = @all_list ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    @reverse_list ? files.sort.reverse : files.sort
  end
end
