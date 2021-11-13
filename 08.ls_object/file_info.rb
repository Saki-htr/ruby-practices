# frozen_string_literal: true
require 'etc'

class FileInfo
  attr_reader :file
  def initialize(file)
    @file = file
  end

  def blocks
    File.lstat(@file).blocks
  end

  def file_type
    File.lstat(@file).ftype
  end

  def file_permission
    File.lstat(@file).mode.to_s(8)[-3,3].chars
  end

  def hard_links
    File.lstat(@file).nlink
  end

  def owner
    Etc.getpwuid(File.stat(@file).uid).name
  end

  def group
    Etc.getgrgid(File.stat(@file).gid).name
  end

  def file_size
    File.lstat(@file).size
  end

  def file_mtime
    File.mtime(@file)
  end
end

