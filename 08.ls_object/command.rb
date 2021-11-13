# frozen_string_literal: true

require 'optparse'
require_relative 'file_list'
require_relative 'file_info'
require_relative 'long_formatter'
require_relative 'short_formatter'


class LsCommand
  def main
    options = ARGV.getopts('arl')
    options
    files = FileList.new(options['a'],options['r']).decide_files

   #file_listをインスタンス作成に使って、lオプションに必要な情報を取得するクラスを作る
    file_infos = files.map { |file| FileInfo.new(file)}
    formatter = if options['l']
      LongFormatter.new(file_infos).output
    else
      ShortFormatter.new(file_infos).output
    end

   #lオプションならLongFormatter呼び出し、それ以外はShortFormatter呼び出す
  end
end

LsCommand.new.main
