#                          _
#   __ _ _ __ ___ ___   __| | ___
#  / _` | '__/ __/ _ \ / _` |/ _ \
# | (_| | | | (_| (_) | (_| |  __/
#  \__, |_|  \___\___/ \__,_|\___|
#     |_|

class Photopon::QRCode < Sinatra::Base
  get '/:company_id' do |company_id|
    binding.pry
  end
end