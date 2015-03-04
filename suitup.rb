require 'sqlite3'
require 'json'
db_file = 'C:\Program Files (x86)\Thunder Network\Thunder\Profiles\TaskDb.dat'
puts db_file
db = SQLite3::Database.new db_file
tasks = {}
db.execute( "select _rowid_, UserData from AccelerateTaskMap153066190_superspeed_1_1" ) do |row|
  j = JSON.parse row[1]
  p j["Result"]
  j["Result"] = 0
  tasks[row[0]] = j
end
p '*'*10
tasks.each do |id, value|
p id
p value

#db.execute("update AccelerateTaskMap153066190_superspeed_1_1 set UserData = :data where _rowid_ = :rowid", {"data"=>value, "rowid"=>id})
ps = db.prepare("update AccelerateTaskMap153066190_superspeed_1_1 set UserData = :data where _rowid_ = :rowid")
ps.execute('data'=>value.to_json, 'rowid'=>id)
#db.execute("select _rowid_ from AccelerateTaskMap153066190_superspeed_1_1 where _rowid_ = ?", i) do |dd|
#p dd
#end 
end
p '='*10
db.execute( "select _rowid_, UserData from AccelerateTaskMap153066190_superspeed_1_1" ) do |row|
  j = JSON.parse row[1]
  p j["Result"]
end