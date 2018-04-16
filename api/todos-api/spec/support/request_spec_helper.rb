module RequestSpecHelper

  # JSONのリクエストをrubyのハッシュにパースする
  def json
    JSON.parse(response.body)
  end

end
