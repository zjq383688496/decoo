class Product < ActiveRecord::Base
  attr_accessible :bh, :color_id, :image_url, :title, :weight,:upload_picture,:memo

  has_many :specs ,:dependent=>:destroy

  @@storage_path =  "#{Rails.root}/public/products"

  def upload_picture=(picture_field)
    self.image_url=uploadFile(picture_field)
  end

  protected

  def uploadFile(file)
    if !file.original_filename.empty?
      @filename=getFileName(file.original_filename)
      File.open("#{Rails.root}/public/products/#{@filename}", "wb") do |f|
      f.write(file.read)
      end
      return @filename
    end
  end

  def getFileName(filename)
    timestamp = DateTime.now.strftime("%y%m%d%H%M%S")
    ascii = ''
    if filename =~ %r{^[a-zA-Z0-9_\.\-]*$}
      ascii = filename
    else
      ascii = Digest::MD5.hexdigest(filename)
      # keep the extension if any
      ascii << $1 if filename =~ %r{(\.[a-zA-Z0-9]+)$}
    end
    while File.exist?(File.join(@@storage_path, "#{timestamp}_#{ascii}"))
      timestamp.succ!
    end
    "#{timestamp}_#{ascii}"
  end
  
end
