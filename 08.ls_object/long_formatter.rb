# frozen_string_literal: true
require_relative 'file_info'

class LongFormatter
  def initialize(file_infos)
    @file_infos = file_infos
  end

  def output
    puts "total #{calc_total_blocks}"
    @file_infos.each do |file_info|
      print arrange_file_type(file_info.file_type)

      print "#{arrange_file_permission(file_info.file_permission[0])}#{arrange_file_permission(file_info.file_permission[1])}#{arrange_file_permission(file_info.file_permission[2])}"

      print File.lstat(file_info.file).nlink

      print file_info.owner
      print file_info.group

      print file_info.file_size

      print file_info.file_mtime.strftime('%-m %-d %R')

      if File.lstat(file_info.file).symlink?
        print "#{file_info.file} -> #{File.readlink(file_info.file)}"
      else
        print file_info.file
      end
      print "\n"
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

  def arrange_file_permission(file_permission)
    {
      "7" => "rwx",
     "6" => "rw-",
     "5" => "r-x",
     "4" => "r--",
     "3" => "-wx",
     "2" => "-w-",
     "1" => "--x",
     "0" => "---"
    }[file_permission]
  end

end
