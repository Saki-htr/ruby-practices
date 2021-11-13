# frozen_string_literal: true

require 'optparse'
require_relative 'file_list'
require_relative 'file_info'
require_relative 'long_formatter'
require_relative 'short_formatter'

class LsCommand
  def self.main
    options = ARGV.getopts('arl')
    files = FileList.new(options['a'], options['r']).decide_files
    file_infos = files.map { |file| FileInfo.new(file) }
    options['l'] ? LongFormatter.new(file_infos).output : ShortFormatter.new(file_infos).output
  end
end

LsCommand.main
