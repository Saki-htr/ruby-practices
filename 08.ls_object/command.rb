# frozen_string_literal: true

require 'optparse'
require_relative 'file_list'

class LsCommand
  def main
    options = ARGV.getopts('arl')
    options
    files = FileList.new(options['a'],options['r']).decide_files
    files

  #file_listをインスタンス作成に使って、lオプションに必要な情報を取得するクラスを作る
  #lオプションならLongFormatter呼び出し、それ以外はShortFormatter呼び出す
  end
end

LsCommand.new.main
