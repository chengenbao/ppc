require 'ppc/api'
require 'ppc/operation'
module PPC
  VERSION = "1.0.7"

  protected
  def print_debug(var,varname=nil)
    puts '=' * 10 + varname.to_s + '=' * 10
    if var.is_a? String
      puts var
    else
      ap var
    end
    puts '=' * 10 + varname.to_s + '=' * 10
  end
end
