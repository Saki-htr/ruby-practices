# frozen_string_literal: true

require_relative 'file_info'

class ShortFormatter
  def initialize(file_infos)
    @file_infos = file_infos
  end

  def output
    @file_infos.each_with_index do |file_info, index|
      index += 1
      print file_info.file.ljust(15) + ' ' * 2
      print "\n" if (index % 6).zero?
    end
  end
end
