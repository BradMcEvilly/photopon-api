#                          _
#   __ _ _ __ ___ ___   __| | ___
#  / _` | '__/ __/ _ \ / _` |/ _ \
# | (_| | | | (_| (_) | (_| |  __/
#  \__, |_|  \___\___/ \__,_|\___|
#     |_|
class Photopon::QRCode < Sinatra::Base
  get '/' do
    data = 'http://photopon.co/qr/#/'
    data += params[:company]
    data += '/' + (params[:location] || 'all')
    size = 400
    size = params[:size].to_i if params.key?(:size)
    size = [size, 128].max
    offset = inset = size / 3

    # TODO: validate location belongs to company
    # TODO: validate referrer
    # TODO: authenticate user?

    qr = RQRCode::QRCode.new(data, level: :h)
    logo = ChunkyPNG::Image.from_file('assets/qrlogo.png')
    # TODO? fix this if logo not square
    # TODO: pre-resize logo to desired size
    result = qr.to_img
               .resize(size, size)
               .compose(logo.resize(inset, inset), offset, offset)

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

    result.to_blob
  end
end
