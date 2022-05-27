# Introducing the TempSMS22 gem

## Usage

    require 'tempsms22'

    sms = TempSMS22.new
    sms.number #=> "447938556403"
    a = sms.read.first
    #=> {:from=>"Bolt", :text=>"\nCopied from receive-smss 447938556403\n", :date=>"13 minutes ago "} 


## Resources

* https://rubygems.org/gems/tempsms22

tempsms22 tempsms sms temp
