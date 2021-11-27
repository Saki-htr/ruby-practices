# frozen_string_literal: true

require_relative 'file_info'

class LongFormatter
  def initialize(file_infos)
    @file_infos = file_infos
  end

  def output
    puts "total #{calc_total_blocks}"
    @file_infos.each do |file_info|
      array = []
      ftype = arrange_type(file_info.type)
      owner_permission = arrange_permission(file_info.permission[0])
      group_permission = arrange_permission(file_info.permission[1])
      other_permission = arrange_permission(file_info.permission[2])

      array << "#{ftype}#{owner_permission}#{group_permission}#{other_permission}"
      array << file_info.hard_links.to_s.rjust(2)
      array << file_info.owner
      array << file_info.group
      array << file_info.file_size.to_s.rjust(5)
      array << arrange_mtime(file_info.file_mtime)
      array << (File.lstat(file_info.file).symlink? ? "#{file_info.file} -> #{File.readlink(file_info.file)}" : file_info.file)

      print array.join("\s")
      print "\n"
    end
  end

  private

  def calc_total_blocks
    @file_infos.map do |file_info|
      File.lstat(file_info.file).blocks
    end.sum
  end

  def arrange_type(type)
    { 'directory' => 'd', 'file' => '-', 'link' => 'l' }[type]
  end

  def arrange_permission(permission)
    {
      '7' => 'rwx',
      '6' => 'rw-',
      '5' => 'r-x',
      '4' => 'r--',
      '3' => '-wx',
      '2' => '-w-',
      '1' => '--x',
      '0' => '---'
    }[permission]
  end

  def arrange_mtime(mtime)
    month = mtime.strftime('%-m').rjust(2)
    date = mtime.strftime('%-d').rjust(2)
    time = mtime.strftime('%R')
    [month, date, time]
  end
end
