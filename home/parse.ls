require! <[fs]>


src = [ 
  <[art.xml 藝文]>,
  <[economics.xml 經濟]>,
  <[envir.xml 環境]>,
  <[justice.xml 司法]>,
  <[local.xml 地方]>,
  <[media.xml 媒體]>,
  <[tech.xml 科技]>,
  <[china.xml 中國]>,
  <[entertain.xml 娛樂]>,
  <[global.xml 國際]>,
  <[life.xml 生活]>,
  <[main.xml 要聞]>,
  <[politics.xml 政治]>,
]

data = []
for s in src =>
  lines = fs.read-file-sync "data/#{s.0}" .to-string!split \\n
  obj = {}
  desc = ""
  for line in lines
    #if /([^\]]+)..><\/description>/.exec line => obj.desc = desc + that.1
    #else if desc => desc += line
    #if /<description>...CDATA.([^\]]+)..><\/description>/.exec line => obj.desc = desc + that.1
    if /<title>([^\]]+)<\/title>/.exec line => obj.title = that.1
    if /<link>([^\]]+)<\/link>/.exec line => obj.link = that.1
    if /<pubDate>(.+)<\/pubDate>/.exec line => obj.date = that.1
    if obj.title and obj.link and obj.date =>
      obj.cat = s.1
      data.push obj
      desc = ""
      obj = {}

fs.write-file-sync \news.json, JSON.stringify data
