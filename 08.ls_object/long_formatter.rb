# frozen_string_literal: true
require_relative 'file_info'

class LongFormatter
  def initialize(file_infos)
    @file_infos = file_infos
  end

  def output
    puts "total #{calc_total_blocks}"
    @file_infos.each do |file_info|
      puts arrange_file_type(file_info.file_type)
    end
  end


  private
  def calc_total_blocks
    @file_infos.map do |file_info|
      File.lstat(file_info.file).blocks
    end.sum
  end

  def arrange_file_type(file_type)
    {"directory" => "d","file" => "-","link" => "l"}[file_type]
  end
end
