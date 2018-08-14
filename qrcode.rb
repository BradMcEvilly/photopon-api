#                          _
#   __ _ _ __ ___ ___   __| | ___
#  / _` | '__/ __/ _ \ / _` |/ _ \
# | (_| | | | (_| (_) | (_| |  __/
#  \__, |_|  \___\___/ \__,_|\___|
#     |_|

require 'sinatra'

SIZE = 400
OFFSET = SIZE / 3
INSET = SIZE / 3
LOGO = ChunkyPNG::Image.from_file('qrlogo.png').resize(INSET, INSET)

get '/' do
  data = 'http://photopon.co/'
  data += "qr/#/#{params[:company]}/#{params[:location] || 'all'}" unless params.keys.empty?

  if params.key? :download
    # are these all really necessary?
    headers \
      'Pragma' => 'public',
      'Expires' => '0',
      'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
      'Content-Type' => 'application/octet-stream',
      'Content-Disposition' => 'attachment;filename=qrcode.png',
      'Content-Transfer-Encoding' => 'binary'
  else
    content_type 'image/png'
  end

  RQRCode::QRCode.new(data, level: :h).to_img
                 .resize(SIZE, SIZE)
                 .compose(LOGO, OFFSET, OFFSET)
                 .to_blob
end
