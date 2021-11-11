# frozen_string_literal: true

class FileList
  def initialize(a_opt, r_opt)
    @all_list = a_opt #true/falseが入る
    @reverse_list = r_opt #true/falseが入る
  end

  def decide_files
    # まず-aオプション分岐で中身を決める
    files = @all_list ? Dir.glob("*", File::FNM_DOTMATCH) : Dir.glob("*")
    # そこから-rオプション分岐で順番を決める
    @reverse_list ? files.sort.reverse : files.sort
  end
end
