# frozen_string_literal: true

class FileList
  def initialize(a_opt, r_opt)
    @all_list = a_opt
    @reverse_list = r_opt
  end

  def decide_files
    files = @all_list ? Dir.glob('*', File::FNM_DOTMATCH) : Dir.glob('*')
    @reverse_list ? files.sort.reverse : files.sort
  end
end
