require("pg")

class Bkmrk

  attr_reader(:title, :category, :link, :details)

  def initialize(params)
    @title = params["title"]
    @category = params["category"]
    @link = params["link"]
    @details = params["details"]
  end

  def save()
    sql = "INSERT INTO bkmrk
    ( title,
      category,
      link,
      details)
    VALUES
    ('#{@title}',
      '#{@category}',
      '#{@link}',
      '#{@details}'
      );"
    Bkmrk.db(sql)
  end




  def self.find(id)
    sql = "SELECT * FROM bkmrk
    WHERE id=#{id};"
    sql_return = Bkmrk.sql(sql)
    found = Bkmrk.new(sql_return[0])
  end

  def self.index
    sql = "SELECT * FROM bkmrk;"
    bkmrks_table = Bkmrk.db(sql)
    array_bkmrks = bkmrks_table.map {|bkmrk| Bkmrk.new(bkmrk)}
    return array_bkmrks
  end


  private# => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => # => all below are private - cannot end private block - ruby is weird.

  def self.db(sql)
    begin
      db = PG.connect({dbname: "bkmrk_site", host: "localhost"})
      sql_return = db.exec(sql)
      return sql_return
    ensure
      db.close
    end
  end

end

