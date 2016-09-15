module Statistics

  def geo_ip
    if GeoIp.exists? ip_address: request.remote_ip
      GeoIp.find_by_ip_address(request.remote_ip).increment! :count
    else
      GeoIp.new({:ip_address => request.remote_ip, :count => 1}).save
    end
  end

end
