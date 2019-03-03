class UrlParser
  attr_accessor :path
  def initialize(new_url)
    @new_url = new_url

  end

  def scheme
    @new_url.split(":")[0]
  end

  def domain
    @new_url.split(":")[1].split("//")[1]
  end

  def port
  domain = @new_url.split("//")[1].split("/")[0]
  if domain.include?(":")
    domain.split(":")[1]
  else
     scheme = self.scheme
    if scheme == "http"
      "80"
    elsif scheme == "https"
      "443"
    end
  end
end

  def path
    path = @new_url.split("/")[3].split("?")[0]
    if path.empty?
      nil
    else
      path
    end
  end

  def query_string
    query_hash = {}
    str = @new_url.split("?")[1].split("#")[0]
    pairs = str.split("&")
    pairs.each do |pair|
      pair = pair.split("=")
      query_hash[pair[0]] = pair[1]
    end

    query_hash

  end

  def fragment_id
    @new_url.split("#")[1]
  end

end
